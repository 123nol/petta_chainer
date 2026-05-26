;; test_metamath_axioms_native_format.metta
;;
;; Tests for the updated Metamath -> PeTTaChainer parser.
;;
;; IMPORTANT:
;; The updated parser maps object-level implication and negation like this:
;;
;;   (→ P Q)  ==>  (Implication (Premises P) (Conclusions Q))
;;   (¬ P)    ==>  (Not P)
;;
;; So these tests intentionally do NOT use:
;;
;;   (Provable ...)
;;   (→ P Q)
;;   (¬ P)
;;
;; in the test facts/goals.
;;
;; If your generated metamath_axioms file still wraps theorem formulas in
;; (Provable ...), then use your older test style instead. This file is for
;; the parser version that emits formulas directly in the native rule format.
!(import! &self ../../petta_chainer)
!(import! &self ../axioms/metamath_axioms)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Helper convention used in comments:
;;
;;   P => Q means:
;;
;;   (Implication
;;      (Premises P)
;;      (Conclusions Q))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEST 1: ax-mp / modus ponens
;;
;; Rule shape expected:
;;   premises:    P, P => Q
;;   conclusion:  Q
;;
;; Local hypotheses/facts:
;;   AxmpP
;;   AxmpP => AxmpQ
;;
;; Goal:
;;   AxmpQ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!(compileadd kb
   (: test-axmp-local-P
      (AxmpP)
      (STV 1.0 1.0)))

!(compileadd kb
   (: test-axmp-local-P-implies-Q
      (Implication
         (Premises (AxmpP))
         (Conclusions (AxmpQ)))
      (STV 1.0 1.0)))

!(query 40 kb
   (: $prf
      (AxmpQ)
      $tv))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEST 2: ax-1
;;
;; Axiom/theorem shape expected:
;;   P => (Q => P)
;;
;; No local hypotheses are needed.
;;
;; Goal:
;;   Ax1P => (Ax1Q => Ax1P)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!(query 40 kb
   (: $prf
      (Implication
         (Premises (Ax1P))
         (Conclusions
            (Implication
               (Premises (Ax1Q))
               (Conclusions (Ax1P)))))
      $tv))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEST 3: ax-2
;;
;; Axiom/theorem shape expected:
;;   (P => (Q => R)) => ((P => Q) => (P => R))
;;
;; No local hypotheses are needed.
;;
;; Goal:
;;   (Ax2P => (Ax2Q => Ax2R)) => ((Ax2P => Ax2Q) => (Ax2P => Ax2R))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!(query 60 kb
   (: $prf
      (Implication
         (Premises
            (Implication
               (Premises (Ax2P))
               (Conclusions
                  (Implication
                     (Premises (Ax2Q))
                     (Conclusions (Ax2R))))))
         (Conclusions
            (Implication
               (Premises
                  (Implication
                     (Premises (Ax2P))
                     (Conclusions (Ax2Q))))
               (Conclusions
                  (Implication
                     (Premises (Ax2P))
                     (Conclusions (Ax2R)))))))
      $tv))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEST 4: ax-3
;;
;; Axiom/theorem shape expected:
;;   ((not P) => (not Q)) => (Q => P)
;;
;; No local hypotheses are needed.
;;
;; Goal:
;;   ((Not Ax3P) => (Not Ax3Q)) => (Ax3Q => Ax3P)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!(query 60 kb
   (: $prf
      (Implication
         (Premises
            (Implication
               (Premises (Not (Ax3P)))
               (Conclusions (Not (Ax3Q)))))
         (Conclusions
            (Implication
               (Premises (Ax3Q))
               (Conclusions (Ax3P)))))
      $tv))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEST 5: idi / identity implication
;;
;; Theorem shape expected:
;;   P => P
;;
;; No local hypotheses are needed.
;;
;; Goal:
;;   IdiP => IdiP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!(query 40 kb
   (: $prf
      (Implication
         (Premises (IdiP))
         (Conclusions (IdiP)))
      $tv))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEST 6: a1ii
;;
;; Rule shape expected:
;;   premises:    P, Q
;;   conclusion:  P
;;
;; Local hypotheses/facts:
;;   A1iiP
;;   A1iiQ
;;
;; Goal:
;;   A1iiP
;;
;; Note: Because A1iiP is also a local fact, this may be solved directly by
;; fact lookup as well as through a1ii. It is still useful as a smoke test that
;; the rule can consume two local premises.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!(compileadd kb
   (: test-a1ii-local-P
      (A1iiP)
      (STV 1.0 1.0)))

!(compileadd kb
   (: test-a1ii-local-Q
      (A1iiQ)
      (STV 1.0 1.0)))

!(query 40 kb
   (: $prf
      (A1iiP)
      $tv))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEST 7: syllogism-style theorem, usually named syl
;;
;; Expected theorem/rule shape:
;;   premises:    P => Q, Q => R
;;   conclusion:  P => R
;;
;; Local hypotheses/facts:
;;   SylP => SylQ
;;   SylQ => SylR
;;
;; Goal:
;;   SylP => SylR
;;
;; This test only succeeds if your imported metamath_axioms contains a theorem
;; such as syl with this conclusion structure.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!(compileadd kb
   (: test-syl-P-implies-Q
      (Implication
         (Premises (SylP))
         (Conclusions (SylQ)))
      (STV 1.0 1.0)))

!(compileadd kb
   (: test-syl-Q-implies-R
      (Implication
         (Premises (SylQ))
         (Conclusions (SylR)))
      (STV 1.0 1.0)))

