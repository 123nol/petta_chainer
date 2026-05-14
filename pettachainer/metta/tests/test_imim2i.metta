!(import! &self ../petta_chainer)

;; imim2i: if you can prove ($phi -> $psi)
;;         then you can prove (($chi -> $phi) -> ($chi -> $psi))
!(compileadd kb (: (imim2i (λ imim2i.1 (a2i (a1i imim2i.1)))) (Implication (Premises (Provable (→ $phi $psi))) (Conclusions (Provable (→ (→ $chi $phi) (→ $chi $psi))))) (STV 1.0 1.0)))

!(compileadd kb (: given-imp (Provable (→ (PropP) (PropQ))) (STV 1.0 1.0)))

;; Expected: (Provable (→ (→ (PropR) (PropP)) (→ (PropR) (PropQ))))
!(query 20 kb (: $prf (Provable (→ (→ (PropR) (PropP)) (→ (PropR) (PropQ)))) $tv))
