!(import! &self petta_chainer)

!(mm2compile kb
   (: foldRule
      (Implication (Premises (FoldAll (Score $name $n) $n 0 (|-> ($acc $elem) (+ $acc $elem)) -> $total))
         (Conclusions (ScoreTotal $total)))
      (STV 1.0 1.0)))
