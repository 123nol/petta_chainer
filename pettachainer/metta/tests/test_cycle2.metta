 !(import! &self ../petta_chainer)
 !(compileadd kb 
   (: (no_inverse rule-abduction) 
      (Implication 
         (Premises 
            (Provable (→ $phi $chi)) 
            (Provable (→ $psi $chi))
         ) 
         (Conclusions 
            (Provable (→ $phi $psi))
         )
      ) 
      (STV 0.5 0.4) ; Heuristic penalty applied
   )
)
!(compileadd kb 
   (: (no_inverse rule-induction) 
      (Implication 
         (Premises 
            (Provable (→ $chi $phi)) 
            (Provable (→ $chi $psi))
         ) 
         (Conclusions 
            (Provable (→ $phi $psi))
         )
      ) 
      (STV 0.5 0.4) ; Heuristic penalty applied
   )
)
!(compileadd kb 
   (: (no_inverse idi) 
      (Implication 
         (Premises 
            (Provable $phi)
         ) 
         (Conclusions 
            (Provable $phi)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse ax-mp) 
      (Implication 
         (Premises 
            (Provable $phi)
            (Provable (→ $phi $psi))
         ) 
         (Conclusions 
            (Provable $psi)
         )
      ) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse ax-1) 
      (Provable (→ $phi (→ $psi $phi))) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse ax-2) 
      (Provable (→ (→ $phi (→ $psi $chi)) (→ (→ $phi $psi) (→ $phi $chi)))) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse ax-3) 
      (Provable (→ (→ (¬ $phi) (¬ $psi)) (→ $psi $phi))) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse mp2) 
      (Implication 
         (Premises 
            (Provable $phi)
            (Provable $psi)
            (Provable (→ $phi (→ $psi $chi)))
         ) 
         (Conclusions 
            (Provable $chi)
         )
      ) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse mp2b) 
      (Implication 
         (Premises 
            (Provable $phi)
            (Provable (→ $phi $psi))
            (Provable (→ $psi $chi))
         ) 
         (Conclusions 
            (Provable $chi)
         )
      ) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse a1i) 
      (Implication 
         (Premises 
            (Provable $phi)
         ) 
         (Conclusions 
            (Provable (→ $psi $phi))
         )
      ) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse 2a1i) 
      (Implication 
         (Premises 
            (Provable $phi)
         ) 
         (Conclusions 
            (Provable (→ $psi (→ $chi $phi)))
         )
      ) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse mp1i) 
      (Implication 
         (Premises 
            (Provable $phi)
            (Provable (→ $phi $psi))
         ) 
         (Conclusions 
            (Provable (→ $chi $psi))
         )
      ) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse a2i) 
      (Implication 
         (Premises 
            (Provable (→ $phi (→ $psi $chi)))
         ) 
         (Conclusions 
            (Provable (→ (→ $phi $psi) (→ $phi $chi)))
         )
      ) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse mpd) 
      (Implication 
         (Premises 
            (Provable (→ $phi $psi))
            (Provable (→ $phi (→ $psi $chi)))
         ) 
         (Conclusions 
            (Provable (→ $phi $chi))
         )
      ) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse imim2i) 
      (Implication 
         (Premises 
            (Provable (→ $phi $psi))
         ) 
         (Conclusions 
            (Provable (→ (→ $chi $phi) (→ $chi $psi)))
         )
      ) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse syl) 
      (Implication 
         (Premises 
            (Provable (→ $phi $psi))
            (Provable (→ $psi $chi))
         ) 
         (Conclusions 
            (Provable (→ $phi $chi))
         )
      ) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse 3syl) 
      (Implication 
         (Premises 
            (Provable (→ $phi $psi))
            (Provable (→ $psi $chi))
            (Provable (→ $chi $theta))
         ) 
         (Conclusions 
            (Provable (→ $phi $theta))
         )
      ) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse 4syl) 
      (Implication 
         (Premises 
            (Provable (→ $phi $psi))
            (Provable (→ $psi $chi))
            (Provable (→ $chi $theta))
            (Provable (→ $theta $tau))
         ) 
         (Conclusions 
            (Provable (→ $phi $tau))
         )
      ) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse mpi) 
      (Implication 
         (Premises 
            (Provable $psi)
            (Provable (→ $phi (→ $psi $chi)))
         ) 
         (Conclusions 
            (Provable (→ $phi $chi))
         )
      ) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb 
   (: (no_inverse mpisyl) 
      (Implication 
         (Premises 
            (Provable (→ $phi $psi))
            (Provable $chi)
            (Provable (→ $psi (→ $chi $theta)))
         ) 
         (Conclusions 
            (Provable (→ $phi $theta))
         )
      ) 
      (STV 1.0 1.0)
   )
)
!(compileadd kb (: fact-P (Provable (PropP)) (STV 1.0 1.0)))
!(compileadd kb (: fact-P-impl-Q (Provable (→ (PropP) (PropQ))) (STV 1.0 1.0)))
;; Setup premises for modes ponens
!(compileadd kb (: fact-P (Provable (PropQ)) (STV 1.0 1.0)))
; !(compileadd kb (: fact-P-impl-Q (Provable (→ (PropP) (PropQ))) (STV 1.0 1.0)))

;; Query if chainer derives Q from these premises
!(query 40 kb (: $prf (Provable (PropQ)) $tv))
