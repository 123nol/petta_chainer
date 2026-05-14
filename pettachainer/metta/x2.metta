!(import! &self petta_chainer)

;!(compileadd kb
;   (: foldRule
;      (Implication (Premises (Provable (-> $phi $psi)) (Provable (-> $psi $chi)))
;         (Conclusions (Provable (-> $phi $chi))))
;      (STV 1.0 1.0)))
;

;(rules ((((Provable (-> $_255878 $_255884)) (kb $_255902 $_255908) $_255914 $_255920) ((Provable (-> $_255884 $_255962)) (kb $_255902 $_255908) $_255992 $_255998) (CPU AndFormula ($_255920 $_255998) $_256040) (CPU MpFormula ((STV 1.0 1.0) $_256040) $_256112)) |- (: (kb $_255902 $_255908) (foldRule (rule-proof conjunction $_255914 $_255992)) (Provable (-> $_255878 $_255962)) $_256112)))

!(compileadd kb (: ax-tr (Implication (Premises  (Provable (→ $psi $chi)) (Provable (→ $phi $psi))) (Conclusions (Provable (→ $phi $chi)))) (STV 1.0 1.0)))
!(compileadd kb (: given-imp1 (Provable (→ (PropP) (PropQ))) (STV 1.0 1.0)))
!(compileadd kb (: given-imp2 (Provable (→ (PropQ) (PropT))) (STV 1.0 1.0)))

!(=======================================================)
!(query 20 kb (: $prf (Provable (→ (PropP) (PropT))) $tv))
