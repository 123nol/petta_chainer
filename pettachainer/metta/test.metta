!(import! &self petta_chainer)

!(add-atom &kb (: kb prf (Count A 1) (STV 1.0 1.0)))
!(add-atom &kb (: kb prf (Count B 2) (STV 1.0 1.0)))

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
    (> (size-atom (collapse (query (fromNumber 10) kb (: $prf (Count C 3) $tv)))) 0)
    True)
