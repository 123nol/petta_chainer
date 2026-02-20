#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import re
import statistics
import subprocess
from pathlib import Path

from budget_selector import estimate_budget


FOUND_RE = re.compile(r"\(Found .* in ([0-9]+(?:\.[0-9]+)?) ms\)")
FOUND_RESULT_RE = re.compile(r"\(Found\s+(.*)\s+in\s+[0-9]+(?:\.[0-9]+)?\s+ms\)", re.DOTALL)


def run_once(workdir: Path, metta_file: Path) -> float:
    cp = subprocess.run(
        ["petta", str(metta_file)],
        cwd=workdir,
        capture_output=True,
        text=True,
        check=True,
    )
    txt = cp.stdout + cp.stderr
    m = FOUND_RE.findall(txt)
    if not m:
        raise RuntimeError(f"No timing line found in output for {metta_file}")
    return float(m[-1])


def run_once_with_output(workdir: Path, metta_file: Path) -> tuple[float, str]:
    cp = subprocess.run(
        ["petta", str(metta_file)],
        cwd=workdir,
        capture_output=True,
        text=True,
        check=True,
    )
    txt = cp.stdout + cp.stderr
    m = FOUND_RE.findall(txt)
    if not m:
        raise RuntimeError(f"No timing line found in output for {metta_file}")
    return float(m[-1]), txt


def assert_pq_correctness(output: str, target: str) -> None:
    matches = FOUND_RESULT_RE.findall(output)
    if not matches:
        raise AssertionError("PQ correctness failed: missing query result payload")
    result = matches[-1].strip()
    if result in ("", "()", "[]"):
        raise AssertionError("PQ correctness failed: empty query result")
    if target not in result:
        raise AssertionError(f"PQ correctness failed: target not present in result ({target})")


def estimate_case_budget(
    variant: str,
    pairs: int,
    provable_pairs: int,
    unrelated_pairs: int,
    deep_depth: int,
    deep_branching: int,
    calibration: float,
) -> tuple[int, int, int]:
    depth = deep_depth if variant == "deep-proof-tree" else 1
    width = deep_branching if variant == "deep-proof-tree" else 1
    paths = (deep_branching**deep_depth) if variant == "deep-proof-tree" else 1
    paths += provable_pairs
    budget = estimate_budget(
        depth=depth,
        width=width,
        noise=pairs + provable_pairs + unrelated_pairs,
        paths=paths,
        calibration=calibration,
    )
    return budget.pq_steps, budget.task_queue, budget.belief_queue


def summarize(values: list[float]) -> tuple[float, float, float, float]:
    return (
        statistics.mean(values),
        statistics.median(values),
        min(values),
        max(values),
    )


def fmt_ms(v: float) -> str:
    return f"{v:.3f}"


def parse_int_series(raw: str, name: str) -> list[int]:
    vals = [int(x.strip()) for x in raw.split(",") if x.strip()]
    if not vals:
        raise ValueError(f"{name} must contain at least one integer")
    if any(v < 0 for v in vals):
        raise ValueError(f"{name} values must be >= 0")
    return vals


def align_series(vals: list[int], n: int, name: str) -> list[int]:
    if len(vals) == 1:
        return vals * n
    if len(vals) == n:
        return vals
    raise ValueError(f"{name} must have length 1 or match --pairs length ({n})")


