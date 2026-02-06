!(import! &self petta_chainer)

!(add-atom &kb (: kb prf (Count A 1) (STV 1.0 1.0)))
!(add-atom &kb (: kb prf (Count B 2) (STV 1.0 1.0)))
!(add-atom &kb (: kb prf (Count C 3) (STV 1.0 1.0)))
!(add-atom &kb (: kb prf (Score A 1) (STV 1.0 1.0)))
!(add-atom &kb (: kb prf (Score B 2) (STV 1.0 1.0)))
!(add-atom &kb (: kb prf (Score C 3) (STV 1.0 1.0)))

(= (KeepAcc $acc $elem) $acc)

!(compileadd kb (: foldRule
    (Implication
        (Premises
            (FoldAll (Score $name $n) $n 0 (|-> ($acc $elem) (+ $acc $elem)) -> $total))
        (Conclusions
            (ScoreTotal $total)))
    (STV 1.0 1.0)))

!(test
    (query (fromNumber 10) kb (: $prf (ScoreTotal $x) $tv))
    (: (foldRule foldall) (ScoreTotal 6) (STV 1.0 1.0)))

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

!(compileadd kb (: numFromCount
    (Implication
        (Premises
            (Count $name $n)
            (Compute NotEqual ($name MissingTotal) -> True))
        (Conclusions
            (Num $n)))
    (STV 1.0 1.0)))

!(compileadd kb (: foldDerivedRule
    (Implication
        (Premises
            (FoldAll (Num $n) $n 0 (|-> ($acc $elem) (+ $acc $elem)) -> $total))
        (Conclusions
            (DerivedTotal $total)))
    (STV 1.0 1.0)))

!(test
    (query (fromNumber 10) kb (: $prf (DerivedTotal $x) $tv))
    (: (foldDerivedRule foldall) (DerivedTotal 12) (STV 1.0 1.0)))

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
