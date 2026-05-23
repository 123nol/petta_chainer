!(import! &self ../../petta_chainer)
!(import! &self ../metamath_axioms)

;;facts 
!(compileadd kb (: fact-P (PropP) (STV 1.0 1.0)))
!(compileadd kb (: fact-P-impl-Q (Implication (Premises (PropP)) (Conclusions (PropQ))) (STV 1.0 1.0)))
!(compileadd kb (: fact-Q-impl-R (Implication (Premises (PropQ)) (Conclusions (PropR))) (STV 1.0 1.0)))

;; Query if chainer derives R through a two-step implication chain.
!(test
   (collapse (query 100 kb (: $prf (PropR) $tv)))
   ((: (rule-proof fact-Q-impl-R (rule-proof fact-P-impl-Q fact-P)) (PropR) (STV 1.0 0.81))))