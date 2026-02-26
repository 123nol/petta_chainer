!(import! &self benchgen_metta)

!(BenchGenerate demoSmallA 3 1 1 0)

; Query-focused benchmark check: target is reachable only at sufficient step budget.
!(collapse (query 2 kb (: $prf (BenchTarget demoSmallA 1) $tv)))
!(collapse (query 30 kb (: $prf (BenchTarget demoSmallA 1) $tv)))
