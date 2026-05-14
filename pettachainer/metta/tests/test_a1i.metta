!(import! &self ../petta_chainer)

;; a1i axiom: if you can prove $phi, then you can prove ($psi -> $phi)
!(compileadd kb (: (a1i (λ a1i.1 (ax-mp a1i.1 ax-1))) (Implication (Premises (Provable $phi)) (Conclusions (Provable (→ $psi $phi)))) (STV 1.0 1.0)))

;; Add the premise
!(compileadd kb (: given-p (Provable (PropP)) (STV 1.0 1.0)))

;; Query for the conclusion: (PropQ -> PropP)
!(query 20 kb (: $prf (Provable (→ (PropQ) (PropP))) $tv))
