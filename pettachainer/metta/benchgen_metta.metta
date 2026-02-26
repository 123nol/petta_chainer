!(import! &self petta_chainer)

(= (BenchListCount ()) 0)
(= (BenchListCount (cons $_x $tail))
   (+ 1 (BenchListCount $tail)))

(= (BenchValidParams? $depth $width $paths $noise)
   (and (>= $depth 1)
        (and (>= $width 1)
             (and (>= $paths 1)
                  (>= $noise 0)))))

(= (BenchGatePremises $bench $path $step $width $slot)
   (if (>= $slot $width)
       ()
       (cons (BenchGate $bench $path $step $slot)
             (BenchGatePremises $bench $path $step $width (+ $slot 1)))))

(= (BenchMainPremises $bench $path $step $width)
   (cons (BenchState $bench $path (- $step 1))
         (BenchGatePremises $bench $path $step $width 1)))

(= (BenchStepConclusion $bench $path $step $depth)
   (if (== $step $depth)
       (BenchTarget $bench $path)
       (BenchState $bench $path $step)))

(= (BenchAddSeedState $bench $path)
   (let $_ (collapse (compileadd kb (: (bench-seed-state $bench $path)
                                       (BenchState $bench $path 0)
                                       (STV 1.0 1.0))))
        done))

(= (BenchAddGateFact $bench $path $step $slot)
   (let $_ (collapse (compileadd kb (: (bench-gate-fact $bench $path $step $slot)
                                       (BenchGate $bench $path $step $slot)
                                       (STV 1.0 1.0))))
        done))

(= (BenchGenerateGateFactsRemaining $bench $path $step $slot $remaining)
   (if (== $remaining 0)
       done
       (let $_ (BenchAddGateFact $bench $path $step $slot)
            (BenchGenerateGateFactsRemaining $bench $path $step (+ $slot 1) (- $remaining 1)))))

(= (BenchGenerateGateFacts $bench $path $step $width)
   (BenchGenerateGateFactsRemaining $bench $path $step 1 (- $width 1)))

(= (BenchAddMainRule $bench $path $step $depth $width)
   (let* (($premises (BenchMainPremises $bench $path $step $width))
          ($conclusion (BenchStepConclusion $bench $path $step $depth))
          ($rule-type (Implication
                        (cons Premises $premises)
                        (cons Conclusions (cons $conclusion ())))))
      (let $_meta (collapse (compileadd kb (: (bench-main-meta $bench $path $step)
                                              (BenchMainRule $bench $path $step $width)
                                              (STV 1.0 1.0))))
           (let $_prem-meta (collapse (compileadd kb (: (bench-main-premise-meta $bench $path $step)
                                                        (BenchMainPremiseCount $bench $path $step $width)
                                                        (STV 1.0 1.0))))
                (let $_rule (collapse (compileadd kb (: (bench-main-rule $bench $path $step)
                                                        $rule-type
                                                        (STV 1.0 1.0))))
                     done)))))

(= (BenchGeneratePathStepsRemaining $bench $path $step $remaining $depth $width)
   (if (== $remaining 0)
       done
       (let $_gates (BenchGenerateGateFacts $bench $path $step $width)
            (let $_rule (BenchAddMainRule $bench $path $step $depth $width)
                 (BenchGeneratePathStepsRemaining $bench $path (+ $step 1) (- $remaining 1) $depth $width)))))

(= (BenchGeneratePathSteps $bench $path $depth $width)
   (BenchGeneratePathStepsRemaining $bench $path 1 $depth $depth $width))

(= (BenchGeneratePathsRemaining $bench $path $remaining-paths $depth $width)
   (if (== $remaining-paths 0)
       done
       (let $_seed (BenchAddSeedState $bench $path)
            (let $_steps (BenchGeneratePathSteps $bench $path $depth $width)
                 (BenchGeneratePathsRemaining $bench (+ $path 1) (- $remaining-paths 1) $depth $width)))))

(= (BenchGeneratePaths $bench $paths $depth $width)
   (BenchGeneratePathsRemaining $bench 1 $paths $depth $width))

