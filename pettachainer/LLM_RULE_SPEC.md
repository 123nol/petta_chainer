# PeTTaChainer LLM Rule Spec

This spec is intentionally helper-first.
It focuses on forms that `compile` rewrites and that an LLM should generate.

## Core Output Forms

- Add fact or rule:

```metta
!(compileadd kb (: proof-id type tv))
```

- Query:

```metta
!(query steps kb (: $prf type $tv))
```

## Rule Template

```metta
!(compileadd kb (: ruleName
    (Implication
        (Premises
            premise1
            premise2)
        (Conclusions
            conclusion1))
    (STV 1.0 1.0)))
```

## Premise Helpers You Should Use

Use these high-level helpers. Do not emit internal `CPU ...Formula` forms.

### Compute

```metta
(Compute f (arg1 arg2 ...) -> $out)
```

### Not

```metta
(Not expr)
```

### GreaterThan / >

```metta
(GreaterThan (DistFactA ...) 5)
(GreaterThan (DistFactA ...) (DistFactB ...))
```

### MapDist

```metta
(MapDist f (DistFactA ...) -> $outDist)
```

### Map2Dist

```metta
(Map2Dist f (DistFactA ...) (DistFactB ...) -> $outDist)
```

### AverageDist

```metta
(AverageDist (DistFactPattern ...) -> $outDist)
```

### FoldAll / FoldAllValue

```metta
(FoldAll pattern value init fold-fn -> out)
(FoldAllValue pattern value init fold-fn -> out)
```

## TV Modeling Rules

- `STV` is truth uncertainty only.
- Distribution TVs (`ParticleDist`, `NatDist`, `FloatDist`) are value uncertainty.
- For uncertain numeric values, use distribution TVs.

Good:

```metta
(: h1 (HeightDist g1 alice) (PointMass 160.0))
(: h2 (HeightDist g1 bob) (ParticleFromNormal 170.0 2.0))
```

Avoid encoding numeric values in `STV` strength for measurement semantics.

## Distribution Constructors

```metta
(PointMass x)
(ParticleFromNormal mu sigma)
(ParticleFromPairs ((x1 w1) (x2 w2) ...))
```

## Example: Average Height Rule

```metta
!(compileadd kb (: avgHeightDistRule
    (Implication
        (Premises
            (Group $g)
            (AverageDist (HeightDist $g $person) -> $avgDist))
        (Conclusions
            (AvgHeightDist $g)))
    (STV 1.0 1.0)))

!(query 20 kb (: $prf (AvgHeightDist g1) $avgDist))
```

## Example: Rectangle Area Rule

```metta
!(compileadd kb (: areaDistRule
    (Implication
        (Premises
            (Rectangle $rect)
            (Map2Dist * (LengthDist $rect) (WidthDist $rect) -> $areaDist))
        (Conclusions
            (AreaDist $rect)))
    (STV 1.0 1.0)))

!(query 20 kb (: $prf (AreaDist rectA) $areaDist))
```
