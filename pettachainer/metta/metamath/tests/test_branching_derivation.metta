!(import! &self ../../petta_chainer)
!(import! &self ../axioms/metamath_axioms)

    ;;Fact
    !(compileadd kb (: fact-A
    (PropA) (STV 1.0 1.0)))

        ;; A->B
        !(compileadd kb
            (: fact-A-impl-B
            (Implication (Premises (PropA))
            (Conclusions (PropB)))
            (STV 1.0 1.0)))
                ;; A->C
                !(compileadd kb
                    (: fact-A-impl-C
                    (Implication (Premises (PropA))
                    (Conclusions (PropC)))
                    (STV 1.0 1.0)))
                        !(test
                        (collapse (query 10 kb (: $prf (PropB) $tv)))
                            ((:
                                (merge/revision
                                    (merge/revision
                                    (rule-proof fact-A-impl-B fact-A)
                                    (rule-proof (no_inverse pm2.18) (ctx proof 172)))
                                    (rule-proof (no_inverse pm2.18i) (ctx proof 173)))
                                    (PropB)
                                    (STV 1.0 0.9642857142857143))))

                                        !(test
                                        (collapse (query 10 kb (: $prf (PropC) $tv)))
                                            ((:
                                                (merge/revision
                                                    (merge/revision
                                                    (rule-proof fact-A-impl-C fact-A)
                                                    (rule-proof (no_inverse pm2.18) (ctx proof 172)))
                                                    (rule-proof (no_inverse pm2.18i) (ctx proof 173)))
                                                    (PropC)
                                                    (STV 1.0 0.9642857142857143))))
                            