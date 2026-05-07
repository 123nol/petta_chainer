!(import! &self ../petta_chainer)

;; Load the axiom ax-mp (modus ponens)
!(compileadd kb (: (no_inverse ax-mp) (Implication (Premises (Provable (→ $phi $psi)) (Provable $phi)) (Conclusions (Provable $psi))) (STV 1.0 1.0)))

;; Add the premises
!(compileadd kb (: given-imp (Provable (→ (PropP) (PropQ))) (STV 1.0 1.0)))
!(compileadd kb (: given-p (Provable (PropP)) (STV 1.0 1.0)))

;; Query for the conclusion
!(query 20 kb (: $prf (Provable (PropQ)) $tv))
