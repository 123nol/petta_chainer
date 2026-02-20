#!/usr/bin/env python3
from __future__ import annotations

import argparse
import os
import random
from collections import deque
from pathlib import Path

from budget_selector import estimate_budget


def fmt_conf(v: float) -> str:
    s = f"{v:.3f}"
    s = s.rstrip("0").rstrip(".")
    if "." not in s:
        s += ".0"
    return s


def mixed_conf(count: int, rng: random.Random) -> list[float]:
    high_n = count // 2
    low_n = count - high_n
    vals = [rng.uniform(0.901, 0.999) for _ in range(high_n)]
    vals += [rng.uniform(0.800, 0.899) for _ in range(low_n)]
    rng.shuffle(vals)
    return vals


def pop_conf(buf: deque[float]) -> str:
    return fmt_conf(buf.popleft())


def deep_tree_levels(depth: int, branching: int) -> list[list[str]]:
    levels: list[list[str]] = []
    for level in range(depth + 1):
        width = branching**level
        levels.append([f"DeepTreeL{level}N{idx}" for idx in range(width)])
    return levels


def pln_implication_expr(premises: list[str], conclusion: str) -> str:
    expr = conclusion
    for premise in reversed(premises):
        expr = f"(Implication {premise} {expr})"
    return expr


def add_deep_tree_pq(lines: list[str], depth: int, branching: int) -> None:
    a = lines.append
    levels = deep_tree_levels(depth, branching)

    a("")
    a(";; Deep-proof-tree cancer path.")

    leaves = levels[-1]
    for idx, leaf in enumerate(leaves, start=1):
        a(f"!(bench-compileadd kb (: deepLeaf_{idx}")
        a("    (Implication")
        a("        (Premises")
        a("            (Inheritance $x (IntSet smokes)))")
        a("        (Conclusions")
        a(f"            (Inheritance $x (IntSet {leaf}))))")
        a("    (STV 0.6 0.9)))")

    rule_id = 1
    for level in range(depth - 1, -1, -1):
        parents = levels[level]
        children = levels[level + 1]
        for parent_idx, parent in enumerate(parents):
            start = parent_idx * branching
            node_children = children[start : start + branching]
            a(f"!(bench-compileadd kb (: deepMerge_{rule_id}")
            a("    (Implication")
            a("        (Premises")
            for child in node_children:
                a(f"            (Inheritance $x (IntSet {child}))")
            a("        )")
            a("        (Conclusions")
            a(f"            (Inheritance $x (IntSet {parent}))))")
            a("    (STV 0.6 0.9)))")
            rule_id += 1

    a("!(bench-compileadd kb (: deepToCancer")
    a("    (Implication")
    a("        (Premises")
    a(f"            (Inheritance $x (IntSet {levels[0][0]})))")
    a("        (Conclusions")
    a("            (Inheritance $x (IntSet cancerous))))")
    a("    (STV 0.6 0.9)))")


def add_deep_tree_pln(entries: list[str], sid: int, depth: int, branching: int) -> int:
    levels = deep_tree_levels(depth, branching)

    for leaf in levels[-1]:
        prem = "(Inheritance $x (IntSet smokes))"
        concl = f"(Inheritance $x (IntSet {leaf}))"
        entries.append(f"(Sentence ({pln_implication_expr([prem], concl)} (stv 0.6 0.9)) ({sid}))")
        sid += 1

    for level in range(depth - 1, -1, -1):
        parents = levels[level]
        children = levels[level + 1]
        for parent_idx, parent in enumerate(parents):
            start = parent_idx * branching
            node_children = children[start : start + branching]
            premises = [f"(Inheritance $x (IntSet {child}))" for child in node_children]
            conclusion = f"(Inheritance $x (IntSet {parent}))"
            entries.append(f"(Sentence ({pln_implication_expr(premises, conclusion)} (stv 0.6 0.9)) ({sid}))")
            sid += 1

    root = f"(Inheritance $x (IntSet {levels[0][0]}))"
    cancer = "(Inheritance $x (IntSet cancerous))"
    entries.append(f"(Sentence ({pln_implication_expr([root], cancer)} (stv 0.6 0.9)) ({sid}))")
    sid += 1

    return sid


