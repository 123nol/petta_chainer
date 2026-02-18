!(import! &self compile)
!(import! &self (library lib_import))
!(use-module! heaps)
!(import_prolog_function (superpose (empty_heap add_to_heap get_from_heap heap_size)))
!(import! &self chainer_utils)
!(bind! &resume_cache (new-space))
!(bind! &goal_cache (new-space))

;;;;;;;;;;;;;;;;;;
;; Chainer Core ;;
;;;;;;;;;;;;;;;;;;

(= (chainer $steps $goal)
   (let* (($_rclear (remove-all-atoms &resume_cache))
          ($_gclear (remove-all-atoms &goal_cache))
          ((state $pq $_rcache $_gcache) (enqueue-goal-state $steps (state (empty_heap) &resume_cache &goal_cache) 1.0 () $goal))
          ($_ (search-rules $steps $pq &resume_cache &goal_cache)))
     (collapse (match &goal_cache (gmerge $result-goal) $result-goal))))

(= (enqueue-goal-state $steps $state $max-score $cont $goal)
   (let $state1 (fold-flat state-enqueue-item $state (collapse (direct-goal-items $steps $max-score $cont $goal)))
      (fold-flat state-enqueue-item $state1 (collapse (rule-candidate-items $max-score $cont $goal)))))

(= (rule-candidate-items $max-score $cont $goal)
   (match &kb (rules ($args |- $goal))
       (let $score (min $max-score (premises-expected-confidence $args))
            (candidate-item $score $args $goal $cont))))

(= (direct-goal-items $steps $max-score $cont $goal)
   (let* (($proof (if (= $goal (CPU $fun $args $_res))
                           (CPU $fun $args (cpu-call $steps $fun $args))
                           (match &kb $goal $goal)))
          ($score (min $max-score (term-confidence $proof))))
     (candidate-item $score () $proof $cont)))

;; Best-first over partially-applied rule candidates.
(= (payload-cand $payload)
   (if (= $payload (resume-cand $_rid $_type $cand))
       $cand
       $payload))

(= (payload-repack $payload $cand)
   (if (= $payload (resume-cand $rid $type $_old-cand))
       (resume-cand $rid $type $cand)
       $cand))

(= (search-rules $steps $heap $rcache $gcache)
   (if (or (== (heap_size $heap) 0) (<= $steps 0))
       ()
       (let* (($pq-rest (get_from_heap $heap $_priority (qitem $score $payload)))
              ((cand ((cons $prem $rest) |- $goal) $cont) (payload-cand $payload))
              ($rid (nextctx))
              ((state $new-pq $_new-rcache $_new-gcache) (enqueue-goal-state $steps (state $pq-rest $rcache $gcache) $score (cons (resume $rid $rest $goal $score) $cont) $prem))
              )
             (search-rules (- $steps 1) $new-pq $rcache $gcache))))

(= (state-enqueue-cand (@ $state (state $pq $rcache $gcache)) $prio $payload $cand)
   (case $cand
     (
       ((cand (() |- $item-goal) ())
        (progn (goal-cache-upsert $gcache $item-goal)
               (state $pq $rcache $gcache)))
       ((cand (() |- $proved-goal) $cont)
        (resume-merge-enqueue-cont (state $pq $rcache $gcache) $proved-goal $cont))
       ((cand ((cons $arg $args) |- $item-goal) $cont)
        (if (has-active-premise? (cons $arg $args) $cont)
            (state $pq $rcache $gcache)
            (state (add_to_heap $pq (- 0 $prio)
                     (qitem $prio (payload-repack $payload (cand ((cons $arg $args) |- $item-goal) $cont))))
                   $rcache
                   $gcache)))
     )))

(= (state-enqueue-item (state $pq $rcache $gcache) (qitem $prio $payload))
   (state-enqueue-cand (state $pq $rcache $gcache) $prio $payload (payload-cand $payload)))

(= (premise-goal-keys ()) ())
(= (premise-goal-keys (cons $prem $rest))
       (if (= $prem (: $_kb $_prf $type $_tv))
           (cons $type (premise-goal-keys $rest))
           (premise-goal-keys $rest)
       ))

