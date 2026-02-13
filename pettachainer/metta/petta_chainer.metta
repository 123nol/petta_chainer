!(import! &self compile)

;;;;;;;;;;;;;;;;;;
;; Chainer Core ;;
;;;;;;;;;;;;;;;;;;

;; Normalize variable names out of a goal key so renamed variants are treated as same state.
(= (goal-key (: $kb $prf $type $tv)) $type)

;; Confidence helpers.
(= (tv-confidence $tv)
   (if (= $tv (STV $_s $c))
       (if (is-var $c) 1.0 $c)
       1.0))

;; Rule-native expected confidence extraction from compiled premises.
(= (premise-expected-confidence $prem)
   (case $prem
     (
       ((CPU MpFormula ((STV $_ms $mc) $_mrhs) $_mout)
        (if (is-var $mc) 1.0 $mc))
       ((CPU AndFormula ($aa $ab) $_aout)
        (min (tv-confidence $aa) (tv-confidence $ab)))
       ((CPU OrFormula ($oa $ob) $_oout)
        (max (tv-confidence $oa) (tv-confidence $ob)))
       ((CPU LikelierThanFormula ($la $lb) $_lout)
        (min (tv-confidence $la) (tv-confidence $lb)))
       ((: $_kb $_prf $_type $tv)
        (tv-confidence $tv))
       ($other 1.0)
     )))

;; Confidence from a concrete proved premise.
(= (proof-confidence (: $_kb $_prf $_type $tv)) (tv-confidence $tv))
(= (proof-confidence (CPU $_fun $_args $res)) (tv-confidence $res))
(= (proof-confidence $_proof) 1.0)

(= (premises-expected-confidence Nil) 1.0)
(= (premises-expected-confidence ()) 1.0)
(= (premises-expected-confidence ($prem $rest))
   (min (premise-expected-confidence $prem) (premises-expected-confidence $rest)))

;; Priority queue sorted by descending expected confidence.
(= (pq-insert-raw () $item) (cons $item ()))
(= (pq-insert-raw (cons (qitem $p $args $goal) $rest) (qitem $np $nargs $ngoal))
   (if (> $np $p)
       (cons (qitem $np $nargs $ngoal) (cons (qitem $p $args $goal) $rest))
       (cons (qitem $p $args $goal) (pq-insert-raw $rest (qitem $np $nargs $ngoal)))))

(= (qitem-key (qitem $prio $args $goal))
   (qkey $goal $prio $args))

(= (pq-contains-key () $key) false)
(= (pq-contains-key (cons $head $tail) $key)
   (if (== (qitem-key $head) $key)
       true
       (pq-contains-key $tail $key)))
(= (pq-contains-key ($head $tail) $key)
   (if (== (qitem-key $head) $key)
       true
       (pq-contains-key $tail $key)))

(= (pq-insert $pq $item)
   (let $key (qitem-key $item)
        (if (pq-contains-key $pq $key)
            $pq
            (pq-insert-raw $pq $item))))

(= (pq-insert-all $pq ()) $pq)
(= (pq-insert-all $pq (cons $item $tail))
   (pq-insert-all (pq-insert $pq $item) $tail))

(= (is-inversion-proof $prf)
   (if (is-var $prf)
       false
       (if (= $prf ((inverted $_name with $_a $_b $_c $_d) $_ctx))
           true
           false)))

;; Build initial queue from all matching rule applications.
(= (candidate-from-match ($args |- $goal))
   (let (: $_kb $prf $_type $_tv) $goal
        (if (is-inversion-proof $prf)
            (empty)
            (let $score (premises-expected-confidence $args)
                 (qitem $score (cand ($args |- $goal) $score) $goal)))))

(= (initial-candidate $goal)
   (let $_ (match &kb (rules ($args |- $goal)) (rules ($args |- $goal)))
        (candidate-from-match ($args |- $goal))))

(= (build-initial-pq $goal)
   (let $items (collapse (initial-candidate $goal))
        (pq-insert-all () $items)))

;; Expand one candidate by proving exactly one next premise.
(= (expand-candidate $steps $visited (qitem $_prio (cand (($prem $rest) |- $goal) $score) $_g))
   (let $proved (chainer-v $steps $visited $prem)
        (let $prem $proved
             (let $prem-score (min (proof-confidence $proved) (premise-expected-confidence $proved))
             (let $new-score (min $score $prem-score)
                  (qitem $new-score (cand ($rest |- $goal) $new-score) $goal))))))
(= (expand-candidate $steps $visited (qitem $_prio (cand (Nil |- $_goal) $_score) $_g))
   (empty))
(= (expand-candidate $steps $visited (qitem $_prio (cand (() |- $_goal) $_score) $_g))
   (empty))

;; Best-first over partially-applied rule candidates.
(= (search-rules $steps $visited ()) ())
(= (search-rules $steps $visited (cons $item $pq-rest))
   (search-rules-step $steps $visited (cons $item $pq-rest)))

(= (search-rules-step $steps $visited (cons (qitem $_prio (cand (Nil |- $goal) $_score) $_g) $pq-rest))
   (cons $goal (search-rules $steps $visited $pq-rest)))
(= (search-rules-step $steps $visited (cons (qitem $_prio (cand (() |- $goal) $_score) $_g) $pq-rest))
   (cons $goal (search-rules $steps $visited $pq-rest)))