def main() -> None:
    parser = argparse.ArgumentParser(description="Sweep tunable tuffy noise scale and compare PLN vs PQ")
    parser.add_argument("--pairs", default="4,8,12,16,20", help="comma-separated decoy pair counts")
    parser.add_argument("--provable-pairs", default="0", help="comma-separated provable noisy pair counts")
    parser.add_argument("--unrelated-pairs", default="0", help="comma-separated unrelated noisy pair counts")
    parser.add_argument(
        "--variant",
        choices=("standard", "deep-proof-tree"),
        default="standard",
        help="benchmark variant to generate",
    )
    parser.add_argument("--deep-depth", type=int, default=4, help="deep-proof-tree depth")
    parser.add_argument("--deep-branching", type=int, default=2, help="deep-proof-tree branching factor")
    parser.add_argument("--runs", type=int, default=5, help="number of timing runs per case")
    parser.add_argument("--seed", type=int, default=1337, help="base random seed")
    parser.add_argument("--budget-calibration", type=float, default=1.0, help="budget calibration multiplier")
    parser.add_argument("--pq-target", default="Inheritance Edward (IntSet cancerous)", help="substring expected in PQ proof/result")
    parser.add_argument(
        "--check-pq-correctness",
        action=argparse.BooleanOptionalAction,
        default=True,
        help="validate non-empty PQ result and expected target substring",
    )
    parser.add_argument("--csv", type=Path, default=None, help="optional CSV output path")
    args = parser.parse_args()

    repo = Path(__file__).resolve().parents[3]
    bench_dir = Path(__file__).resolve().parent

    pair_values = parse_int_series(args.pairs, "--pairs")
    provable_values = align_series(parse_int_series(args.provable_pairs, "--provable-pairs"), len(pair_values), "--provable-pairs")
    unrelated_values = align_series(parse_int_series(args.unrelated_pairs, "--unrelated-pairs"), len(pair_values), "--unrelated-pairs")

    baseline_pln = bench_dir / "tuffy_pln_bench.metta"
    baseline_pq = bench_dir / "tuffy_pq_bench.metta"

    rows: list[dict[str, str]] = []

    print(f"runs_per_case={args.runs}")
    if args.variant != "standard":
        print(f"variant={args.variant} deep_depth={args.deep_depth} deep_branching={args.deep_branching}")

    # Baseline first.
    for label, fpath in (("PLN baseline", baseline_pln), ("PQ baseline", baseline_pq)):
        vals = [run_once(repo, fpath) for _ in range(args.runs)]
        mean, med, vmin, vmax = summarize(vals)
        print(f"{label}: mean={fmt_ms(mean)}ms median={fmt_ms(med)}ms min={fmt_ms(vmin)}ms max={fmt_ms(vmax)}ms")
        rows.append(
            {
                "case": label,
                "pairs": "0",
                "provable_pairs": "0",
                "unrelated_pairs": "0",
                "runs": str(args.runs),
                "mean_ms": fmt_ms(mean),
                "median_ms": fmt_ms(med),
                "min_ms": fmt_ms(vmin),
                "max_ms": fmt_ms(vmax),
            }
        )

    for idx, pairs in enumerate(pair_values):
        provable_pairs = provable_values[idx]
        unrelated_pairs = unrelated_values[idx]
        base_seed = args.seed + idx * 1000
        suffix = "" if args.variant == "standard" else "_deep_tree"
        pln_file = bench_dir / f"tuffy_pln_bench_noise_tunable{suffix}.metta"
        pq_file = bench_dir / f"tuffy_pq_bench_noise_tunable{suffix}.metta"

        pln_vals: list[float] = []
        pq_vals: list[float] = []

        for run_idx in range(args.runs):
            run_seed = base_seed + run_idx
            subprocess.run(
                [
                    "python",
                    str(bench_dir / "generate_tuffy_tunable.py"),
                    "--unprovable-pairs",
                    str(pairs),
                    "--provable-pairs",
                    str(provable_pairs),
                    "--unrelated-pairs",
                    str(unrelated_pairs),
                    "--seed",
                    str(run_seed),
                    "--variant",
                    args.variant,
                    "--deep-depth",
                    str(args.deep_depth),
                    "--deep-branching",
                    str(args.deep_branching),
                    "--budget-calibration",
                    str(args.budget_calibration),
                    "--outdir",
                    str(bench_dir),
                ],
                cwd=repo,
                check=True,
                capture_output=True,
                text=True,
            )
            pln_vals.append(run_once(repo, pln_file))
            pq_ms, pq_output = run_once_with_output(repo, pq_file)
            if args.check_pq_correctness:
                assert_pq_correctness(pq_output, args.pq_target)
            pq_vals.append(pq_ms)

        p_mean, p_med, p_min, p_max = summarize(pln_vals)
        q_mean, q_med, q_min, q_max = summarize(pq_vals)

        ratio = p_mean / q_mean if q_mean > 0 else float("inf")
        pq_steps, taskq, beliefq = estimate_case_budget(
            args.variant,
            pairs,
            provable_pairs,
            unrelated_pairs,
            args.deep_depth,
            args.deep_branching,
            args.budget_calibration,
        )
        print(
            f"pairs={pairs} provable={provable_pairs} unrelated={unrelated_pairs} seed_base={base_seed}: "
            f"PLN mean={fmt_ms(p_mean)}ms, PQ mean={fmt_ms(q_mean)}ms, PLN/PQ={ratio:.2f}x, "
            f"budgets[pq_steps={pq_steps},taskq={taskq},beliefq={beliefq}]"
        )

        rows.append(
            {
                "case": "PLN tunable noisy",
                "pairs": str(pairs),
                "provable_pairs": str(provable_pairs),
                "unrelated_pairs": str(unrelated_pairs),
                "runs": str(args.runs),
                "mean_ms": fmt_ms(p_mean),
                "median_ms": fmt_ms(p_med),
                "min_ms": fmt_ms(p_min),
                "max_ms": fmt_ms(p_max),
            }
        )
        rows.append(
            {
                "case": "PQ tunable noisy",
                "pairs": str(pairs),
                "provable_pairs": str(provable_pairs),
                "unrelated_pairs": str(unrelated_pairs),
                "runs": str(args.runs),
                "mean_ms": fmt_ms(q_mean),
                "median_ms": fmt_ms(q_med),
                "min_ms": fmt_ms(q_min),
                "max_ms": fmt_ms(q_max),
            }
        )

    if args.csv is not None:
        out = args.csv
        out.parent.mkdir(parents=True, exist_ok=True)
        with out.open("w", newline="", encoding="utf-8") as f:
            w = csv.DictWriter(
                f,
                fieldnames=[
                    "case",
                    "pairs",
                    "provable_pairs",
                    "unrelated_pairs",
                    "runs",
                    "mean_ms",
                    "median_ms",
                    "min_ms",
                    "max_ms",
                ],
            )
            w.writeheader()
            w.writerows(rows)
        print(f"wrote_csv={out}")


if __name__ == "__main__":
    main()
