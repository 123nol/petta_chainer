!(import! &self ../petta_chainer)

;; 2a1i: if you can prove $phi, then you can prove ($psi -> ($chi -> $phi))
;; i.e. double weakening - a true thing is implied by anything twice nested
!(compileadd kb (: (2a1i (λ 2a1i.1 (a1i (a1i 2a1i.1)))) (Implication (Premises (Provable $phi)) (Conclusions (Provable (→ $psi (→ $chi $phi)))) ) (STV 1.0 1.0)))

!(compileadd kb (: given-p (Provable (PropP)) (STV 1.0 1.0)))

;; Expected: (Provable (→ (PropQ) (→ (PropR) (PropP))))
!(query 20 kb (: $prf (Provable (→ (PropQ) (→ (PropR) (PropP)))) $tv))
