!(import! &self ../../petta_chainer)
!(import! &self ../axioms/metamath_axioms)

    ;; idi test

    ;; Facts
;!(compileadd kb (: fact-P PropP (STV 1.0 1.0)))
    ;;identity axiom should allow us to derive P->P
    ;!(test
    ;(collapse (query 10 kb (: $prf (PropP) $tv)))
        ;((:
            ;(merge/revision
            ;(rule-proof (no_inverse pm2.18) (ctx proof 172))
            ;(rule-proof (no_inverse pm2.18i) (ctx proof 173)))
            ;(PropP)
            ;(STV 1.0 0.9473684210526316))))

                ;;; a1ii test
                ;; Facts
            ;!(compileadd kb (:fact-A PropP (STV 1.0 1.0)))
            ;!(compileadd kb (:fact-B PropP (STV 1.0 1.0)))

                ;; if A and B are true then P is true
                ;!(test
                ;(collapse (query 10 kb (: $prf (PropA) $tv)))
                    ;((:
                        ;(merge/revision
                        ;(rule-proof (no_inverse pm2.18) (ctx proof 172))
                        ;(rule-proof (no_inverse pm2.18i) (ctx proof 173)))
                        ;(PropA)
                        ;(STV 1.0 0.9473684210526316))))

                        ;; ax-mp test(modus ponens test)

                            ;; facts
                        ;!(compileadd kb (: fact-X PropX (STV 1.0 1.0)))
                        ; !(compileadd kb (: fact-X-impl-Y (Implication (Premises PropX)) (Conclusions PropY)) (STV 1.0 1.0))

                            ;;if x, x->y then y
                            ;!(test
                            ;(collapse (query 10 kb (: $prf (PropY) $tv)))
                                ;((:
                                    ;(merge/revision
                                    ;(rule-proof (no_inverse pm2.18) (ctx proof 172))
                                    ;(rule-proof (no_inverse pm2.18i) (ctx proof 173)))
                                    ;(PropY)
                                    ;(STV 1.0 0.9473684210526316))))
                                        ;; ax-1 test

                                        ;; facts
                                    ;!(compileadd kb (: fact-M (PropM) (STV 1.0 1.0)))
                                        ;; from fact m we should be able to drive n->m
                                        ;!(test
                                            ; (collapse
                                                ; (query 10 kb
                                                    ; (: $prf
                                                        ;(Implication
                                                        ;(Premises (PropN))
                                                        ;(Conclusions (PropM)))
                                                        ;$tv)))
                                                        ;((:
                                                            ;(merge/revision
                                                            ;(rule-proof (no_inverse pm2.18) (ctx proof 172))
                                                            ;(rule-proof (no_inverse pm2.18i) (ctx proof 173)))
                                                                ;(Implication
                                                                ;(Premises (PropN))
                                                                ;(Conclusions (PropM)))
                                                                ;(STV 1.0 0.9473684210526316))))


                                                                    ;test ax-2

                                                                    ;;facts
                                                                    ;!(compileadd kb
                                                                        ; (: fact-U-impl-V-impl-W
                                                                            ;(Implication
                                                                            ;(Premises (PropU))
                                                                                ;(Conclusions
                                                                                    ;(Implication
                                                                                    ;(Premises (PropV))
                                                                                    
                                                                                    ;(Conclusions (PropW)))))
                                                                                    ;(STV 1.0 1.0)))
                                                                                    ; if u->v->w then (u->v)->(u->w)
                                                                                        ;!(test
                                                                                            ;(collapse
                                                                                                ; (query 10 kb
                                                                                                    ;(: $prf
                                                                                                        ; (Implication
                                                                                                            ;(Premises
                                                                                                                ; (Implication
                                                                                                                ;(Premises (PropU))
                                                                                                                ;(Conclusions (PropV))))
                                                                                                                    ;(Conclusions
                                                                                                                        ; (Implication
                                                                                                                        ;(Premises (PropU))
                                                                                                                        ;(Conclusions (PropW)))))
                                                                                                                        ;$tv)))
                                                                                                                    ;()) ; the chainer is responding with () for this axiom test,
                                                                                                                        ;which is not correct.
                                                                                                                    
      

   


                                                                                                                        ;test for ax-3
                                                                                                                        ; not k->not l then l->k


                                                                                                                        ;; facts
                                                                                                                        !(compileadd kb
                                                                                                                            (: fact-not-K-impl-not-L
                                                                                                                                (Implication
                                                                                                                                (Premises (Not (PropK)))
                                                                                                                                (Conclusions (Not (PropL))))
                                                                                                                                (STV 1.0 1.0)))
                                                                                                                                    ;; if not k->not l then l->k test

                                                                                                                                    !(test
                                                                                                                                        (collapse
                                                                                                                                            (query 10 kb
                                                                                                                                                (: $prf
                                                                                                                                                    (Implication
                                                                                                                                                    (Premises (PropL))
                                                                                                                                                    (Conclusions (PropK)))
                                                                                                                                                    $tv)))
                                                                                                                                                    ((:
                                                                                                                                                        (merge/revision
                                                                                                                                                        (rule-proof (no_inverse pm2.18) (ctx proof 172))
                                                                                                                                                        (rule-proof (no_inverse pm2.18i) (ctx proof 173)))
                                                                                                                                                            (Implication
                                                                                                                                                            (Premises (PropL))
                                                                                                                                                            (Conclusions (PropK)))
                                                                                                                                                            (STV 1.0 0.9473684210526316))))
                                                                                                                                              

                                                                                                                                            