!(import! &self ../../petta_chainer)

!(import! &self ../../logic_configs/predicate_logic)

!(compileadd kb (: fact-P (PropP) (STV 1.0 1.0)))

 !(test
    (collapse (query 10 kb (: $prf (Or (PropP) (PropQ)) $tv)))
    ((: (rule-proof rule-proof Orintroduction fact-P) (Or (PropP) (PropQ)) (STV 1.0 1.0))))