;; === port_logic.metta ===
;; Porting Metamath axioms and theorems into PeTTaChainer format.
;; Variables use symbolic placeholders (Sphi, Spsi, etc.) which are 
;; converted to MeTTa variables ($phi, $psi, etc.) by the shell script.

;; --- 1. THE DATA ---

;; ax-mp: Modus Ponens (from P and P->Q, conclude Q)
(MkIndexed 2 (MkAxiom ax-mp (Implication (Premises (Provable (→ Sphi Spsi)) (Provable Sphi)) (Conclusions (Provable Spsi)))))

;; ax-1: Simplification  phi -> (psi -> phi)
(MkIndexed 3 (MkAxiom ax-1 (→ Sphi (→ Spsi Sphi))))

;; ax-2: Distribution  (phi -> (psi -> chi)) -> ((phi -> psi) -> (phi -> chi))
(MkIndexed 4 (MkAxiom ax-2 (→ (→ Sphi (→ Spsi Schi)) (→ (→ Sphi Spsi) (→ Sphi Schi)))))

;; ax-3: Transposition  (~phi -> ~psi) -> (psi -> phi)
(MkIndexed 5 (MkAxiom ax-3 (→ (→ (¬ Sphi) (¬ Spsi)) (→ Spsi Sphi))))

;; mp2: Double Modus Ponens
(MkIndexed 6 (MkTheorem mp2 (λ mp2.1 mp2.2 mp2.3 (ax-mp mp2.2 (ax-mp mp2.1 mp2.3))) (→ Sphi (→ Spsi (→ (→ Sphi (→ Spsi Schi)) Schi)))))

;; mp2b
(MkIndexed 7 (MkTheorem mp2b (λ mp2b.1 mp2b.2 mp2b.3 (ax-mp (ax-mp mp2b.1 mp2b.2) mp2b.3)) (→ Sphi (→ (→ Sphi Spsi) (→ (→ Spsi Schi) Schi)))))

;; a1i: Introduction
(MkIndexed 8 (MkTheorem a1i (λ a1i.1 (ax-mp a1i.1 ax-1)) (→ Sphi (→ Spsi Sphi))))

;; 2a1i
(MkIndexed 9 (MkTheorem 2a1i (λ 2a1i.1 (a1i (a1i 2a1i.1))) (→ Sphi (→ Spsi (→ Schi Sphi)))))

;; mp1i
(MkIndexed 10 (MkTheorem mp1i (λ mp1i.1 mp1i.2 (a1i (ax-mp mp1i.1 mp1i.2))) (→ Sphi (→ (→ Sphi Spsi) (→ Schi Spsi)))))

;; a2i
(MkIndexed 11 (MkTheorem a2i (λ a2i.1 (ax-mp a2i.1 ax-2)) (→ (→ Sphi (→ Spsi Schi)) (→ (→ Sphi Spsi) (→ Sphi Schi)))))

;; mpd
(MkIndexed 12 (MkTheorem mpd (λ mpd.1 mpd.2 (ax-mp mpd.1 (a2i mpd.2))) (→ (→ Sphi Spsi) (→ (→ Sphi (→ Spsi Schi)) (→ Sphi Schi)))))

;; imim2i
(MkIndexed 13 (MkTheorem imim2i (λ imim2i.1 (a2i (a1i imim2i.1))) (→ (→ Sphi Spsi) (→ (→ Schi Sphi) (→ Schi Spsi)))))

;; syl: Syllogism
(MkIndexed 14 (MkTheorem syl (λ syl.1 syl.2 (mpd syl.1 (a1i syl.2))) (→ (→ Sphi Spsi) (→ (→ Spsi Schi) (→ Sphi Schi)))))

;; 3syl
(MkIndexed 15 (MkTheorem 3syl (λ 3syl.1 3syl.2 3syl.3 (syl (syl 3syl.1 3syl.2) 3syl.3)) (→ (→ Sphi Spsi) (→ (→ Spsi Schi) (→ (→ Schi Stheta) (→ Sphi Stheta))))))

;; id
(MkIndexed 19 (MkTheorem id (mpd ax-1 ax-1) (→ Sphi Sphi)))

;; idALT: Identity (phi -> phi)
(MkIndexed 20 (MkTheorem idALT (ax-mp ax-1 (ax-mp ax-1 ax-2)) (→ Sphi Sphi)))

;; idd: Identity Distribution
(MkIndexed 21 (MkTheorem idd (a1i id) (→ Sphi (→ Spsi Spsi))))


;; --- 2. THE PORTING FUNCTIONS ---

;; Port an axiom: produce a PeTTaChainer kb entry.
(= (port-axiom (MkAxiom $name (Implication $prems $concls)))
   (: (no_inverse $name) (Implication $prems $concls) (STV 1.0 1.0)))

(= (port-axiom (MkAxiom $name (→ $a $b)))
   (: (no_inverse $name) (Provable (→ $a $b)) (STV 1.0 1.0)))

;; Port a theorem: produce a PeTTaChainer kb entry
(= (port-theorem (MkTheorem $name $proof $logic))
   (: ($name $proof) (Provable $logic) (STV 1.0 1.0)))

;; Route to correct function
(= (port-item (MkAxiom $name $logic))         (port-axiom  (MkAxiom $name $logic)))
(= (port-item (MkTheorem $name $proof $logic)) (port-theorem (MkTheorem $name $proof $logic)))


;; --- 3. THE EXECUTION ---
!(match &self (MkIndexed $idx $item) (port-item $item))