def pq_file(
    unprovable_pairs: int,
    provable_pairs: int,
    unrelated_pairs: int,
    seed: int,
    variant: str = "standard",
    deep_depth: int = 4,
    deep_branching: int = 2,
    budget_calibration: float = 1.0,
) -> str:
    rng = random.Random(seed)
    total_pairs = unprovable_pairs + provable_pairs + unrelated_pairs

    u_rule = deque(mixed_conf(8 * unprovable_pairs, rng))
    u_fact = deque(mixed_conf(4 * unprovable_pairs, rng))
    p_rule = deque(mixed_conf(4 * provable_pairs, rng))
    p_fact = deque(mixed_conf(6 * provable_pairs, rng))
    x_rule = deque(mixed_conf(4 * unrelated_pairs, rng))
    x_fact = deque(mixed_conf(4 * unrelated_pairs, rng))

    depth = deep_depth if variant == "deep-proof-tree" else 1
    width = deep_branching if variant == "deep-proof-tree" else 1
    paths = (deep_branching**deep_depth) if variant == "deep-proof-tree" else 1
    paths += provable_pairs
    budget = estimate_budget(depth=depth, width=width, noise=total_pairs, paths=paths, calibration=budget_calibration)

    lines: list[str] = []
    a = lines.append
    a("!(import! &self (library lib_import))")
    a("!(import! &self ../petta_chainer)")
    a("")
    a("(= (bench-compileadd $kb $stmt)")
    a("   (let* (($atoms (collapse (mm2compile $kb $stmt)))")
    a("          ($satoms (superpose $atoms)))")
    a("     (add-atom &kb $satoms)))")
    a("")
    a(";; Base tuffy knowledge.")
    a("!(bench-compileadd kb (: ruleFriendSmoke")
    a("    (Implication")
    a("        (Premises")
    a("            (Inheritance (Product $x $y) friend)")
    a("            (Inheritance $x (IntSet smokes)))")
    a("        (Conclusions")
    a("            (Inheritance $y (IntSet smokes))))")
    a("    (STV 0.4 0.9)))")
    a("")
    if variant == "standard":
        a("!(bench-compileadd kb (: ruleSmokeCancer")
        a("    (Implication")
        a("        (Premises")
        a("            (Inheritance $x (IntSet smokes)))")
        a("        (Conclusions")
        a("            (Inheritance $x (IntSet cancerous))))")
        a("    (STV 0.6 0.9)))")
        a("")
    a("!(bench-compileadd kb (: f3 (Inheritance (Product Anna Bob) friend) (STV 1.0 0.9)))")
    a("!(bench-compileadd kb (: f4 (Inheritance (Product Anna Edward) friend) (STV 1.0 0.9)))")
    a("!(bench-compileadd kb (: f5 (Inheritance (Product Anna Frank) friend) (STV 1.0 0.9)))")
    a("!(bench-compileadd kb (: f6 (Inheritance (Product Edward Frank) friend) (STV 1.0 0.9)))")
    a("!(bench-compileadd kb (: f7 (Inheritance (Product Gary Helen) friend) (STV 1.0 0.9)))")
    a("!(bench-compileadd kb (: f8 (Inheritance (Product Gary Frank) friend) (STV 0.0 0.9)))")
    a("!(bench-compileadd kb (: f9 (Inheritance Anna (IntSet smokes)) (STV 1.0 0.9)))")
    a("!(bench-compileadd kb (: f10 (Inheritance Edward (IntSet smokes)) (STV 1.0 0.9)))")

    if variant == "deep-proof-tree":
        add_deep_tree_pq(lines, deep_depth, deep_branching)

    if unprovable_pairs > 0:
        a("")
        a(";; Unprovable query-shaped noise.")
    for i in range(1, unprovable_pairs + 1):
        pred = f"NoiseUPred{i}"
        tag = f"NoiseUTag{i}"
        hint = f"NoiseUHint{i}"
        seal = f"NoiseUSeal{i}"
        need_bridge = f"NoiseUNeedBridge{i}"
        ua = f"NoiseUA{i}"
        ub = f"NoiseUB{i}"
        uc = f"NoiseUC{i}"
        ud = f"NoiseUD{i}"

        a(f"!(bench-compileadd kb (: noiseUBack1_{i}")
        a(f"    (Implication (Premises (Inheritance (Product $k $x) {pred}) (Inheritance (Product $k $x) {tag}))")
        a(f"                 (Conclusions (Inheritance $x (IntSet {hint}))))")
        a(f"    (STV 0.2 {pop_conf(u_rule)})))")
        a(f"!(bench-compileadd kb (: noiseUBack2_{i}")
        a(f"    (Implication (Premises (Inheritance $x (IntSet {hint})) (Inheritance $x (IntSet {seal})))")
        a("                 (Conclusions (Inheritance $x (IntSet cancerous))))")
        a(f"    (STV 0.15 {pop_conf(u_rule)})))")
        a(f"!(bench-compileadd kb (: noiseUBack3_{i}")
        a(f"    (Implication (Premises (Inheritance (Product $k $x) {pred}) (Inheritance $x (IntSet {need_bridge})))")
        a(f"                 (Conclusions (Inheritance $x (IntSet {seal}))))")
        a(f"    (STV 0.2 {pop_conf(u_rule)})))")
        a(f"!(bench-compileadd kb (: noiseUBack4_{i}")
        a(f"    (Implication (Premises (Inheritance (Product $k $x) {tag}) (Inheritance $x (IntSet {need_bridge})))")
        a(f"                 (Conclusions (Inheritance $x (IntSet {seal}))))")
        a(f"    (STV 0.18 {pop_conf(u_rule)})))")
        a(f"!(bench-compileadd kb (: noiseUFwd1_{i}")
        a(f"    (Implication (Premises (Inheritance (Product $k $x) {pred}))")
        a(f"                 (Conclusions (Inheritance (Product $k $x) {ua})))")
        a(f"    (STV 0.5 {pop_conf(u_rule)})))")
        a(f"!(bench-compileadd kb (: noiseUFwd2_{i}")
        a(f"    (Implication (Premises (Inheritance (Product $k $x) {ua}) (Inheritance (Product $k $x) {tag}))")
        a(f"                 (Conclusions (Inheritance $x (IntSet {ub}))))")
        a(f"    (STV 0.4 {pop_conf(u_rule)})))")
        a(f"!(bench-compileadd kb (: noiseUFwd3_{i}")
        a(f"    (Implication (Premises (Inheritance $x (IntSet {ub})))")
        a(f"                 (Conclusions (Inheritance $x (IntSet {uc}))))")
        a(f"    (STV 0.45 {pop_conf(u_rule)})))")
        a(f"!(bench-compileadd kb (: noiseUFwd4_{i}")
        a(f"    (Implication (Premises (Inheritance $x (IntSet {uc})) (Inheritance $x (IntSet {seal})))")
        a(f"                 (Conclusions (Inheritance $x (IntSet {ud}))))")
        a(f"    (STV 0.35 {pop_conf(u_rule)})))")

        a(f"!(bench-compileadd kb (: ue{i}p (Inheritance (Product ue{i} Edward) {pred}) (STV 1.0 {pop_conf(u_fact)})))")
        a(f"!(bench-compileadd kb (: ue{i}t (Inheritance (Product ue{i} Edward) {tag}) (STV 1.0 {pop_conf(u_fact)})))")
        a(f"!(bench-compileadd kb (: ub{i}p (Inheritance (Product ub{i} Bob) {pred}) (STV 1.0 {pop_conf(u_fact)})))")
        a(f"!(bench-compileadd kb (: ub{i}t (Inheritance (Product ub{i} Bob) {tag}) (STV 1.0 {pop_conf(u_fact)})))")

    if provable_pairs > 0:
        a("")
        a(";; Provable noisy alternatives to the query.")
    for i in range(1, provable_pairs + 1):
        pred = f"NoisePPred{i}"
        tag = f"NoisePTag{i}"
        hint = f"NoisePHint{i}"
        seal = f"NoisePSeal{i}"
        bridge = f"NoisePBridge{i}"
        decoy = f"NoisePDecoy{i}"

        a(f"!(bench-compileadd kb (: noisePBack1_{i}")
        a(f"    (Implication (Premises (Inheritance (Product $k $x) {pred}))")
        a(f"                 (Conclusions (Inheritance $x (IntSet {hint}))))")
        a(f"    (STV 0.22 {pop_conf(p_rule)})))")
        a(f"!(bench-compileadd kb (: noisePBack2_{i}")
        a(f"    (Implication (Premises (Inheritance $x (IntSet {hint})) (Inheritance $x (IntSet {seal})))")
        a("                 (Conclusions (Inheritance $x (IntSet cancerous))))")
        a(f"    (STV 0.2 {pop_conf(p_rule)})))")
        a(f"!(bench-compileadd kb (: noisePBack3_{i}")
        a(f"    (Implication (Premises (Inheritance (Product $k $x) {tag}) (Inheritance $x (IntSet {bridge})))")
        a(f"                 (Conclusions (Inheritance $x (IntSet {seal}))))")
        a(f"    (STV 0.23 {pop_conf(p_rule)})))")
        a(f"!(bench-compileadd kb (: noisePBack4_{i}")
        a(f"    (Implication (Premises (Inheritance (Product $k $x) {pred}) (Inheritance $x (IntSet {bridge})))")
        a(f"                 (Conclusions (Inheritance $x (IntSet {decoy}))))")
        a(f"    (STV 0.19 {pop_conf(p_rule)})))")

        a(f"!(bench-compileadd kb (: pe{i}p (Inheritance (Product pe{i} Edward) {pred}) (STV 1.0 {pop_conf(p_fact)})))")
        a(f"!(bench-compileadd kb (: pe{i}t (Inheritance (Product pe{i} Edward) {tag}) (STV 1.0 {pop_conf(p_fact)})))")
        a(f"!(bench-compileadd kb (: pb{i}p (Inheritance (Product pb{i} Bob) {pred}) (STV 1.0 {pop_conf(p_fact)})))")
        a(f"!(bench-compileadd kb (: pb{i}t (Inheritance (Product pb{i} Bob) {tag}) (STV 1.0 {pop_conf(p_fact)})))")
        a(f"!(bench-compileadd kb (: pe{i}b (Inheritance Edward (IntSet {bridge})) (STV 1.0 {pop_conf(p_fact)})))")
        a(f"!(bench-compileadd kb (: pb{i}b (Inheritance Bob (IntSet {bridge})) (STV 1.0 {pop_conf(p_fact)})))")

    if unrelated_pairs > 0:
        a("")
        a(";; Completely unrelated noise.")
    for i in range(1, unrelated_pairs + 1):
        pred = f"NoiseXPred{i}"
        tag = f"NoiseXTag{i}"
        a1 = f"NoiseXA{i}"
        b1 = f"NoiseXB{i}"
        c1 = f"NoiseXC{i}"
        goal = f"NoiseXGoal{i}"

        a(f"!(bench-compileadd kb (: noiseXRule1_{i}")
        a(f"    (Implication (Premises (Inheritance (Product $k $x) {pred}))")
        a(f"                 (Conclusions (Inheritance (Product $k $x) {a1})))")
        a(f"    (STV 0.42 {pop_conf(x_rule)})))")
        a(f"!(bench-compileadd kb (: noiseXRule2_{i}")
        a(f"    (Implication (Premises (Inheritance (Product $k $x) {a1}) (Inheritance (Product $k $x) {tag}))")
        a(f"                 (Conclusions (Inheritance $x (IntSet {b1}))))")
        a(f"    (STV 0.37 {pop_conf(x_rule)})))")
        a(f"!(bench-compileadd kb (: noiseXRule3_{i}")
        a(f"    (Implication (Premises (Inheritance $x (IntSet {b1})))")
        a(f"                 (Conclusions (Inheritance $x (IntSet {c1}))))")
        a(f"    (STV 0.4 {pop_conf(x_rule)})))")
        a(f"!(bench-compileadd kb (: noiseXRule4_{i}")
        a(f"    (Implication (Premises (Inheritance $x (IntSet {c1})))")
        a(f"                 (Conclusions (Inheritance $x (IntSet {goal}))))")
        a(f"    (STV 0.36 {pop_conf(x_rule)})))")

        a(f"!(bench-compileadd kb (: xe{i}p (Inheritance (Product xe{i} Edward) {pred}) (STV 1.0 {pop_conf(x_fact)})))")
        a(f"!(bench-compileadd kb (: xe{i}t (Inheritance (Product xe{i} Edward) {tag}) (STV 1.0 {pop_conf(x_fact)})))")
        a(f"!(bench-compileadd kb (: xb{i}p (Inheritance (Product xb{i} Bob) {pred}) (STV 1.0 {pop_conf(x_fact)})))")
        a(f"!(bench-compileadd kb (: xb{i}t (Inheritance (Product xb{i} Bob) {tag}) (STV 1.0 {pop_conf(x_fact)})))")

    a("")
    a("!(let* (($start (current-time))")
    a(f"        ($res (collapse (query {budget.pq_steps} kb (: $prf (Inheritance Edward (IntSet cancerous)) $tv))))")
    a("        ($end (current-time)))")
    a("    (Found $res in (* (- $end $start) 1000) ms))")
    a("")
    return "\n".join(lines)


