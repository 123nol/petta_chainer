!(import! &self ../../petta_chainer)

!(import! &self ../../logic_configs/predicate_logic)

!(compileadd kb (: fact-P (PropP) (STV 1.0 1.0)))

!(query 10 kb (: $prf (Not  PropP ) $tv))