!(import! &self ../petta_chainer)

;; a2i: if you can prove ($phi -> ($psi -> $chi))
;;      then you can prove ((phi -> psi) -> (phi -> chi))
!(compileadd kb (: (a2i (λ a2i.1 (ax-mp a2i.1 ax-2))) (Implication (Premises (Provable (→ $phi (→ $psi $chi)))) (Conclusions (Provable (→ (→ $phi $psi) (→ $phi $chi))))) (STV 1.0 1.0)))

!(compileadd kb (: given-imp (Provable (→ (PropP) (→ (PropQ) (PropR)))) (STV 1.0 1.0)))

;; Expected: (Provable (→ (→ (PropP) (PropQ)) (→ (PropP) (PropR))))
!(query 20 kb (: $prf (Provable (→ (→ (PropP) (PropQ)) (→ (PropP) (PropR)))) $tv))
