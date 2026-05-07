!(import! &self ../petta_chainer)

;; mp2b: if (Provable $phi) and (Provable (→ $phi $psi)) and (Provable (→ $psi $chi))
;;       then (Provable $chi)
!(compileadd kb (: (mp2b (λ mp2b.1 mp2b.2 mp2b.3 (ax-mp (ax-mp mp2b.1 mp2b.2) mp2b.3))) (Implication (Premises (Provable $phi) (Provable (→ $phi $psi)) (Provable (→ $psi $chi))) (Conclusions (Provable $chi))) (STV 1.0 1.0)))

!(compileadd kb (: given-p (Provable (PropP)) (STV 1.0 1.0)))
!(compileadd kb (: given-imp1 (Provable (→ (PropP) (PropQ))) (STV 1.0 1.0)))
!(compileadd kb (: given-imp2 (Provable (→ (PropQ) (PropR))) (STV 1.0 1.0)))

;; Expected: (Provable (PropR))
!(query 20 kb (: $prf (Provable (PropR)) $tv))