def pln_file(
    unprovable_pairs: int,
    provable_pairs: int,
    unrelated_pairs: int,
    seed: int,
    variant: str = "standard",
    deep_depth: int = 4,
    deep_branching: int = 2,
    budget_calibration: float = 1.0,
) -> str:
    rng = random.Random(seed)
    total_pairs = unprovable_pairs + provable_pairs + unrelated_pairs

    u_rule = deque(mixed_conf(8 * unprovable_pairs, rng))
    u_fact = deque(mixed_conf(4 * unprovable_pairs, rng))
    p_rule = deque(mixed_conf(4 * provable_pairs, rng))
    p_fact = deque(mixed_conf(6 * provable_pairs, rng))
    x_rule = deque(mixed_conf(4 * unrelated_pairs, rng))
    x_fact = deque(mixed_conf(4 * unrelated_pairs, rng))

    depth = deep_depth if variant == "deep-proof-tree" else 1
    width = deep_branching if variant == "deep-proof-tree" else 1
    paths = (deep_branching**deep_depth) if variant == "deep-proof-tree" else 1
    paths += provable_pairs
    budget = estimate_budget(depth=depth, width=width, noise=total_pairs, paths=paths, calibration=budget_calibration)

    entries: list[str] = []

    def add(entry: str) -> None:
        entries.append(entry)

    add("(Sentence ((Implication (Inheritance (Product $1 $2) friend) (Implication (Inheritance $1 (IntSet smokes)) (Inheritance $2 (IntSet smokes)))) (stv 0.4 0.9)) (1))")
    if variant == "standard":
        add("(Sentence ((Implication (Inheritance $1 (IntSet smokes)) (Inheritance $1 (IntSet cancerous))) (stv 0.6 0.9)) (2))")
    add("(Sentence ((Inheritance (Product Anna Bob) friend) (stv 1.0 0.9)) (3))")
    add("(Sentence ((Inheritance (Product Anna Edward) friend) (stv 1.0 0.9)) (4))")
    add("(Sentence ((Inheritance (Product Anna Frank) friend) (stv 1.0 0.9)) (5))")
    add("(Sentence ((Inheritance (Product Edward Frank) friend) (stv 1.0 0.9)) (6))")
    add("(Sentence ((Inheritance (Product Gary Helen) friend) (stv 1.0 0.9)) (7))")
    add("(Sentence ((Inheritance (Product Gary Frank) friend) (stv 0.0 0.9)) (8))")
    add("(Sentence ((Inheritance Anna (IntSet smokes)) (stv 1.0 0.9)) (9))")
    add("(Sentence ((Inheritance Edward (IntSet smokes)) (stv 1.0 0.9)) (10))")

    sid = 100

    if variant == "deep-proof-tree":
        sid = add_deep_tree_pln(entries, sid, deep_depth, deep_branching)

    for i in range(1, unprovable_pairs + 1):
        pred = f"NoiseUPred{i}"
        tag = f"NoiseUTag{i}"
        hint = f"NoiseUHint{i}"
        seal = f"NoiseUSeal{i}"
        need_bridge = f"NoiseUNeedBridge{i}"
        ua = f"NoiseUA{i}"
        ub = f"NoiseUB{i}"
        uc = f"NoiseUC{i}"
        ud = f"NoiseUD{i}"

        add(f"(Sentence ((Implication (Inheritance (Product $k $x) {pred}) (Implication (Inheritance (Product $k $x) {tag}) (Inheritance $x (IntSet {hint})))) (stv 0.2 {pop_conf(u_rule)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Implication (Inheritance $x (IntSet {hint})) (Implication (Inheritance $x (IntSet {seal})) (Inheritance $x (IntSet cancerous)))) (stv 0.15 {pop_conf(u_rule)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Implication (Inheritance (Product $k $x) {pred}) (Implication (Inheritance $x (IntSet {need_bridge})) (Inheritance $x (IntSet {seal})))) (stv 0.2 {pop_conf(u_rule)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Implication (Inheritance (Product $k $x) {tag}) (Implication (Inheritance $x (IntSet {need_bridge})) (Inheritance $x (IntSet {seal})))) (stv 0.18 {pop_conf(u_rule)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Implication (Inheritance (Product $k $x) {pred}) (Inheritance (Product $k $x) {ua})) (stv 0.5 {pop_conf(u_rule)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Implication (Inheritance (Product $k $x) {ua}) (Implication (Inheritance (Product $k $x) {tag}) (Inheritance $x (IntSet {ub})))) (stv 0.4 {pop_conf(u_rule)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Implication (Inheritance $x (IntSet {ub})) (Inheritance $x (IntSet {uc}))) (stv 0.45 {pop_conf(u_rule)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Implication (Inheritance $x (IntSet {uc})) (Implication (Inheritance $x (IntSet {seal})) (Inheritance $x (IntSet {ud})))) (stv 0.35 {pop_conf(u_rule)})) ({sid}))")
        sid += 1

        add(f"(Sentence ((Inheritance (Product ue{i} Edward) {pred}) (stv 1.0 {pop_conf(u_fact)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Inheritance (Product ue{i} Edward) {tag}) (stv 1.0 {pop_conf(u_fact)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Inheritance (Product ub{i} Bob) {pred}) (stv 1.0 {pop_conf(u_fact)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Inheritance (Product ub{i} Bob) {tag}) (stv 1.0 {pop_conf(u_fact)})) ({sid}))")
        sid += 1

    for i in range(1, provable_pairs + 1):
        pred = f"NoisePPred{i}"
        tag = f"NoisePTag{i}"
        hint = f"NoisePHint{i}"
        seal = f"NoisePSeal{i}"
        bridge = f"NoisePBridge{i}"
        decoy = f"NoisePDecoy{i}"

        add(f"(Sentence ((Implication (Inheritance (Product $k $x) {pred}) (Inheritance $x (IntSet {hint}))) (stv 0.22 {pop_conf(p_rule)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Implication (Inheritance $x (IntSet {hint})) (Implication (Inheritance $x (IntSet {seal})) (Inheritance $x (IntSet cancerous)))) (stv 0.2 {pop_conf(p_rule)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Implication (Inheritance (Product $k $x) {tag}) (Implication (Inheritance $x (IntSet {bridge})) (Inheritance $x (IntSet {seal})))) (stv 0.23 {pop_conf(p_rule)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Implication (Inheritance (Product $k $x) {pred}) (Implication (Inheritance $x (IntSet {bridge})) (Inheritance $x (IntSet {decoy})))) (stv 0.19 {pop_conf(p_rule)})) ({sid}))")
        sid += 1

        add(f"(Sentence ((Inheritance (Product pe{i} Edward) {pred}) (stv 1.0 {pop_conf(p_fact)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Inheritance (Product pe{i} Edward) {tag}) (stv 1.0 {pop_conf(p_fact)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Inheritance (Product pb{i} Bob) {pred}) (stv 1.0 {pop_conf(p_fact)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Inheritance (Product pb{i} Bob) {tag}) (stv 1.0 {pop_conf(p_fact)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Inheritance Edward (IntSet {bridge})) (stv 1.0 {pop_conf(p_fact)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Inheritance Bob (IntSet {bridge})) (stv 1.0 {pop_conf(p_fact)})) ({sid}))")
        sid += 1

    for i in range(1, unrelated_pairs + 1):
        pred = f"NoiseXPred{i}"
        tag = f"NoiseXTag{i}"
        a1 = f"NoiseXA{i}"
        b1 = f"NoiseXB{i}"
        c1 = f"NoiseXC{i}"
        goal = f"NoiseXGoal{i}"

        add(f"(Sentence ((Implication (Inheritance (Product $k $x) {pred}) (Inheritance (Product $k $x) {a1})) (stv 0.42 {pop_conf(x_rule)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Implication (Inheritance (Product $k $x) {a1}) (Implication (Inheritance (Product $k $x) {tag}) (Inheritance $x (IntSet {b1})))) (stv 0.37 {pop_conf(x_rule)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Implication (Inheritance $x (IntSet {b1})) (Inheritance $x (IntSet {c1}))) (stv 0.4 {pop_conf(x_rule)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Implication (Inheritance $x (IntSet {c1})) (Inheritance $x (IntSet {goal}))) (stv 0.36 {pop_conf(x_rule)})) ({sid}))")
        sid += 1

        add(f"(Sentence ((Inheritance (Product xe{i} Edward) {pred}) (stv 1.0 {pop_conf(x_fact)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Inheritance (Product xe{i} Edward) {tag}) (stv 1.0 {pop_conf(x_fact)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Inheritance (Product xb{i} Bob) {pred}) (stv 1.0 {pop_conf(x_fact)})) ({sid}))")
        sid += 1
        add(f"(Sentence ((Inheritance (Product xb{i} Bob) {tag}) (stv 1.0 {pop_conf(x_fact)})) ({sid}))")
        sid += 1

    lines: list[str] = []
    a = lines.append
    a("!(import! &self lib_pln_custom)")
    a("")
    a("(= (STV (Concept Anna)) (stv 0.1667 0.9))")
    a("(= (STV (Concept Bob)) (stv 0.1667 0.9))")
    a("(= (STV (Concept Edward)) (stv 0.1667 0.9))")
    a("(= (STV (Concept Frank)) (stv 0.1667 0.9))")
    a("(= (STV (Concept Gary)) (stv 0.1667 0.9))")
    a("(= (STV (Concept Helen)) (stv 0.1667 0.9))")
    a("")
    a("(= (kb)")
    a("   (")
    for e in entries:
        a(f"    {e}")
    a("   ))")
    a("")
    a("!(let* (($start (current-time))")
    a(
        "        ($res (PLN.Query (kb) (Inheritance Edward (IntSet cancerous)) "
        f"{budget.pln_maxsteps} {budget.task_queue} {budget.belief_queue}))"
    )
    a("        ($end (current-time)))")
    a("    (Found $res in (* (- $end $start) 1000) ms))")
    a("")
    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate tunable tuffy benchmark files")
    parser.add_argument("--pairs", type=int, default=None, help="deprecated alias for --unprovable-pairs")
    parser.add_argument("--unprovable-pairs", type=int, default=20, help="query-shaped but unprovable noise size")
    parser.add_argument("--provable-pairs", type=int, default=0, help="query-shaped and provable noise size")
    parser.add_argument("--unrelated-pairs", type=int, default=0, help="completely unrelated noise size")
    parser.add_argument("--seed", type=int, default=1337, help="random seed for confidence generation")
    parser.add_argument(
        "--variant",
        choices=("standard", "deep-proof-tree"),
        default="standard",
        help="benchmark variant to generate",
    )
    parser.add_argument("--deep-depth", type=int, default=4, help="deep-proof-tree depth")
    parser.add_argument("--deep-branching", type=int, default=2, help="deep-proof-tree branching factor")
    parser.add_argument(
        "--budget-calibration",
        type=float,
        default=None,
        help="optional multiplier override for automatic budget selection",
    )
    parser.add_argument("--outdir", type=Path, default=Path(__file__).resolve().parent, help="output directory")
    args = parser.parse_args()

    unprovable_pairs = args.unprovable_pairs if args.pairs is None else args.pairs
    provable_pairs = args.provable_pairs
    unrelated_pairs = args.unrelated_pairs

    if unprovable_pairs < 0 or provable_pairs < 0 or unrelated_pairs < 0:
        raise SystemExit("all pair parameters must be >= 0")
    if args.deep_depth < 1:
        raise SystemExit("--deep-depth must be >= 1")
    if args.deep_branching < 1:
        raise SystemExit("--deep-branching must be >= 1")

    env_calibration = os.environ.get("PETTA_BENCH_BUDGET_CALIBRATION")
    calibration = args.budget_calibration
    if calibration is None and env_calibration is not None:
        calibration = float(env_calibration)
    if calibration is None:
        calibration = 1.0
    if calibration <= 0:
        raise SystemExit("budget calibration must be > 0")

    outdir = args.outdir
    outdir.mkdir(parents=True, exist_ok=True)

    suffix = "" if args.variant == "standard" else "_deep_tree"
    pq_path = outdir / f"tuffy_pq_bench_noise_tunable{suffix}.metta"
    pln_path = outdir / f"tuffy_pln_bench_noise_tunable{suffix}.metta"

    pq_path.write_text(
        pq_file(
            unprovable_pairs,
            provable_pairs,
            unrelated_pairs,
            args.seed,
            args.variant,
            args.deep_depth,
            args.deep_branching,
            calibration,
        ),
        encoding="utf-8",
    )
    pln_path.write_text(
        pln_file(
            unprovable_pairs,
            provable_pairs,
            unrelated_pairs,
            args.seed,
            args.variant,
            args.deep_depth,
            args.deep_branching,
            calibration,
        ),
        encoding="utf-8",
    )

    print(f"Wrote {pq_path}")
    print(f"Wrote {pln_path}")
    print(
        "unprovable_pairs="
        f"{unprovable_pairs} provable_pairs={provable_pairs} unrelated_pairs={unrelated_pairs} "
        f"seed={args.seed} variant={args.variant} deep_depth={args.deep_depth} "
        f"deep_branching={args.deep_branching} budget_calibration={calibration}"
    )


if __name__ == "__main__":
    main()
