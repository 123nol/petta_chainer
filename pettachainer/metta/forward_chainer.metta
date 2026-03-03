!(import_prolog_function nth0)

(= (forward-satisfy-premises $steps () $goal) $goal)
(= (forward-satisfy-premises $steps (cons $prem $rest) $goal)
   (if (= $prem (CPU $fun $args $res))
      (let $res (cpu-call $steps $fun $args) (forward-satisfy-premises $steps $rest $goal))
      (if (= $prem (: $_kb $_prf $_type $_tv))
         (match &kb $prem
            (forward-satisfy-premises $steps $rest $goal))
         (empty))))

(= (agenda-push-fact $agenda $fact)
   (let $score (term-confidence $fact) (add_to_heap $agenda (- 0 $score) (qitem $score $fact))))

(= (forward-fact-upsert $agenda (@ $fact (: $kb $prf $type $tv)))
   (let*
      (($hits (collapse (match &kb (: $kb $prfo $type $tvo) (: $kb $prfo $type $tvo))))
        ($_ (fold-flat (|-> ($acc $old-fact) (progn (remove-atom &kb $old-fact) $acc)) () $hits))
        ($merged-fact (fold-flat merge-proof-atoms $fact $hits))
        ($_ (add-atom &kb $merged-fact)))
      (if (== $hits ()) (agenda-push-fact $agenda $merged-fact) $agenda)))

(= (forward-enqueue-facts () $agenda) $agenda)
(= (forward-enqueue-facts (cons $fact $tail) $agenda)
   (forward-enqueue-facts $tail (forward-fact-upsert $agenda $fact)))

(= (forward-seed-agenda () $agenda) $agenda)
(= (forward-seed-agenda (cons $fact $tail) $agenda)
   (forward-seed-agenda $tail (agenda-push-fact $agenda $fact)))

(= (forward-rule-results $steps $kb $fact)
   (collapse
      (let*
         (($id (match &prem_index ($fact $id $idx) $id))
           (($id $ccls $prems) (match &rules ($id $ccls $prems) ($id $ccls $prems)))
           ($rprems (nth0 $idx $prems $fact)))
         (forward-satisfy-premises $steps $rprems $ccls))))

(= (forward-kb-facts $kb)
   (collapse (match &kb (: ($kb MAIN Nil) $prf $type $tv) (: ($kb MAIN Nil) $prf $type $tv))))

(= (forward-loop $steps $kb $agenda)
   (if (or (== (heap_size $agenda) 0) (<= $steps 0)) ()
      (let*
         (($rest (get_from_heap $agenda $_priority (qitem $_score $fact)))
           ($derived (forward-rule-results $steps $kb $fact))
           ($nagenda (forward-enqueue-facts $derived $rest)))
         (forward-loop (- $steps 1) $kb $nagenda))))

(= (forward-chain $steps $kb)
   (let*
      (($agenda0 (forward-seed-agenda (forward-kb-facts $kb) (empty_heap)))
        ($_run (forward-loop $steps $kb $agenda0)))
      true))

(= (forward-has-derived? $kb $type)
   (not (== (collapse (match &kb (: ($kb MAIN Nil) $prf $type $tv) $prf)) ())))
