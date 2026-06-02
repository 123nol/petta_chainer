#!/usr/bin/env python3
"""
main_pipeline.py

Full orchestration pipeline:

  Stage 1 — Mathlib Mining
    Fetches real Mathlib4 HTML documentation pages, parses class inheritance
    relationships and theorem signatures using BeautifulSoup, and writes the
    structured output to mathlib_implications.json.

  Stage 2 — AtomSpace Generation
    Converts the mined JSON relationships into PeTTaChainer-compatible
    S-expressions (mathlib_implications.metta) using the exact same format
    as the Metamath-to-PeTTaChainer parser:
      !(compileadd kb (: (no_inverse ...) (Implication (Premises (Provable ...))
                                                        (Conclusions (Provable ...)))
                        (STV 1.0 1.0)))

  Stage 3 — Pantograph Essentialization (Priority 1)
    Connects to a running Lean 4 Pantograph server, applies a tactic to a
    goal, and converts the resulting AST subgoals into PeTTaChainer turnstile
    queries:   (|- (HYPS ...) goal)

Usage:
    python main_pipeline.py [--skip-mathlib] [--skip-pantograph]

Flags:
    --skip-mathlib     Skip Stage 1+2 (use existing mathlib_implications.json)
    --skip-pantograph  Skip Stage 3 (no Lean 4 / Pantograph required)
"""

import argparse
import os
import sys
import subprocess


# ─── Stage 1a: Mathlib HTML download ───────────────────────────────────────

def run_crawl_stage(max_modules: int = 200):
    print("=" * 60)
    print("Stage 1a: Crawling Mathlib HTML documentation pages...")
    print("=" * 60)
    result = subprocess.run([sys.executable, "crawl_mathlib.py", "--max", str(max_modules)], capture_output=False)
    if result.returncode != 0:
        print("[!] crawl_mathlib.py failed. Aborting.")
        sys.exit(1)


# ─── Stage 1 + 2: Mathlib extraction and AtomSpace generation ─────────────────

def run_mathlib_stage():
    print("=" * 60)
    print("Stage 1: Extracting real Mathlib documentation...")
    print("=" * 60)
    result = subprocess.run([sys.executable, "extract_mathlib.py"], capture_output=False)
    if result.returncode != 0:
        print("[!] extract_mathlib.py failed. Aborting.")
        sys.exit(1)

    print()
    print("=" * 60)
    print("Stage 2: Generating Metamath-compatible AtomSpace (.metta)...")
    print("=" * 60)
    result = subprocess.run([sys.executable, "generate_atomspace.py"], capture_output=False)
    if result.returncode != 0:
        print("[!] generate_atomspace.py failed. Aborting.")
        sys.exit(1)


# ─── Stage 3: Pantograph Essentialization ────────────────────────────────────

def run_pantograph_stage():
    print()
    print("=" * 60)
    print("Stage 3: Essentializing Lean 4 goals via Pantograph...")
    print("=" * 60)

    try:
        from pantograph.server import Server
    except ImportError:
        print("[!] 'pantograph' package not found. Install it or skip with --skip-pantograph.")
        return

    from enum import Enum
    from petta_chainer.essentialize import essentialize_subgoal

    print("Connecting to Lean 4 via Pantograph...")
    try:
        server = Server(imports=["Init"], options={"printExprAST": True})
    except Exception as e:
        print(f"[!] Error starting Pantograph server: {e}")
        print("    Ensure Lean 4 and the 'pantograph' package are installed.")
        return

    # Example goal — replace with your target theorem as needed
    goal_expr = "forall (p q : Prop), Or p q -> Or q p"
    print(f"\nGoal: {goal_expr}")

    res0 = server.run("goal.start", {"expr": goal_expr})
    state_id = res0.get("stateId") or res0.get("state_id")

    print("Applying tactic: intro")
    res1 = server.run("goal.tactic", {"stateId": state_id, "tactic": "intro"})
    if "error" in res1:
        res1 = server.run("goal.tactic", {"stateId": state_id, "tactic": "intro p q"})

    print("\n--- Essentialized S-Expressions for PeTTaChainer ---")
    goals = res1.get("goals", [])
    if not goals:
        print("[!] No subgoals returned from Pantograph.")
    for i, goal_data in enumerate(goals):
        sexpr = essentialize_subgoal(goal_data)
        print(f"\nGoal {i}:")
        print(f"  {sexpr}")

    print()
    print("These queries can be matched against the Metamath/Mathlib AtomSpace rules.")
    print("Mathlib rules file : mathlib_implications.metta")


# ─── Entry point ─────────────────────────────────────────────────────────────

def main():
    parser = argparse.ArgumentParser(description="Essentialization Layer — Full Pipeline")
    parser.add_argument(
        "--skip-mathlib",
        action="store_true",
        help="Skip Mathlib extraction and AtomSpace generation (use existing JSON)",
    )
    parser.add_argument(
        "--skip-pantograph",
        action="store_true",
        help="Skip Pantograph / Lean 4 essentialization stage",
    )
    args = parser.parse_args()

    if not args.skip_mathlib:
        if not os.path.exists("mathlib_cache") or not os.listdir("mathlib_cache"):
            print("[*] Mathlib cache is empty. Fetching documentation pages before extraction.")
            run_crawl_stage(max_modules=200)
        run_mathlib_stage()
    else:
        print("[*] Skipping Mathlib stages (using existing mathlib_implications.json).")

    if not args.skip_pantograph:
        run_pantograph_stage()
    else:
        print("[*] Skipping Pantograph stage.")

    print()
    print("=" * 60)
    print("Pipeline complete.")
    print("  Mined rules  : mathlib_implications.metta")
    print("  Mined graph  : mathlib_implications.json  (Neo4j: load_to_neo4j.py)")
    print("=" * 60)


if __name__ == "__main__":
    main()
