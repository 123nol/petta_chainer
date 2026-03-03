!(import! &self ../benchgen_pln_compare)

!(BenchGenerateWithPrint demoCompare
   (depth 2)
   (width 2)
   (paths 1)
   (noise-factor 0)
   (backward-ratio 0)
   (backward-chain-len 3)
   (forward-chain-len 3)
   (print false))

!(BenchTimedTargetProvedCompare demoCompare 1 20)
