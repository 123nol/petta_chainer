!(import! &self ../petta_chainer)

;; mp2: if (Provable $phi) and (Provable $psi) and (Provable (→ $phi (→ $psi $chi)))
;;      then (Provable $chi)
!(compileadd kb (: (mp2 ) (Implication (Premises (Provable $phi) (Provable $psi) (Provable (→ $phi (→ $psi $chi)))) (Conclusions (Provable $chi))) (STV 1.0 1.0)))

!(compileadd kb (: given-p (Provable (PropP)) (STV 1.0 1.0)))
!(compileadd kb (: given-q (Provable (PropQ)) (STV 1.0 1.0)))
!(compileadd kb (: given-imp (Provable (→ (PropP) (→ (PropQ) (PropR)))) (STV 1.0 1.0)))

;; Expected: (Provable (PropR))
!(query 20 kb (: $prf (Provable (PropR)) $tv))