(= (search-rules-step $steps $visited (cons (qitem $_prio (cand (($prem $rest) |- $goal) $score) $_g) $pq-rest))
   (if (<= $steps 0)
       ()
       (let $new-items (collapse (expand-candidate $steps $visited (qitem $_prio (cand (($prem $rest) |- $goal) $score) $_g)))
            (let $new-pq (pq-insert-all $pq-rest $new-items)
                 (search-rules (- $steps 1) $visited $new-pq)))))

(= (first-result (cons $head $_tail)) $head)
(= (first-result ($head $_tail)) $head)
(= (first-result ()) (empty))

;; DFS fallback keeps legacy behavior if best-first cannot complete.
(= (search-rules-dfs-fallback $steps $visited $goal)
   (let $_ (match &kb (rules ($args |- $goal)) (rules ($args |- $goal)))
        (let $args (chain-rec-v $steps $visited $args)
             $goal)))

;; CPU functions that need the current step budget as first argument.
(= (cpu-needs-steps $fun) (== $fun FoldAllFormulaCompiled))

;; Generic CPU dispatcher used by chainer.
(= (cpu-call $steps $fun $args)
  (let $call
       (if (cpu-needs-steps $fun)
           (cons $fun (cons $steps $args))
           (cons $fun $args))
       (reduce (reduce $call))))

(= (chainer-v $steps $visited (CPU $fun $args $res))
  (if (<= $steps 0)
      (empty)
      (let $res (cpu-call (- $steps 1) $fun $args)
           (CPU $fun $args $res))))

(= (chainer-v $steps $visited $goal)
  (match &kb $goal $goal))

(= (chainer-v $steps $visited $goal)
   (let $k (goal-key $goal)
      (if (or (<= $steps 0) (is-member $k $visited))
          (empty)
          (let $pq (build-initial-pq $goal)
               (let $results (search-rules $steps (cons $k $visited) $pq)
                    (if (== $results ())
                        (search-rules-dfs-fallback $steps (cons $k $visited) $goal)
                        (superpose $results)))))))

(= (chain-rec-v $steps $visited ($goal $dep))
  (if (== $dep Nil)
    ((chainer-v $steps $visited $goal) Nil)
    ((chainer-v $steps $visited $goal) (chain-rec-v $steps $visited $dep))))

(= (chainer $steps $goal) (chainer-v $steps () $goal))

;; Keep first occurrence order while removing duplicate results.
(= (ordered-unique-acc () $seen) ())
(= (ordered-unique-acc (cons $head $tail) $seen)
   (if (is-member $head $seen)
       (ordered-unique-acc $tail $seen)
       (cons $head (ordered-unique-acc $tail (cons $head $seen)))))
(= (ordered-unique-acc ($head $tail) $seen)
   (if (is-member $head $seen)
       (ordered-unique-acc $tail $seen)
       ($head (ordered-unique-acc $tail (cons $head $seen)))))
(= (ordered-unique $lst) (ordered-unique-acc $lst ()))



;;;;;;;;;;;;;;;;;;
;; CPU Formulas ;;
;;;;;;;;;;;;;;;;;;

;; Runtime fold helper.
(= (foldall-eval $fun $acc ()) $acc)
(= (foldall-eval $fun $acc (cons $elem $tail))
  (let $call (cons $fun (cons $acc (cons $elem ())))
  (let $nacc (reduce (reduce $call))
       (foldall-eval $fun $nacc $tail))))

;; Execute a precompiled query plan represented as (goal + adds).
(= (run-compiled-query $steps $compiled-query)
  (let (cons (goal $query) $adds) $compiled-query
  (let $_ (if (= $adds ()) $_ (let $sadds (superpose $adds) (add-atom &kb $sadds)))
       (chainer $steps $query))))

;; FoldAll runtime uses precompiled query, then extracts fold values via pattern match.
(= (FoldAllFormulaCompiled $steps $compiled-query $pattern $value $init $fun)
  (let $matches (collapse (let (: $kbr $prf $pattern $tvin) (run-compiled-query $steps $compiled-query) $value))
       (foldall-eval $fun $init $matches)))

;;;;;;;;;;;;;;;;;;;;;
;; Truth Functions ;;
;;;;;;;;;;;;;;;;;;;;;

(= (MpFormula (STV $abs $abc) (STV $as $ac))
   (STV (* $abs $as) (min $abc $ac)))
(= (AndFormula (STV $si $ci) (STV $sa $ca)) (let $sb (min $si $sa)
                                              (let $cb (min $ci $ca) (STV $sb $cb))))

(= (OrFormula (STV $si $ci) (STV $sa $ca)) (let $sb (min $si $sa)
                                             (let $cb (max $ci $ca) (STV $sb $cb))))

(= (LikelierThanFormula (STV $sa $ca) (STV $sb $cb)) (let $c (min $ca $cb) (if (> $sa $sb) (STV $sa $c) (STV $sb $c))))


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
  (let $atoms (traceid (mm2compile $kb $stmt)) (add-atom &kb $atoms)))

;; Compile query to goal+adds, inject adds, then run goal through chainer.
(= (query $steps $kb $stmt)
  (let (cons (goal $query) $adds) (collapse (mm2compileQuery $kb $stmt))
  (let $_ (if (= $adds ()) $_ (let $sadds (superpose $adds) (add-atom &kb $sadds)))
       (pretty (chainer $steps $query)))))
