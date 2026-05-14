!(import! &self ../petta_chainer)



!(compileadd kb (: (no_inverse ax-tr) (Implication (Premises (Provable (→ $phi $psi)) (Provable (→ $psi $chi))) (Conclusions (Provable (→ $phi $chi)))) (STV 1.0 1.0)))


!(compileadd kb (: given-imp (Provable (→ (PropP) (PropQ))) (STV 1.0 1.0)))

!(compileadd kb (: given-p (Provable (→ (PropQ) (PropT))) (STV 1.0 1.0)))


!(query 200 kb (: $prf (Provable (→ (PropP) (PropT))) $tv))
