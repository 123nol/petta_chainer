!(import! &self ../../petta_chainer)
!(import! &self ../axioms/metamath_axioms)

!(import! &self ../../logic_configs/predicate_logic)

;; Facts for Exercise 2
!(compileadd kb (: fact-P-and-Q (And (PropP) (PropQ)) (STV 1.0 1.0)))
!(compileadd kb (: fact-P-impl-R-or-S (Implication (Premises (PropP)) (Conclusions (Or (PropR) (PropS)))) (STV 1.0 1.0)))
!(compileadd kb (: fact-not-R (Not (PropR)) (STV 1.0 1.0)))

;; Query if chainer derives S through Simplification, Modus Ponens, then Disjunctive Syllogism
!(test (collapse (query 10 kb (: $prf (PropS) $tv)))
   ((: (merge/revision (rule-proof (no_inverse pm2.18) (ctx proof 172)) (rule-proof (no_inverse pm2.18i) (ctx proof 173))) (PropS) (STV 1.0 0.9473684210526316))))
