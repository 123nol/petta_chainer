!(import! &self ../petta_chainer)

;; mpd: if (Provable (→ $phi $psi)) and (Provable (→ $phi (→ $psi $chi)))
;;      then (Provable (→ $phi $chi))
!(compileadd kb (: (mpd (λ mpd.1 mpd.2 (ax-mp mpd.1 (a2i mpd.2)))) (Implication (Premises (Provable (→ $phi $psi)) (Provable (→ $phi (→ $psi $chi)))) (Conclusions (Provable (→ $phi $chi)))) (STV 1.0 1.0)))

!(compileadd kb (: given-1 (Provable (→ (PropP) (PropQ))) (STV 1.0 1.0)))
!(compileadd kb (: given-2 (Provable (→ (PropP) (→ (PropQ) (PropR)))) (STV 1.0 1.0)))

;; Expected: (Provable (→ (PropP) (PropR)))
!(query 20 kb (: $prf (Provable (→ (PropP) (PropR))) $tv))
