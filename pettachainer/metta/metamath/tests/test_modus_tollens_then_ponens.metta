!(import! &self ../../petta_chainer)
!(import! &self ../axioms/metamath_axioms)

!(import! &self ../../logic_configs/predicate_logic)

;; Facts for Exercise 1
!(compileadd kb (: fact-P-impl-Q (Implication (Premises (PropP)) (Conclusions (PropQ))) (STV 1.0 1.0)))
!(compileadd kb (: fact-not-Q (Not (PropQ)) (STV 1.0 1.0)))
!(compileadd kb (: fact-not-P-impl-R (Implication (Premises (Not (PropP))) (Conclusions (PropR))) (STV 1.0 1.0)))

;; Query if chainer derives R through Modus Tollens then Modus Ponens
 !(test (collapse (query 10 kb (: $prf (PropR) $tv)))
    ((: (merge/revision (rule-proof (no_inverse pm2.18) (ctx proof 172)) 
    (rule-proof (no_inverse pm2.18i) (ctx proof 173))) (PropR) (STV 1.0 0.9473684210526316))))
