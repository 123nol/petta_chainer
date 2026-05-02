!(import! &self ../petta_chainer)

;; ============================================================
;; --- LOAD PORTED LOGIC ---
;; ============================================================
;; Load the axioms and theorems generated from Metamath
!(import! &self ../metamath_axioms)


;; ============================================================
;; --- AXIOM: ax-1 (Simplification) ---
;; phi -> (psi -> phi)
;; ============================================================

;; Test: Verify that a valid instance of ax-1 is provable
!(assertEqual 
    (collapse (let (: $prf $logic $tv) (query 10 kb (: $prf (Provable (→ (PropP) (→ (PropQ) (PropP)))) $tv)) $logic))
    ((Provable (→ (PropP) (→ (PropQ) (PropP))))))

;; Test: Negative check - verify that an invalid formula (P -> (Q -> R)) is NOT proven by ax-1
!(assertEqual 
    (collapse (query 10 kb (: $prf (Provable (→ (PropA) (→ (PropB) (PropC)))) $tv)))
    ())


;; ============================================================
;; --- THEOREM: idALT (Identity) ---
;; phi -> phi
;; ============================================================

;; Test: Verify that the chainer can use the derived Identity theorem
!(assertEqual 
    (collapse (let (: $prf $logic $tv) (query 10 kb (: $prf (Provable (→ (PropX) (PropX))) $tv)) $logic))
    ((Provable (→ (PropX) (PropX)))))


;; ============================================================
;; --- COMPLEX DERIVATION: Syllogism (ax-mp chaining) ---
;; Given P, Q, and (P -> (Q -> R)), prove R
;; ============================================================

;; Setup Local Hypotheses
!(compileadd kb (: hyp-phi (Provable (PropP)) (STV 1.0 1.0)))
!(compileadd kb (: hyp-psi (Provable (PropQ)) (STV 1.0 1.0)))
!(compileadd kb (: hyp-imp (Provable (→ (PropP) (→ (PropQ) (PropR)))) (STV 1.0 1.0)))

;; Test: Verify that PropR is derivable using Modus Ponens (ax-mp)
!(assertEqual 
    (collapse (let (: $prf $logic $tv) (query 30 kb (: $prf (Provable (PropR)) $tv)) $logic))
    ((Provable (PropR))))
