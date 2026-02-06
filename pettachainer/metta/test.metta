!(import! &self petta_chainer)

!(add-atom &kb (: kb prf (Count A 1) (STV 1.0 1.0)))
!(add-atom &kb (: kb prf (Count B 2) (STV 1.0 1.0)))
!(add-atom &kb (: kb prf (Count C 3) (STV 1.0 1.0)))

(= (KeepAcc $acc $elem) $acc)

!(compileadd kb (: foldRule
    (Implication
        (Premises
            (FoldAll (Count $name $n) $n 0 AddCount -> $total))
        (Conclusions
            (Count Total $total)))
    (STV 1.0 1.0)))

!(test
    (query (fromNumber 10) kb (: $prf (Count Total $x) $tv))
    (: (foldRule foldall) (Count Total 6) (STV 1.0 1.0)))

!(compileadd kb (: foldZeroRule
    (Implication
        (Premises
            (FoldAll (NoFact $x) $x 42 KeepAcc -> $total))
        (Conclusions
            (Count MissingTotal $total)))
    (STV 1.0 1.0)))

!(test
    (query (fromNumber 10) kb (: $prf (Count MissingTotal $x) $tv))
    (: (foldZeroRule foldall) (Count MissingTotal 42) (STV 1.0 1.0)))

!(compileadd kb (: apbisc
    (Implication
        (Premises
            (Count A $a)
            (Count B $b)
            (Compute + ($a $b) -> $c))
        (Conclusions
            (Count C $c)))
    (STV 1.0 1.0)))

!(test
    (query (fromNumber 10) kb (: prf (Count C $x) $tv))
    (: prf (Count C 3) (STV 1.0 1.0)))
