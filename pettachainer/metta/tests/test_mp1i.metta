!(import! &self ../petta_chainer)

;; mp1i: if (Provable $phi) and (Provable (→ $phi $psi))
;;       then (Provable (→ $chi $psi))
!(compileadd kb (: ( no_inverse mp1i ) (Implication (Premises (Provable (→ $phi $psi)) (Provable $phi)) (Conclusions (Provable (→ $chi $psi)))) (STV 1.0 1.0)))

;; Add the premises
!(compileadd kb (: given-imp (Provable (→ (PropP) (PropQ))) (STV 1.0 1.0)))
!(compileadd kb (: given-p (Provable (PropP)) (STV 1.0 1.0)))
;; Expected: (Provable (→ (PropR) (PropQ)))
!(query 20 kb (: $prf (Provable (→ (PropR) (PropQ))) $tv))
