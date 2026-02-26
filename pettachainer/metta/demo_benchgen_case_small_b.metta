!(import! &self benchgen_metta)

!(BenchGenerate demoSmallB 3 3 2 1)

; Step-budgeted queries and multi-path reachability for inference benchmarking.
!(collapse (query 2 kb (: $prf (BenchTarget demoSmallB 1) $tv)))
!(collapse (query 30 kb (: $prf (BenchTarget demoSmallB 1) $tv)))
!(collapse (query 30 kb (: $prf (BenchTarget demoSmallB 2) $tv)))