(= (BenchGenerateNoiseRemaining $bench $idx $remaining)
   (if (== $remaining 0)
       done
       (let $_fact (collapse (compileadd kb
                                  (: (bench-noise-seed $bench $idx)
                                     (NoiseSeed $bench $idx)
                                     (STV 1.0 1.0))))
            (let $noise-rule (Implication
                               (Premises (NoiseSeed $bench $idx))
                               (Conclusions (NoiseDerived $bench $idx)))
                 (let $_rule (collapse (compileadd kb
                                          (: (bench-noise-rule $bench $idx)
                                             $noise-rule
                                             (STV 1.0 1.0))))
                      (let $_meta (collapse (compileadd kb
                                            (: (bench-noise-rule-meta $bench $idx)
                                               (BenchNoiseRule $bench $idx)
                                               (STV 1.0 1.0))))
                           (BenchGenerateNoiseRemaining $bench (+ $idx 1) (- $remaining 1))))))))

(= (BenchGenerateNoise $bench $noise)
   (BenchGenerateNoiseRemaining $bench 1 $noise))

(= (BenchGenerate $bench $depth $width $paths $noise)
   (if (BenchValidParams? $depth $width $paths $noise)
       (let $_spec (collapse (compileadd kb (: (bench-spec $bench)
                                               (BenchSpec $bench $depth $width $paths $noise)
                                               (STV 1.0 1.0))))
            (let $_paths (BenchGeneratePaths $bench $paths $depth $width)
                 (let $_noise (BenchGenerateNoise $bench $noise)
                      (BenchmarkGenerated $bench $depth $width $paths $noise))))
       (BenchGenerateError invalid-params $bench $depth $width $paths $noise)))

(= (BenchMainRuleCount $bench)
   (BenchListCount
     (collapse (match &kb
                (: $_kb (bench-main-meta $bench $_path $_step) (BenchMainRule $bench $_path $_step $_width) $_tv)
                ok))))

(= (BenchMainRuleWidthCount $bench $width)
   (BenchListCount
     (collapse (match &kb
                (: $_kb (bench-main-meta $bench $_path $_step) (BenchMainRule $bench $_path $_step $width) $_tv)
                ok))))

(= (BenchSeedStateCount $bench)
   (BenchListCount
     (collapse (match &kb
                (: $_kb (bench-seed-state $bench $_path) (BenchState $bench $_path 0) $_tv)
                ok))))

(= (BenchGateFactCount $bench)
   (BenchListCount
     (collapse (match &kb
                (: $_kb (bench-gate-fact $bench $_path $_step $_slot) (BenchGate $bench $_path $_step $_slot) $_tv)
                ok))))

(= (BenchNoiseFactCount $bench)
   (BenchListCount
     (collapse (match &kb
                (: $_kb (bench-noise-seed $bench $_idx) (NoiseSeed $bench $_idx) $_tv)
                ok))))

(= (BenchNoiseRuleCount $bench)
   (BenchListCount
     (collapse (match &kb
                (: $_kb (bench-noise-rule-meta $bench $_idx) (BenchNoiseRule $bench $_idx) $_tv)
                ok))))

(= (BenchTargetProved? $bench $path $steps)
   (not (==
          (is-member (: $prf (BenchTarget $bench $path) $tv)
                     (collapse (query $steps kb (: $prf (BenchTarget $bench $path) $tv))))
          ())))

(= (BenchSpecPaths $bench)
   (superpose
     (match &kb
            (: $_kb $_prf (BenchSpec $bench $_depth $_width $paths $_noise) $_tv)
            $paths)))

(= (BenchReachableTargetPathsLoop $bench $steps $path $max-paths)
   (if (> $path $max-paths)
       ()
       (if (BenchTargetProved? $bench $path $steps)
           (cons $path (BenchReachableTargetPathsLoop $bench $steps (+ $path 1) $max-paths))
           (BenchReachableTargetPathsLoop $bench $steps (+ $path 1) $max-paths))))

(= (BenchReachableTargetPaths $bench $steps)
   (BenchReachableTargetPathsLoop $bench $steps 1 (BenchSpecPaths $bench)))

(= (BenchTargetPathCount $bench $steps)
   (BenchListCount (BenchReachableTargetPaths $bench $steps)))
