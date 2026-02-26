!(import! &self benchgen_metta)

; Depth semantics: generated chain has exactly depth-indexed main rules.
!(BenchGenerate benchDepth2 2 2 1 0)
!(BenchGenerate benchDepth4 4 2 1 0)

!(test
    (not (==
           (collapse (match &kb (: (kb MAIN ())
                                   (bench-main-meta benchDepth2 1 2)
                                   (BenchMainRule benchDepth2 1 2 2)
                                   (STV 1.0 1.0))
                            yes))
           ()))
    true)

!(test
    (==
      (collapse (match &kb (: (kb MAIN ())
                              (bench-main-meta benchDepth2 1 3)
                              (BenchMainRule benchDepth2 1 3 2)
                              (STV 1.0 1.0))
                       yes))
      ())
    true)

!(test
    (not (==
           (collapse (match &kb (: (kb MAIN ())
                                   (bench-main-meta benchDepth4 1 4)
                                   (BenchMainRule benchDepth4 1 4 2)
                                   (STV 1.0 1.0))
                            yes))
           ()))
    true)

!(test
    (==
      (collapse (match &kb (: (kb MAIN ())
                              (bench-main-meta benchDepth4 1 5)
                              (BenchMainRule benchDepth4 1 5 2)
                              (STV 1.0 1.0))
                       yes))
      ())
    true)

; Width semantics: gate facts encode premises-per-rule (width-1 gate premises).
!(BenchGenerate benchWidth1 3 1 1 0)
!(BenchGenerate benchWidth3 3 3 1 0)

!(test
    (==
      (collapse (match &kb (: (kb MAIN ())
                              (bench-gate-fact benchWidth1 1 1 1)
                              (BenchGate benchWidth1 1 1 1)
                              (STV 1.0 1.0))
                       yes))
      ())
    true)

!(test
    (not (==
           (collapse (match &kb (: (kb MAIN ())
                                   (bench-gate-fact benchWidth3 1 1 2)
                                   (BenchGate benchWidth3 1 1 2)
                                   (STV 1.0 1.0))
                            yes))
           ()))
    true)

!(test
    (not (==
           (is-member (: (bench-main-rule benchWidth1 1 3) (BenchTarget benchWidth1 1) (STV 1.0 1.0))
                      (collapse (query 30 kb (: $prf (BenchTarget benchWidth1 1) $tv))))
           ()))
    true)

!(test
    (not (==
           (is-member (: (bench-main-rule benchWidth3 1 3) (BenchTarget benchWidth3 1) (STV 1.0 1.0))
                      (collapse (query 30 kb (: $prf (BenchTarget benchWidth3 1) $tv))))
           ()))
    true)

; Paths semantics: successful target derivations exist exactly for generated paths.
!(BenchGenerate benchPaths1 2 2 1 0)
!(BenchGenerate benchPaths3 2 2 3 0)

!(test
    (not (==
           (collapse (match &kb (: (kb MAIN ())
                                   (bench-main-meta benchPaths1 1 2)
                                   (BenchMainRule benchPaths1 1 2 2)
                                   (STV 1.0 1.0))
                            yes))
           ()))
    true)

!(test
    (==
      (collapse (match &kb (: (kb MAIN ())
                              (bench-main-meta benchPaths1 2 2)
                              (BenchMainRule benchPaths1 2 2 2)
                              (STV 1.0 1.0))
                       yes))
      ())
    true)

!(test
    (not (==
           (collapse (match &kb (: (kb MAIN ())
                                   (bench-main-meta benchPaths3 1 2)
                                   (BenchMainRule benchPaths3 1 2 2)
                                   (STV 1.0 1.0))
                            yes))
           ()))
    true)

!(test
    (not (==
           (collapse (match &kb (: (kb MAIN ())
                                   (bench-main-meta benchPaths3 2 2)
                                   (BenchMainRule benchPaths3 2 2 2)
                                   (STV 1.0 1.0))
                            yes))
           ()))
    true)

!(test
    (not (==
           (collapse (match &kb (: (kb MAIN ())
                                   (bench-main-meta benchPaths3 3 2)
                                   (BenchMainRule benchPaths3 3 2 2)
                                   (STV 1.0 1.0))
                            yes))
           ()))
    true)

!(test
    (==
      (collapse (match &kb (: (kb MAIN ())
                              (bench-main-meta benchPaths3 4 2)
                              (BenchMainRule benchPaths3 4 2 2)
                              (STV 1.0 1.0))
                       yes))
      ())
    true)

; Noise semantics: disconnected noise namespace is present, target namespace unchanged.
!(BenchGenerate benchNoise0 2 2 2 0)
!(BenchGenerate benchNoise4 2 2 2 4)

!(test
    (==
      (collapse (match &kb (: (kb MAIN ())
                              (bench-noise-seed benchNoise0 1)
                              (NoiseSeed benchNoise0 1)
                              (STV 1.0 1.0))
                       yes))
      ())
    true)

!(test
    (not (==
           (collapse (match &kb (: (kb MAIN ())
                                   (bench-noise-seed benchNoise4 4)
                                   (NoiseSeed benchNoise4 4)
                                   (STV 1.0 1.0))
                            yes))
           ()))
    true)

!(test
    (==
      (collapse (match &kb (: (kb MAIN ())
                              (bench-noise-seed benchNoise4 5)
                              (NoiseSeed benchNoise4 5)
                              (STV 1.0 1.0))
                       yes))
      ())
    true)

!(test
    (not (==
           (collapse (match &kb (: (kb MAIN ())
                                   (bench-main-meta benchNoise0 1 2)
                                   (BenchMainRule benchNoise0 1 2 2)
                                   (STV 1.0 1.0))
                            yes))
           ()))
    true)

!(test
    (not (==
           (collapse (match &kb (: (kb MAIN ())
                                   (bench-main-meta benchNoise4 1 2)
                                   (BenchMainRule benchNoise4 1 2 2)
                                   (STV 1.0 1.0))
                            yes))
           ()))
    true)

; Determinism and no-duplicates: one generation result, exact artifact counts.
!(test
    (==
      (BenchListCount (collapse (BenchGenerate benchNoDup 2 3 2 1)))
      1)
    true)

!(test
    (==
      (BenchMainRuleCount benchNoDup)
      4)
    true)

!(test
    (==
      (BenchMainRuleWidthCount benchNoDup 3)
      4)
    true)

!(test
    (==
      (BenchSeedStateCount benchNoDup)
      2)
    true)

!(test
    (==
      (BenchGateFactCount benchNoDup)
      8)
    true)

!(test
    (==
      (BenchNoiseFactCount benchNoDup)
      1)
    true)

!(test
    (==
      (BenchNoiseRuleCount benchNoDup)
      1)
    true)


!(test
    (==
      (collapse (match &kb (: (kb MAIN ())
                              (bench-main-meta benchNoise4 3 2)
                              (BenchMainRule benchNoise4 3 2 2)
                              (STV 1.0 1.0))
                       yes))
      ())
    true)
