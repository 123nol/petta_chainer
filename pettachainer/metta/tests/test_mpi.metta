!(import! &self ../petta_chainer)

;; mpi: if (Provable $psi) and (Provable (→ $phi (→ $psi $chi)))
;;      then (Provable (→ $phi $chi))
!(compileadd kb (: (mpi (λ mpi.1 mpi.2 (mpd (a1i mpi.1) mpi.2))) (Implication (Premises (Provable $psi) (Provable (→ $phi (→ $psi $chi)))) (Conclusions (Provable (→ $phi $chi)))) (STV 1.0 1.0)))

!(compileadd kb (: given-p (Provable (PropQ)) (STV 1.0 1.0)))
!(compileadd kb (: given-imp (Provable (→ (PropP) (→ (PropQ) (PropR)))) (STV 1.0 1.0)))

;; Expected: (Provable (→ (PropP) (PropR)))
!(query 20 kb (: $prf (Provable (→ (PropP) (PropR))) $tv))