!(query 60 kb
   (: $prf
      (Implication
         (Premises (SylP))
         (Conclusions (SylR)))
      $tv))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEST 8: abduction heuristic rule
;;
;; Rule shape expected:
;;   premises:    P => R, Q => R
;;   conclusion:  P => Q
;;
;; Local hypotheses/facts:
;;   AbdP => AbdR
;;   AbdQ => AbdR
;;
;; Goal:
;;   AbdP => AbdQ
;;
;; This test is for your PLN/heuristic abduction rule if it is loaded into kb.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!(compileadd kb
   (: test-abduction-P-implies-R
      (Implication
         (Premises (AbdP))
         (Conclusions (AbdR)))
      (STV 1.0 1.0)))

!(compileadd kb
   (: test-abduction-Q-implies-R
      (Implication
         (Premises (AbdQ))
         (Conclusions (AbdR)))
      (STV 1.0 1.0)))

!(query 60 kb
   (: $prf
      (Implication
         (Premises (AbdP))
         (Conclusions (AbdQ)))
      $tv))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEST 9: induction heuristic rule
;;
;; Rule shape expected:
;;   premises:    R => P, R => Q
;;   conclusion:  P => Q
;;
;; Local hypotheses/facts:
;;   IndR => IndP
;;   IndR => IndQ
;;
;; Goal:
;;   IndP => IndQ
;;
;; This test is for your PLN/heuristic induction rule if it is loaded into kb.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!(compileadd kb
   (: test-induction-R-implies-P
      (Implication
         (Premises (IndR))
         (Conclusions (IndP)))
      (STV 1.0 1.0)))

!(compileadd kb
   (: test-induction-R-implies-Q
      (Implication
         (Premises (IndR))
         (Conclusions (IndQ)))
      (STV 1.0 1.0)))

!(query 60 kb
   (: $prf
      (Implication
         (Premises (IndP))
         (Conclusions (IndQ)))
      $tv))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEST 10: pm5.36
;;
;; Parsed theorem example:
;;
;;   (↔ (∧ phi (↔ phi psi))
;;      (∧ psi (↔ phi psi)))
;;
;; In the updated parser, implication and negation are word-mapped, but
;; conjunction and biconditional remain generic compound formula symbols:
;;
;;   (↔ ...)
;;   (∧ ...)
;;
;; No local hypotheses are needed.
;;
;; Goal:
;;   (↔ (∧ P (↔ P Q))
;;      (∧ Q (↔ P Q)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!(query 60 kb
   (: $prf
      (↔
         (∧ (Pm536P)
            (↔ (Pm536P) (Pm536Q)))
         (∧ (Pm536Q)
            (↔ (Pm536P) (Pm536Q))))
      $tv))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEST 11: syl22anc
;;
;; Source theorem shape:
;;
;;   (-> (→ phi psi)
;;       (→ phi chi)
;;       (→ phi theta)
;;       (→ phi tau)
;;       (→ (∧ (∧ psi chi) (∧ theta tau)) eta)
;;       (→ phi eta))
;;
;; Updated parser rule shape:
;;
;;   premises:
;;     Phi => Psi
;;     Phi => Chi
;;     Phi => Theta
;;     Phi => Tau
;;     ((Psi ∧ Chi) ∧ (Theta ∧ Tau)) => Eta
;;
;;   conclusion:
;;     Phi => Eta
;;
;; Local hypotheses/facts:
;;   Syl22P => Syl22Q
;;   Syl22P => Syl22R
;;   Syl22P => Syl22S
;;   Syl22P => Syl22T
;;   ((Syl22Q ∧ Syl22R) ∧ (Syl22S ∧ Syl22T)) => Syl22U
;;
;; Goal:
;;   Syl22P => Syl22U
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!(compileadd kb
   (: test-syl22-P-implies-Q
      (Implication
         (Premises (Syl22P))
         (Conclusions (Syl22Q)))
      (STV 1.0 1.0)))

!(compileadd kb
   (: test-syl22-P-implies-R
      (Implication
         (Premises (Syl22P))
         (Conclusions (Syl22R)))
      (STV 1.0 1.0)))

!(compileadd kb
   (: test-syl22-P-implies-S
      (Implication
         (Premises (Syl22P))
         (Conclusions (Syl22S)))
      (STV 1.0 1.0)))

!(compileadd kb
   (: test-syl22-P-implies-T
      (Implication
         (Premises (Syl22P))
         (Conclusions (Syl22T)))
      (STV 1.0 1.0)))

!(compileadd kb
   (: test-syl22-combined-implies-U
      (Implication
         (Premises
            (∧
               (∧ (Syl22Q) (Syl22R))
               (∧ (Syl22S) (Syl22T))))
         (Conclusions (Syl22U)))
      (STV 1.0 1.0)))

!(query 100 kb
   (: $prf
      (Implication
         (Premises (Syl22P))
         (Conclusions (Syl22U)))
      $tv))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEST 12: negation as local hypothesis
;;
;; This is a smaller smoke test for the updated parser's negation representation.
;;
;; Local hypotheses/facts:
;;   (Not NegP) => (Not NegQ)
;;
;; Goal:
;;   (Not NegP) => (Not NegQ)
;;
;; This should be solvable by direct fact lookup; it is useful to check that
;; your concrete test file uses the same Not-shape as the generated axioms.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!(compileadd kb
   (: test-negation-shape
      (Implication
         (Premises (Not (NegP)))
         (Conclusions (Not (NegQ))))
      (STV 1.0 1.0)))

!(query 40 kb
   (: $prf
      (Implication
         (Premises (Not (NegP)))
         (Conclusions (Not (NegQ))))
      $tv))
