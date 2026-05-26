!(import! &self ../../petta_chainer)
!(import! &self ../axioms/metamath_axioms)

!(import! &self ../../logic_configs/predicate_logic)

;; Facts for Exercise 3
!(compileadd kb (: fact-A-impl-B-and-C (Implication (Premises (PropA)) (Conclusions (And (PropB) (PropC)))) (STV 1.0 1.0)))
!(compileadd kb (: fact-A (PropA) (STV 1.0 1.0)))
!(compileadd kb (: fact-B-impl-D (Implication (Premises (PropB)) (Conclusions (PropD))) (STV 1.0 1.0)))

;; Query if chainer derives D through Modus Ponens, Simplification, then Modus Ponens
!(test
   (collapse (query 10 kb (: $prf (PropD) $tv)))
   ((: (merge/revision (rule-proof (no_inverse pm2.18) (ctx proof 172)) 
   (rule-proof (no_inverse pm2.18i) (ctx proof 173))) (PropD) (STV 1.0 0.9473684210526316))))
