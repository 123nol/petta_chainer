;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Forward Chaining Engine ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!(bind! &forward_facts (new-space))

(= (forward-rule-triggered? () $fact) false)
(= (forward-rule-triggered? (cons $prem $rest) $fact)
   (or (if (= $prem (: $_kb $_prf $_type $_tv))
           (not (== (collapse (let $prem $fact true)) ()))
           false)
       (forward-rule-triggered? $rest $fact)))

(= (forward-satisfy-premises $steps () $goal)
   $goal)

(= (forward-satisfy-premises $steps (cons $prem $rest) $goal)
   (if (= $prem (CPU $fun $args $res))
       (let $res (cpu-call $steps $fun $args)
            (forward-satisfy-premises $steps $rest $goal))
       (if (= $prem (: $_kb $_prf $_type $_tv))
            (match &forward_facts $prem
              (forward-satisfy-premises $steps $rest $goal))
            (empty))))

(= (forward-fact-upsert $agenda $fact)
   (let* (($hits (collapse
                   (match &forward_facts $old-fact
                     (if (same-alpha-type? $old-fact $fact)
                         $old-fact
                         (empty)))))
          ($_ (fold-flat
                (|-> ($acc $old-fact)
                  (progn
                    (remove-atom &forward_facts $old-fact)
                    $acc))
                ()
                $hits))
           ($merged-fact (fold-flat merge-proof-atoms $fact $hits))
          ($_ (add-atom &forward_facts $merged-fact)))
      (if (== $hits ())
          (add_to_heap $agenda
                       (- 0 (term-confidence $merged-fact))
                       (qitem (term-confidence $merged-fact) $merged-fact))
          $agenda)))

(= (forward-enqueue-facts () $agenda) $agenda)
(= (forward-enqueue-facts (cons $fact $tail) $agenda)
   ;; Forward agenda is best-first: higher-confidence facts are popped first.
   ;; We use negative confidence as heap priority because get_from_heap pops
   ;; the smallest priority value.
   ;; Alpha-equivalent facts are merged with backward-chainer semantics.
   (forward-enqueue-facts $tail (forward-fact-upsert $agenda $fact)))

(= (forward-loop $steps $kb $agenda)
   (if (== (heap_size $agenda) 0)
       ()
       ;; $steps is a hard cap on processed agenda items.
       (if (<= $steps 0)
           ()
           (let* (($rest (get_from_heap $agenda $_priority (qitem $_score $fact)))
                  ($derived
                    (collapse
                      (match &kb (rules ($args |- $goal))
                        (if (forward-rule-triggered? $args $fact)
                            (forward-satisfy-premises $steps $args $goal)
                            (empty)))))
                  ($nagenda (forward-enqueue-facts $derived $rest)))
              (forward-loop (- $steps 1) $kb $nagenda)))))

(= (forward-chain $steps $kb)
   (let* (($_clear (remove-all-atoms &forward_facts))
          ($agenda0 (forward-enqueue-facts
                      (collapse (match &kb (: ($kb MAIN ()) $prf $type $tv) (: ($kb MAIN ()) $prf $type $tv)))
                      (empty_heap)))
          ($_run (forward-loop $steps $kb $agenda0)))
       (collapse (match &forward_facts (: ($kb MAIN ()) $prf $type $tv) (: $prf $type $tv)))))

(= (forward-has-derived? $kb $type)
   (not (==
          (collapse
            (match &forward_facts (: ($kb $_ctx $_vars) $prf $type $tv)
              $prf))
          ())))
