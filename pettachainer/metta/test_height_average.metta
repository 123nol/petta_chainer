!(import! &self petta_chainer)

(= (AndFormula (STV $s $c) (Stats $sum $count))
   (STV $s $c))
(= (AndFormula (Stats $sum $count) (STV $s $c))
   (STV $s $c))

(= (AccHeightStats (Stats $sum $count) (STV $h $c))
   (Stats (+ $sum $h) (+ $count 1)))
(= (AverageFromStats (Stats $sum $count))
   (/ $sum $count))

!(compileadd kb (: group1 (Group g1) (STV 1.0 1.0)))
!(compileadd kb (: group2 (Group g2) (STV 1.0 1.0)))

!(compileadd kb (: h11 (Height g1 alice) (STV 160 1.0)))
!(compileadd kb (: h12 (Height g1 bob) (STV 170 1.0)))
!(compileadd kb (: h13 (Height g1 carol) (STV 180 1.0)))

!(compileadd kb (: h21 (Height g2 dan) (STV 150 1.0)))
!(compileadd kb (: h22 (Height g2 erin) (STV 170 1.0)))

!(compileadd kb (: avgHeightRule
    (Implication
        (Premises
            (Group $g)
            (FoldAllValue (Height $g $person) $tvh (Stats 0 0) AccHeightStats -> $stats))
        (Conclusions
            (HeightStats $g $stats)))
    (STV 1.0 1.0)))

!(test
    (let (: $prf (HeightStats g1 $stats) $tv)
         (query 80 kb (: $prf (HeightStats g1 $stats) $tv))
         (AverageFromStats $stats))
    170)

!(test
    (let (: $prf (HeightStats g2 $stats) $tv)
         (query 80 kb (: $prf (HeightStats g2 $stats) $tv))
         (AverageFromStats $stats))
    160)

!(test
    (let (: $prf (HeightStats g1 $stats) $tv)
         (query 80 kb (: $prf (HeightStats g1 $stats) $tv))
         (let (STV $s $c) $tv (and (> $s 0.99) (> $c 0.99))))
    true)
