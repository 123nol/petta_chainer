# MeTTa Synthetic Benchmark Generator Spec

This document defines the semantics and construction algorithm for the MeTTa-native benchmark generator in `pettachainer/metta/benchgen_metta.metta`.

## Formal Semantics (Exact)

For a generated benchmark instance `(BenchGenerate <bench> depth width paths noise)`:

1. `depth` = number of rule applications needed to derive `(BenchTarget <bench> <path-id>)` from seed facts on any successful path. Every successful path requires exactly `depth` applications.
2. `width` = number of premises in each main-chain rule. Every main rule has exactly `width` premises.
3. `paths` = number of distinct successful derivation paths to the target pattern `(BenchTarget <bench> $path-id)`, measured as the number of reachable distinct `$path-id` bindings.
4. `noise` = number of disconnected distractor units; each unit adds exactly:
   - one extra fact: `(NoiseSeed <bench> i)`
   - one extra rule: `(NoiseSeed <bench> i) -> (NoiseDerived <bench> i)`
   These noise predicates are namespace-disconnected from `BenchState`, `BenchGate`, and `BenchTarget`.

## Construction Algorithm

For each path `p` in `1..paths`:

- Add seed fact `(BenchState <bench> p 0)`.
- For each chain step `s` in `1..depth`:
  - Add `width - 1` gate seed facts `(BenchGate <bench> p s g)` for `g in 1..(width-1)`.
  - Add one main rule with premises:
    - `(BenchState <bench> p (s-1))`
    - all gate facts `(BenchGate <bench> p s g)`
  - Main rule conclusion:
    - `(BenchState <bench> p s)` if `s < depth`
    - `(BenchTarget <bench> p)` if `s = depth`

This guarantees exact depth and width per path and exact path count across all successful derivations.

Then for each noise index `i` in `1..noise`, add one disconnected noise fact and one disconnected noise rule.

## Utility Predicates

The module includes utilities for validation and tests:

- `BenchMainRuleCount`
- `BenchMainRuleWidthCount`
- `BenchSeedStateCount`
- `BenchGateFactCount`
- `BenchNoiseFactCount`
- `BenchNoiseRuleCount`
- `BenchTargetProved?`
- `BenchTargetPathCount`

## Minimal Example

```metta
!(import! &self benchgen_metta)
!(BenchGenerate demoA 2 3 2 1)

; depth=2: not provable in 1 step, provable in 2
!(BenchTargetProved? demoA 1 1)
!(BenchTargetProved? demoA 1 2)

; paths=2
!(BenchTargetPathCount demoA 2)
```

Expected interpretation:

- Each target path needs exactly 2 rule applications.
- Each main rule has exactly 3 premises.
- Two distinct target bindings are derivable.
- One disconnected noise fact and one disconnected noise rule are present.
