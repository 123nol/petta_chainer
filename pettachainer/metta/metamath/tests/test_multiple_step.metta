!(import! &self ../../petta_chainer)
!(import! &self ../axioms/metamath_axioms)


;; Theorem: ((P -> Q) -> (P -> R)) -> (P -> (Q -> R))


!(test
   (collapse (query 30 kb 
        (: $prf 
            (Implication 
                ;; The Left Side of the Main Arrow: ((P -> Q) -> (P -> R))
                (Premises 
                    (Implication 
                        (Premises (Implication (Premises (PropP)) (Conclusions (PropQ)))) 
                        (Conclusions (Implication (Premises (PropP)) (Conclusions (PropR))))
                    )
                )
                ;; The Right Side of the Main Arrow: (P -> (Q -> R))
                (Conclusions 
                    (Implication 
                        (Premises (PropP)) 
                        (Conclusions (Implication (Premises (PropQ)) (Conclusions (PropR))))
                    )
                )
            ) 
            $tv
        )))
        ((: (rule-proof (no_inverse syl11) (rule-proof conjunction (ctx proof 32) 
        (rule-proof (no_inverse pm2.18) (ctx proof 172)))) (Implication (Premises (Implication (Premises (Implication (Premises (PropP))
         (Conclusions (PropQ)))) (Conclusions (Implication (Premises (PropP)) (Conclusions (PropR))))))
          (Conclusions (Implication (Premises (PropP)) (Conclusions (Implication (Premises (PropQ))
           (Conclusions (PropR))))))) (STV 1.0 0.81)))
    )
