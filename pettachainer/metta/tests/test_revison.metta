!(import! &self ../petta_chainer)
!(compileadd kb 
   (: (no_inverse ax-mp) 
      (Implication 
         (Premises 
            (Provable $phi)
            (Provable (→ $phi $psi))) 
         (Conclusions 
            (Provable $psi)
         )) 
      (STV 1.0 1.0)
    ))
!(compileadd kb 
   (: (no_inverse idi) 
      (Implication 
         (Premises 
            (Provable $phi)
         ) 
         (Conclusions 
            (Provable $phi)
         )) 
      (STV 1.0 1.0)
   ))
!(compileadd kb 
   (: (no_inverse idi) 
      (Implication 
         (Premises 
            (Provable $psi)
         ) 
         (Conclusions 
            (Provable $phi)
         )) 
      (STV 1.0 1.0)
   ))
;; Setup premises
!(compileadd kb (: fact-P (Provable (PropP)) (STV 0.9 0.95)))
!(compileadd kb (: fact-P-impl-Q (Provable (→ (PropP) (PropQ))) (STV 0.8 0.90)))
!(compileadd kb (: fact-q (Provable (PropQ)) (STV 1.0 1.0)))

;; Query if chainer derives Q from these premises
!(query 50 kb (: $prf (Provable (PropQ)) $tv))