(= (has-active-premise? $args $cont)
   (let* (($prem-keys (premise-goal-keys $args))
          ($cont-keys (map-flat (|-> ((resume $_rid $_r (: $_kb $_prf $type $_tv) $_ps)) $type) $cont)))
       (not (== (/=a\ $prem-keys $cont-keys) ()))))

;; CPU functions that need the current step budget as first argument.
(= (cpu-needs-steps $fun) (== $fun FoldAllFormulaCompiled))

;; Generic CPU dispatcher used by chainer.
(= (cpu-call $steps $fun $args)
  (let $call
       (if (cpu-needs-steps $fun)
           (cons $fun (cons $steps $args))
           (cons $fun $args))
       (reduce (reduce $call))))

;;;;;;;;;;;;;;;;;;
;; CPU Formulas ;;
;;;;;;;;;;;;;;;;;;

;; Runtime fold helper.
(= (foldall-eval $fun $acc ()) $acc)
(= (foldall-eval $fun $acc (cons $elem $tail))
   (let* (($call (cons $fun (cons $acc (cons $elem ()))))
          ($nacc (reduce (reduce $call))))
     (foldall-eval $fun $nacc $tail)))

(= (inject-compiled-adds $adds)
   (if (= $adds ())
       $_
       (let $sadds (superpose $adds)
            (add-atom &kb $sadds))))

;; Execute a precompiled query plan represented as (goal + adds).
(= (run-compiled-query $steps $compiled-query)
   (let* (((cons (goal $query) $adds) $compiled-query)
          ($_ (inject-compiled-adds $adds)))
     (chainer $steps $query)))

;; FoldAll runtime uses precompiled query, then extracts fold values via pattern match.
(= (FoldAllFormulaCompiled $steps $compiled-query $pattern $value $init $fun)
  (let $matches (collapse (let (: $kbr $prf $pattern $tvin) (run-compiled-query $steps $compiled-query) $value))
       (foldall-eval $fun $init $matches)))

;;;;;;;;;;;;;;;;;;;;;
;; Truth Functions ;;
;;;;;;;;;;;;;;;;;;;;;

(= (MpFormula (STV $abs $abc) (STV $as $ac))
   (STV (* $abs $as) (min $abc $ac)))

(= (AndFormula (STV $si $ci) (STV $sa $ca))
   (let* (($sb (min $si $sa))
          ($cb (min $ci $ca)))
     (STV $sb $cb)))

(= (OrFormula (STV $si $ci) (STV $sa $ca))
   (let* (($sb (min $si $sa))
          ($cb (max $ci $ca)))
     (STV $sb $cb)))

(= (LikelierThanFormula (STV $sa $ca) (STV $sb $cb))
   (let* (($c (min $ca $cb)))
     (if (> $sa $sb)
         (STV $sa $c)
         (STV $sb $c))))


(= (AndProjection (STV $s $c)) (STV $s $c))
(= (OrProjection (STV $s $c)) (STV $s $c))

(= (NotFormula (STV $s $c) (STV (- 1 $s) $c)))

(= (InversionFormula (STV $sa $ca) (STV $sb $cb) (STV $sab $cab)) (STV (/ (* $sb $sab) $sa) (min-atom ($ca $cb $cab)))) 

(= (Equal $a $b) (== $a $b))
(= (NotEqual $a $b) (not (== $a $b)))

;;;;;;;;;;;
;; API   ;;
;;;;;;;;;;;

(= (compileadd $kb $stmt)
  (let $atoms (mm2compile $kb $stmt) (add-atom &kb $atoms)))

;; Compile query to goal+adds, inject adds, then run goal through chainer.
(= (query $steps $kb $stmt)
  (let* (((cons (goal $query) $adds) (collapse (mm2compileQuery $kb $stmt)))
         ($_ (inject-compiled-adds $adds))
         ($res (chainer $steps $query)))
    (pretty (superpose $res))))
