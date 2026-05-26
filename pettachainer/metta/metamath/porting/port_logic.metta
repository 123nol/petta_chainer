;; === port_logic.metta ===
;; Porting Metamath axioms and theorems into PeTTaChainer format.
;; Variables use symbolic placeholders (Sphi, Spsi, etc.) which are 
;; converted to MeTTa variables ($phi, $psi, etc.) by the shell script.

;; --- 1. THE DATA ---

;; ax-mp: Modus Ponens (from P and P->Q, conclude Q)

(MkIndexed 0 (MkTheorem idi (λ idi.1 idi.1) (-> 𝜑 𝜑)))

(MkIndexed 1 (MkTheorem a1ii (λ a1ii.1 a1ii.2 a1ii.1) (-> 𝜑 𝜓 𝜑)))

(MkIndexed 2 (MkAxiom ax-mp (-> 𝜑 (→ 𝜑 𝜓) 𝜓)))

(MkIndexed 3 (MkAxiom ax-1 (→ 𝜑 (→ 𝜓 𝜑))))

(MkIndexed 4 (MkAxiom ax-2 (→ (→ 𝜑 (→ 𝜓 𝜒)) (→ (→ 𝜑 𝜓) (→ 𝜑 𝜒)))))

(MkIndexed 5 (MkAxiom ax-3 (→ (→ (¬ 𝜑) (¬ 𝜓)) (→ 𝜓 𝜑))))

(MkIndexed 6 (MkTheorem mp2 (λ mp2.1 mp2.2 mp2.3 (ax-mp mp2.2 (ax-mp mp2.1 mp2.3))) (-> 𝜑 𝜓 (→ 𝜑 (→ 𝜓 𝜒)) 𝜒)))

(MkIndexed 7 (MkTheorem mp2b (λ mp2b.1 mp2b.2 mp2b.3 (ax-mp (ax-mp mp2b.1 mp2b.2) mp2b.3)) (-> 𝜑 (→ 𝜑 𝜓) (→ 𝜓 𝜒) 𝜒)))

(MkIndexed 8 (MkTheorem a1i (λ a1i.1 (ax-mp a1i.1 ax-1)) (-> 𝜑 (→ 𝜓 𝜑))))

(MkIndexed 9 (MkTheorem 2a1i (λ 2a1i.1 (a1i (a1i 2a1i.1))) (-> 𝜑 (→ 𝜓 (→ 𝜒 𝜑)))))

(MkIndexed 10 (MkTheorem mp1i (λ mp1i.1 mp1i.2 (a1i (ax-mp mp1i.1 mp1i.2))) (-> 𝜑 (→ 𝜑 𝜓) (→ 𝜒 𝜓))))

(MkIndexed 11 (MkTheorem a2i (λ a2i.1 (ax-mp a2i.1 ax-2)) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ (→ 𝜑 𝜓) (→ 𝜑 𝜒)))))

(MkIndexed 12 (MkTheorem mpd (λ mpd.1 mpd.2 (ax-mp mpd.1 (a2i mpd.2))) (-> (→ 𝜑 𝜓) (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 𝜒))))

(MkIndexed 13 (MkTheorem imim2i (λ imim2i.1 (a2i (a1i imim2i.1))) (-> (→ 𝜑 𝜓) (→ (→ 𝜒 𝜑) (→ 𝜒 𝜓)))))

(MkIndexed 14 (MkTheorem syl (λ syl.1 syl.2 (mpd syl.1 (a1i syl.2))) (-> (→ 𝜑 𝜓) (→ 𝜓 𝜒) (→ 𝜑 𝜒))))

(MkIndexed 15 (MkTheorem 3syl (λ 3syl.1 3syl.2 3syl.3 (syl (syl 3syl.1 3syl.2) 3syl.3)) (-> (→ 𝜑 𝜓) (→ 𝜓 𝜒) (→ 𝜒 𝜃) (→ 𝜑 𝜃))))

(MkIndexed 16 (MkTheorem 4syl (λ 4syl.1 4syl.2 4syl.3 4syl.4 (syl (3syl 4syl.1 4syl.2 4syl.3) 4syl.4)) (-> (→ 𝜑 𝜓) (→ 𝜓 𝜒) (→ 𝜒 𝜃) (→ 𝜃 𝜏) (→ 𝜑 𝜏))))

(MkIndexed 17 (MkTheorem mpi (λ mpi.1 mpi.2 (mpd (a1i mpi.1) mpi.2)) (-> 𝜓 (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 𝜒))))

(MkIndexed 18 (MkTheorem mpisyl (λ mpisyl.1 mpisyl.2 mpisyl.3 (syl mpisyl.1 (mpi mpisyl.2 mpisyl.3))) (-> (→ 𝜑 𝜓) 𝜒 (→ 𝜓 (→ 𝜒 𝜃)) (→ 𝜑 𝜃))))

(MkIndexed 19 (MkTheorem id (mpd ax-1 ax-1) (→ 𝜑 𝜑)))

(MkIndexed 20 (MkTheorem idALT (ax-mp ax-1 (ax-mp ax-1 ax-2)) (→ 𝜑 𝜑)))

(MkIndexed 21 (MkTheorem idd (a1i id) (→ 𝜑 (→ 𝜓 𝜓))))

(MkIndexed 22 (MkTheorem a1d (λ a1d.1 (syl a1d.1 ax-1)) (-> (→ 𝜑 𝜓) (→ 𝜑 (→ 𝜒 𝜓)))))

(MkIndexed 23 (MkTheorem 2a1d (λ 2a1d.1 (a1d (a1d 2a1d.1))) (-> (→ 𝜑 𝜓) (→ 𝜑 (→ 𝜒 (→ 𝜃 𝜓))))))

(MkIndexed 24 (MkTheorem a1i13 (λ a1i13.1 (a1i (a1d a1i13.1))) (-> (→ 𝜓 𝜃) (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))))))

(MkIndexed 25 (MkTheorem 2a1 (2a1d id) (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜑)))))

(MkIndexed 26 (MkTheorem a2d (λ a2d.1 (syl a2d.1 ax-2)) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜑 (→ (→ 𝜓 𝜒) (→ 𝜓 𝜃))))))

(MkIndexed 27 (MkTheorem sylcom (λ sylcom.1 sylcom.2 (syl sylcom.1 (a2i sylcom.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜓 (→ 𝜒 𝜃)) (→ 𝜑 (→ 𝜓 𝜃)))))

(MkIndexed 28 (MkTheorem syl5com (λ syl5com.1 syl5com.2 (sylcom (a1d syl5com.1) syl5com.2)) (-> (→ 𝜑 𝜓) (→ 𝜒 (→ 𝜓 𝜃)) (→ 𝜑 (→ 𝜒 𝜃)))))

(MkIndexed 29 (MkTheorem com12 (λ com12.1 (syl5com id com12.1)) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜓 (→ 𝜑 𝜒)))))

(MkIndexed 30 (MkTheorem syl11 (λ syl11.1 syl11.2 (com12 (syl syl11.2 syl11.1))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜃 𝜑) (→ 𝜓 (→ 𝜃 𝜒)))))


(MkIndexed 31 (MkTheorem syl5 (λ syl5.1 syl5.2 (com12 (syl5com syl5.1 syl5.2))) (-> (→ 𝜑 𝜓) (→ 𝜒 (→ 𝜓 𝜃)) (→ 𝜒 (→ 𝜑 𝜃)))))

(MkIndexed 32 (MkTheorem syl6 (λ syl6.1 syl6.2 (sylcom syl6.1 (a1i syl6.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜒 𝜃) (→ 𝜑 (→ 𝜓 𝜃)))))

(MkIndexed 33 (MkTheorem syl56 (λ syl56.1 syl56.2 syl56.3 (syl5 syl56.1 (syl6 syl56.2 syl56.3))) (-> (→ 𝜑 𝜓) (→ 𝜒 (→ 𝜓 𝜃)) (→ 𝜃 𝜏) (→ 𝜒 (→ 𝜑 𝜏)))))

(MkIndexed 34 (MkTheorem syl6com (λ syl6com.1 syl6com.2 (com12 (syl6 syl6com.1 syl6com.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜒 𝜃) (→ 𝜓 (→ 𝜑 𝜃)))))

(MkIndexed 35 (MkTheorem mpcom (λ mpcom.1 mpcom.2 (mpd mpcom.1 (com12 mpcom.2))) (-> (→ 𝜓 𝜑) (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜓 𝜒))))

(MkIndexed 36 (MkTheorem syli (λ syli.1 syli.2 (sylcom syli.1 (com12 syli.2))) (-> (→ 𝜓 (→ 𝜑 𝜒)) (→ 𝜒 (→ 𝜑 𝜃)) (→ 𝜓 (→ 𝜑 𝜃)))))

(MkIndexed 37 (MkTheorem syl2im (λ syl2im.1 syl2im.2 syl2im.3 (syl syl2im.1 (syl5 syl2im.2 syl2im.3))) (-> (→ 𝜑 𝜓) (→ 𝜒 𝜃) (→ 𝜓 (→ 𝜃 𝜏)) (→ 𝜑 (→ 𝜒 𝜏)))))

(MkIndexed 38 (MkTheorem syl2imc (λ syl2im.1 syl2im.2 syl2im.3 (com12 (syl2im syl2im.1 syl2im.2 syl2im.3))) (-> (→ 𝜑 𝜓) (→ 𝜒 𝜃) (→ 𝜓 (→ 𝜃 𝜏)) (→ 𝜒 (→ 𝜑 𝜏)))))

(MkIndexed 39 (MkTheorem pm2.27 (com12 id) (→ 𝜑 (→ (→ 𝜑 𝜓) 𝜓))))

(MkIndexed 40 (MkTheorem mpdd (λ mpdd.1 mpdd.2 (mpd mpdd.1 (a2d mpdd.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜑 (→ 𝜓 𝜃)))))

(MkIndexed 41 (MkTheorem mpid (λ mpid.1 mpid.2 (mpdd (a1d mpid.1) mpid.2)) (-> (→ 𝜑 𝜒) (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜑 (→ 𝜓 𝜃)))))

(MkIndexed 42 (MkTheorem mpdi (λ mpdi.1 mpdi.2 (mpdd (a1i mpdi.1) mpdi.2)) (-> (→ 𝜓 𝜒) (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜑 (→ 𝜓 𝜃)))))

(MkIndexed 43 (MkTheorem mpii (λ mpii.1 mpii.2 (mpdi (a1i mpii.1) mpii.2)) (-> 𝜒 (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜑 (→ 𝜓 𝜃)))))

(MkIndexed 44 (MkTheorem syld (λ syld.1 syld.2 (mpdd syld.1 (a1d syld.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ 𝜒 𝜃)) (→ 𝜑 (→ 𝜓 𝜃)))))

(MkIndexed 45 (MkTheorem syldc (λ syld.1 syld.2 (com12 (syld syld.1 syld.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ 𝜒 𝜃)) (→ 𝜓 (→ 𝜑 𝜃)))))

(MkIndexed 46 (MkTheorem mp2d (λ mp2d.1 mp2d.2 mp2d.3 (mpd mp2d.1 (mpid mp2d.2 mp2d.3))) (-> (→ 𝜑 𝜓) (→ 𝜑 𝜒) (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜑 𝜃))))

(MkIndexed 47 (MkTheorem a1dd (λ a1dd.1 (syl6 a1dd.1 ax-1)) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ 𝜓 (→ 𝜃 𝜒))))))

(MkIndexed 48 (MkTheorem 2a1dd (λ 2a1dd.1 (a1dd (a1dd 2a1dd.1))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ 𝜓 (→ 𝜃 (→ 𝜏 𝜒)))))))

(MkIndexed 49 (MkTheorem pm2.43i (λ pm2.43i.1 (mpd id pm2.43i.1)) (-> (→ 𝜑 (→ 𝜑 𝜓)) (→ 𝜑 𝜓))))

(MkIndexed 50 (MkTheorem pm2.43d (λ pm2.43d.1 (mpdi id pm2.43d.1)) (-> (→ 𝜑 (→ 𝜓 (→ 𝜓 𝜒))) (→ 𝜑 (→ 𝜓 𝜒)))))

(MkIndexed 51 (MkTheorem pm2.43a (λ pm2.43a.1 (mpid id pm2.43a.1)) (-> (→ 𝜓 (→ 𝜑 (→ 𝜓 𝜒))) (→ 𝜓 (→ 𝜑 𝜒)))))

(MkIndexed 52 (MkTheorem pm2.43b (λ pm2.43b.1 (com12 (pm2.43a pm2.43b.1))) (-> (→ 𝜓 (→ 𝜑 (→ 𝜓 𝜒))) (→ 𝜑 (→ 𝜓 𝜒)))))

(MkIndexed 53 (MkTheorem pm2.43 (a2i pm2.27) (→ (→ 𝜑 (→ 𝜑 𝜓)) (→ 𝜑 𝜓))))

(MkIndexed 54 (MkTheorem imim2d (λ imim2d.1 (a2d (a1d imim2d.1))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ (→ 𝜃 𝜓) (→ 𝜃 𝜒))))))

(MkIndexed 55 (MkTheorem imim2 (imim2d id) (→ (→ 𝜑 𝜓) (→ (→ 𝜒 𝜑) (→ 𝜒 𝜓)))))

(MkIndexed 56 (MkTheorem embantd (λ embantd.1 embantd.2 (mpid embantd.1 (imim2d embantd.2))) (-> (→ 𝜑 𝜓) (→ 𝜑 (→ 𝜒 𝜃)) (→ 𝜑 (→ (→ 𝜓 𝜒) 𝜃)))))

(MkIndexed 57 (MkTheorem 3syld (λ 3syld.1 3syld.2 3syld.3 (syld (syld 3syld.1 3syld.2) 3syld.3)) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ 𝜒 𝜃)) (→ 𝜑 (→ 𝜃 𝜏)) (→ 𝜑 (→ 𝜓 𝜏)))))

(MkIndexed 58 (MkTheorem sylsyld (λ sylsyld.1 sylsyld.2 sylsyld.3 (syld sylsyld.2 (syl sylsyld.1 sylsyld.3))) (-> (→ 𝜑 𝜓) (→ 𝜑 (→ 𝜒 𝜃)) (→ 𝜓 (→ 𝜃 𝜏)) (→ 𝜑 (→ 𝜒 𝜏)))))

(MkIndexed 59 (MkTheorem imim12i (λ imim12i.1 imim12i.2 (syl5 imim12i.1 (imim2i imim12i.2))) (-> (→ 𝜑 𝜓) (→ 𝜒 𝜃) (→ (→ 𝜓 𝜒) (→ 𝜑 𝜃)))))


(MkIndexed 60 (MkTheorem imim1i (λ imim1i.1 (imim12i imim1i.1 id)) (-> (→ 𝜑 𝜓) (→ (→ 𝜓 𝜒) (→ 𝜑 𝜒)))))

(MkIndexed 61 (MkTheorem imim3i (λ imim3i.1 (a2d (imim2i imim3i.1))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ (→ 𝜃 𝜑) (→ (→ 𝜃 𝜓) (→ 𝜃 𝜒))))))

(MkIndexed 62 (MkTheorem sylc (λ sylc.1 sylc.2 sylc.3 (pm2.43i (syl2im sylc.1 sylc.2 sylc.3))) (-> (→ 𝜑 𝜓) (→ 𝜑 𝜒) (→ 𝜓 (→ 𝜒 𝜃)) (→ 𝜑 𝜃))))

(MkIndexed 63 (MkTheorem syl3c (λ syl3c.1 syl3c.2 syl3c.3 syl3c.4 (mpd syl3c.3 (sylc syl3c.1 syl3c.2 syl3c.4))) (-> (→ 𝜑 𝜓) (→ 𝜑 𝜒) (→ 𝜑 𝜃) (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏))) (→ 𝜑 𝜏))))

(MkIndexed 64 (MkTheorem syl6mpi (λ syl6mpi.1 syl6mpi.2 syl6mpi.3 (syl6 syl6mpi.1 (mpi syl6mpi.2 syl6mpi.3))) (-> (→ 𝜑 (→ 𝜓 𝜒)) 𝜃 (→ 𝜒 (→ 𝜃 𝜏)) (→ 𝜑 (→ 𝜓 𝜏)))))

(MkIndexed 65 (MkTheorem mpsyl (λ mpsyl.1 mpsyl.2 mpsyl.3 (sylc (a1i mpsyl.1) mpsyl.2 mpsyl.3)) (-> 𝜑 (→ 𝜓 𝜒) (→ 𝜑 (→ 𝜒 𝜃)) (→ 𝜓 𝜃))))

(MkIndexed 66 (MkTheorem mpsylsyld (λ mpsylsyld.1 mpsylsyld.2 mpsylsyld.3 (sylsyld (a1i mpsylsyld.1) mpsylsyld.2 mpsylsyld.3)) (-> 𝜑 (→ 𝜓 (→ 𝜒 𝜃)) (→ 𝜑 (→ 𝜃 𝜏)) (→ 𝜓 (→ 𝜒 𝜏)))))

(MkIndexed 67 (MkTheorem syl6c (λ syl6c.1 syl6c.2 syl6c.3 (mpdd syl6c.2 (syl6 syl6c.1 syl6c.3))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ 𝜓 𝜃)) (→ 𝜒 (→ 𝜃 𝜏)) (→ 𝜑 (→ 𝜓 𝜏)))))

(MkIndexed 68 (MkTheorem syl6ci (λ syl6ci.1 syl6ci.2 syl6ci.3 (syl6c syl6ci.1 (a1d syl6ci.2) syl6ci.3)) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 𝜃) (→ 𝜒 (→ 𝜃 𝜏)) (→ 𝜑 (→ 𝜓 𝜏)))))

(MkIndexed 69 (MkTheorem syldd (λ syldd.1 syldd.2 (syl6c syldd.2 syldd.1 imim2)) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜑 (→ 𝜓 (→ 𝜃 𝜏))) (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜏))))))

(MkIndexed 70 (MkTheorem syl5d (λ syl5d.1 syl5d.2 (syldd (a1d syl5d.1) syl5d.2)) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ 𝜃 (→ 𝜒 𝜏))) (→ 𝜑 (→ 𝜃 (→ 𝜓 𝜏))))))

(MkIndexed 71 (MkTheorem syl7 (λ syl7.1 syl7.2 (syl5d (a1i syl7.1) syl7.2)) (-> (→ 𝜑 𝜓) (→ 𝜒 (→ 𝜃 (→ 𝜓 𝜏))) (→ 𝜒 (→ 𝜃 (→ 𝜑 𝜏))))))

(MkIndexed 72 (MkTheorem syl6d (λ syl6d.1 syl6d.2 (syldd syl6d.1 (a1d syl6d.2))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜑 (→ 𝜃 𝜏)) (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜏))))))

(MkIndexed 73 (MkTheorem syl8 (λ syl8.1 syl8.2 (syl6d syl8.1 (a1i syl8.2))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜃 𝜏) (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜏))))))

(MkIndexed 74 (MkTheorem syl9 (λ syl9.1 syl9.2 (syl5d syl9.1 (a1i syl9.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜃 (→ 𝜒 𝜏)) (→ 𝜑 (→ 𝜃 (→ 𝜓 𝜏))))))

(MkIndexed 75 (MkTheorem syl9r (λ syl9r.1 syl9r.2 (com12 (syl9 syl9r.1 syl9r.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜃 (→ 𝜒 𝜏)) (→ 𝜃 (→ 𝜑 (→ 𝜓 𝜏))))))

(MkIndexed 76 (MkTheorem syl10 (λ syl10.1 syl10.2 syl10.3 (syldd syl10.2 (syl6 syl10.1 syl10.3))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ 𝜓 (→ 𝜃 𝜏))) (→ 𝜒 (→ 𝜏 𝜂)) (→ 𝜑 (→ 𝜓 (→ 𝜃 𝜂))))))

(MkIndexed 77 (MkTheorem a1ddd (λ a1ddd.1 (syl8 a1ddd.1 ax-1)) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜏))) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))))))

(MkIndexed 78 (MkTheorem imim12d (λ imim12d.1 imim12d.2 (syl5d imim12d.1 (imim2d imim12d.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ 𝜃 𝜏)) (→ 𝜑 (→ (→ 𝜒 𝜃) (→ 𝜓 𝜏))))))

(MkIndexed 79 (MkTheorem imim1d (λ imim1d.1 (imim12d imim1d.1 idd)) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ (→ 𝜒 𝜃) (→ 𝜓 𝜃))))))

(MkIndexed 80 (MkTheorem imim1 (imim1d id) (→ (→ 𝜑 𝜓) (→ (→ 𝜓 𝜒) (→ 𝜑 𝜒)))))

(MkIndexed 81 (MkTheorem pm2.83 (imim3i imim1) (→ (→ 𝜑 (→ 𝜓 𝜒)) (→ (→ 𝜑 (→ 𝜒 𝜃)) (→ 𝜑 (→ 𝜓 𝜃))))))

(MkIndexed 82 (MkTheorem peirceroll (syl9r imim1 id) (→ (→ (→ (→ 𝜑 𝜓) 𝜑) 𝜑) (→ (→ (→ 𝜑 𝜓) 𝜒) (→ (→ 𝜒 𝜑) 𝜑)))))

(MkIndexed 83 (MkTheorem com23 (λ com3.1 (syl9 com3.1 pm2.27)) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜑 (→ 𝜒 (→ 𝜓 𝜃))))))

(MkIndexed 84 (MkTheorem com3r (λ com3.1 (com12 (com23 com3.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜒 (→ 𝜑 (→ 𝜓 𝜃))))))

(MkIndexed 85 (MkTheorem com13 (λ com3.1 (com23 (com3r com3.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜒 (→ 𝜓 (→ 𝜑 𝜃))))))

(MkIndexed 86 (MkTheorem com3l (λ com3.1 (com3r (com3r com3.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜓 (→ 𝜒 (→ 𝜑 𝜃))))))

(MkIndexed 87 (MkTheorem pm2.04 (com23 id) (→ (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜓 (→ 𝜑 𝜒)))))

(MkIndexed 88 (MkTheorem com34 (λ com4.1 (syl6 com4.1 pm2.04)) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))) (→ 𝜑 (→ 𝜓 (→ 𝜃 (→ 𝜒 𝜏)))))))

(MkIndexed 89 (MkTheorem com4l (λ com4.1 (com34 (com3l com4.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))) (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜑 𝜏)))))))

(MkIndexed 90 (MkTheorem com4t (λ com4.1 (com4l (com4l com4.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))) (→ 𝜒 (→ 𝜃 (→ 𝜑 (→ 𝜓 𝜏)))))))

(MkIndexed 91 (MkTheorem com4r (λ com4.1 (com4l (com4t com4.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))) (→ 𝜃 (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜏)))))))

(MkIndexed 92 (MkTheorem com24 (λ com4.1 (com13 (com4t com4.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))) (→ 𝜑 (→ 𝜃 (→ 𝜒 (→ 𝜓 𝜏)))))))

(MkIndexed 93 (MkTheorem com14 (λ com4.1 (com3r (com4l com4.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))) (→ 𝜃 (→ 𝜓 (→ 𝜒 (→ 𝜑 𝜏)))))))

(MkIndexed 94 (MkTheorem com45 (λ com5.1 (syl8 com5.1 pm2.04)) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜏 (→ 𝜃 𝜂))))))))

(MkIndexed 95 (MkTheorem com35 (λ com5.1 (com34 (com45 (com34 com5.1)))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))) (→ 𝜑 (→ 𝜓 (→ 𝜏 (→ 𝜃 (→ 𝜒 𝜂))))))))

(MkIndexed 96 (MkTheorem com25 (λ com5.1 (com24 (com45 (com24 com5.1)))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))) (→ 𝜑 (→ 𝜏 (→ 𝜒 (→ 𝜃 (→ 𝜓 𝜂))))))))

(MkIndexed 97 (MkTheorem com5l (λ com5.1 (com45 (com4l com5.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))) (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 (→ 𝜑 𝜂))))))))

(MkIndexed 98 (MkTheorem com15 (λ com5.1 (com4r (com5l com5.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))) (→ 𝜏 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜑 𝜂))))))))

(MkIndexed 99 (MkTheorem com52l (λ com5.1 (com5l (com5l com5.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))) (→ 𝜒 (→ 𝜃 (→ 𝜏 (→ 𝜑 (→ 𝜓 𝜂))))))))

(MkIndexed 100 (MkTheorem com52r (λ com5.1 (com5l (com52l com5.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))) (→ 𝜃 (→ 𝜏 (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜂))))))))

(MkIndexed 101 (MkTheorem com5r (λ com5.1 (com52l (com52l com5.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))) (→ 𝜏 (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜂))))))))

(MkIndexed 102 (MkTheorem imim12 (syl9r imim2 imim1) (→ (→ 𝜑 𝜓) (→ (→ 𝜒 𝜃) (→ (→ 𝜓 𝜒) (→ 𝜑 𝜃))))))

(MkIndexed 103 (MkTheorem jarr (imim1i ax-1) (→ (→ (→ 𝜑 𝜓) 𝜒) (→ 𝜓 𝜒))))

(MkIndexed 104 (MkTheorem jarri (λ jarri.1 (syl ax-1 jarri.1)) (-> (→ (→ 𝜑 𝜓) 𝜒) (→ 𝜓 𝜒))))

(MkIndexed 105 (MkTheorem pm2.86d (λ pm2.86d.1 (com23 (syl5 ax-1 pm2.86d.1))) (-> (→ 𝜑 (→ (→ 𝜓 𝜒) (→ 𝜓 𝜃))) (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))))))

(MkIndexed 106 (MkTheorem pm2.86 (pm2.86d id) (→ (→ (→ 𝜑 𝜓) (→ 𝜑 𝜒)) (→ 𝜑 (→ 𝜓 𝜒)))))

(MkIndexed 107 (MkTheorem pm2.86i (λ pm2.86i.1 (com12 (jarri pm2.86i.1))) (-> (→ (→ 𝜑 𝜓) (→ 𝜑 𝜒)) (→ 𝜑 (→ 𝜓 𝜒)))))

(MkIndexed 108 (MkTheorem loolin (pm2.43d jarr) (→ (→ (→ 𝜑 𝜓) (→ 𝜓 𝜑)) (→ 𝜓 𝜑))))

(MkIndexed 109 (MkTheorem loowoz (a2d jarr) (→ (→ (→ 𝜑 𝜓) (→ 𝜑 𝜒)) (→ (→ 𝜓 𝜑) (→ 𝜓 𝜒)))))

(MkIndexed 110 (MkTheorem con4 ax-3 (→ (→ (¬ 𝜑) (¬ 𝜓)) (→ 𝜓 𝜑))))

(MkIndexed 111 (MkTheorem con4i (λ con4i.1 (ax-mp con4i.1 con4)) (-> (→ (¬ 𝜑) (¬ 𝜓)) (→ 𝜓 𝜑))))
(MkIndexed 112 (MkTheorem con4d (λ con4d.1 (syl con4d.1 con4)) (-> (→ 𝜑 (→ (¬ 𝜓) (¬ 𝜒))) (→ 𝜑 (→ 𝜒 𝜓)))))

(MkIndexed 113 (MkTheorem mt4 (λ mt4.1 mt4.2 (ax-mp mt4.1 (con4i mt4.2))) (-> 𝜑 (→ (¬ 𝜓) (¬ 𝜑)) 𝜓)))

(MkIndexed 114 (MkTheorem mt4d (λ mt4d.1 mt4d.2 (mpd mt4d.1 (con4d mt4d.2))) (-> (→ 𝜑 𝜓) (→ 𝜑 (→ (¬ 𝜒) (¬ 𝜓))) (→ 𝜑 𝜒))))

(MkIndexed 115 (MkTheorem mt4i (λ mt4i.1 mt4i.2 (mt4d (a1i mt4i.1) mt4i.2)) (-> 𝜒 (→ 𝜑 (→ (¬ 𝜓) (¬ 𝜒))) (→ 𝜑 𝜓))))

(MkIndexed 116 (MkTheorem pm2.21i (λ pm2.21i.1 (con4i (a1i pm2.21i.1))) (-> (¬ 𝜑) (→ 𝜑 𝜓))))

(MkIndexed 117 (MkTheorem pm2.24ii (λ pm2.24ii.1 pm2.24ii.2 (ax-mp pm2.24ii.1 (pm2.21i pm2.24ii.2))) (-> 𝜑 (¬ 𝜑) 𝜓)))

(MkIndexed 118 (MkTheorem pm2.21d (λ pm2.21d.1 (con4d (a1d pm2.21d.1))) (-> (→ 𝜑 (¬ 𝜓)) (→ 𝜑 (→ 𝜓 𝜒)))))

(MkIndexed 119 (MkTheorem pm2.21ddALT (λ pm2.21ddALT.1 pm2.21ddALT.2 (mpd pm2.21ddALT.1 (pm2.21d pm2.21ddALT.2))) (-> (→ 𝜑 𝜓) (→ 𝜑 (¬ 𝜓)) (→ 𝜑 𝜒))))

(MkIndexed 120 (MkTheorem pm2.21 (pm2.21d id) (→ (¬ 𝜑) (→ 𝜑 𝜓))))

(MkIndexed 121 (MkTheorem pm2.24 (com12 pm2.21) (→ 𝜑 (→ (¬ 𝜑) 𝜓))))

(MkIndexed 122 (MkTheorem jarl (imim1i pm2.21) (→ (→ (→ 𝜑 𝜓) 𝜒) (→ (¬ 𝜑) 𝜒))))

(MkIndexed 123 (MkTheorem jarli (λ jarli.1 (syl pm2.21 jarli.1)) (-> (→ (→ 𝜑 𝜓) 𝜒) (→ (¬ 𝜑) 𝜒))))

(MkIndexed 124 (MkTheorem pm2.18d (λ pm2.18d.1 (mt4d id (sylcom pm2.18d.1 pm2.21))) (-> (→ 𝜑 (→ (¬ 𝜓) 𝜓)) (→ 𝜑 𝜓))))

(MkIndexed 125 (MkTheorem pm2.18 (pm2.18d id) (→ (→ (¬ 𝜑) 𝜑) 𝜑)))

(MkIndexed 126 (MkTheorem pm2.18i (λ pm2.18i.1 (ax-mp pm2.18i.1 pm2.18)) (-> (→ (¬ 𝜑) 𝜑) 𝜑)))

(MkIndexed 127 (MkTheorem notnotr (jarli pm2.18) (→ (¬ (¬ 𝜑)) 𝜑)))

(MkIndexed 128 (MkTheorem notnotri (λ notnotri.1 (mt4 notnotri.1 (pm2.21i notnotri.1))) (-> (¬ (¬ 𝜑)) 𝜑)))

(MkIndexed 129 (MkTheorem notnotriALT (λ notnotri.1 (pm2.18i (pm2.21i notnotri.1))) (-> (¬ (¬ 𝜑)) 𝜑)))

(MkIndexed 130 (MkTheorem notnotrd (λ notnotrd.1 (syl notnotrd.1 notnotr)) (-> (→ 𝜑 (¬ (¬ 𝜓))) (→ 𝜑 𝜓))))

(MkIndexed 131 (MkTheorem con2d (λ con2d.1 (con4d (syl5 notnotr con2d.1))) (-> (→ 𝜑 (→ 𝜓 (¬ 𝜒))) (→ 𝜑 (→ 𝜒 (¬ 𝜓))))))

(MkIndexed 132 (MkTheorem con2 (con2d id) (→ (→ 𝜑 (¬ 𝜓)) (→ 𝜓 (¬ 𝜑)))))

(MkIndexed 133 (MkTheorem mt2d (λ mt2d.1 mt2d.2 (mpd mt2d.1 (con2d mt2d.2))) (-> (→ 𝜑 𝜒) (→ 𝜑 (→ 𝜓 (¬ 𝜒))) (→ 𝜑 (¬ 𝜓)))))

(MkIndexed 134 (MkTheorem mt2i (λ mt2i.1 mt2i.2 (mt2d (a1i mt2i.1) mt2i.2)) (-> 𝜒 (→ 𝜑 (→ 𝜓 (¬ 𝜒))) (→ 𝜑 (¬ 𝜓)))))

(MkIndexed 135 (MkTheorem nsyl3 (λ nsyl3.1 nsyl3.2 (mt2d nsyl3.2 (a1i nsyl3.1))) (-> (→ 𝜑 (¬ 𝜓)) (→ 𝜒 𝜓) (→ 𝜒 (¬ 𝜑)))))

(MkIndexed 136 (MkTheorem con2i (λ con2i.a (nsyl3 con2i.a id)) (-> (→ 𝜑 (¬ 𝜓)) (→ 𝜓 (¬ 𝜑)))))

(MkIndexed 137 (MkTheorem nsyl (λ nsyl.1 nsyl.2 (con2i (nsyl3 nsyl.1 nsyl.2))) (-> (→ 𝜑 (¬ 𝜓)) (→ 𝜒 𝜓) (→ 𝜑 (¬ 𝜒)))))

(MkIndexed 138 (MkTheorem nsyl2 (λ nsyl2.1 nsyl2.2 (con4i (nsyl3 nsyl2.1 nsyl2.2))) (-> (→ 𝜑 (¬ 𝜓)) (→ (¬ 𝜒) 𝜓) (→ 𝜑 𝜒))))

(MkIndexed 139 (MkTheorem notnot (con2i id) (→ 𝜑 (¬ (¬ 𝜑)))))

(MkIndexed 140 (MkTheorem notnoti (λ notnoti.1 (ax-mp notnoti.1 notnot)) (-> 𝜑 (¬ (¬ 𝜑)))))

(MkIndexed 141 (MkTheorem notnotd (λ notnotd.1 (syl notnotd.1 notnot)) (-> (→ 𝜑 𝜓) (→ 𝜑 (¬ (¬ 𝜓))))))

(MkIndexed 142 (MkTheorem con1d (λ con1d.1 (con4d (syl6 con1d.1 notnot))) (-> (→ 𝜑 (→ (¬ 𝜓) 𝜒)) (→ 𝜑 (→ (¬ 𝜒) 𝜓)))))

(MkIndexed 143 (MkTheorem con1 (con1d id) (→ (→ (¬ 𝜑) 𝜓) (→ (¬ 𝜓) 𝜑))))

(MkIndexed 144 (MkTheorem con1i (λ con1i.1 (nsyl2 id con1i.1)) (-> (→ (¬ 𝜑) 𝜓) (→ (¬ 𝜓) 𝜑))))

(MkIndexed 145 (MkTheorem mt3d (λ mt3d.1 mt3d.2 (mpd mt3d.1 (con1d mt3d.2))) (-> (→ 𝜑 (¬ 𝜒)) (→ 𝜑 (→ (¬ 𝜓) 𝜒)) (→ 𝜑 𝜓))))

(MkIndexed 146 (MkTheorem mt3i (λ mt3i.1 mt3i.2 (mt3d (a1i mt3i.1) mt3i.2)) (-> (¬ 𝜒) (→ 𝜑 (→ (¬ 𝜓) 𝜒)) (→ 𝜑 𝜓))))

(MkIndexed 147 (MkTheorem pm2.24i (λ pm2.24i.1 (con1i (a1i pm2.24i.1))) (-> 𝜑 (→ (¬ 𝜑) 𝜓))))

(MkIndexed 148 (MkTheorem pm2.24d (λ pm2.24d.1 (con1d (a1d pm2.24d.1))) (-> (→ 𝜑 𝜓) (→ 𝜑 (→ (¬ 𝜓) 𝜒)))))

(MkIndexed 149 (MkTheorem con3d (λ con3d.1 (con1d (syl5 notnotr con3d.1))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ (¬ 𝜒) (¬ 𝜓))))))

(MkIndexed 150 (MkTheorem con3 (con3d id) (→ (→ 𝜑 𝜓) (→ (¬ 𝜓) (¬ 𝜑)))))

(MkIndexed 151 (MkTheorem con3i (λ con3i.a (nsyl id con3i.a)) (-> (→ 𝜑 𝜓) (→ (¬ 𝜓) (¬ 𝜑)))))

(MkIndexed 152 (MkTheorem con3rr3 (λ con3rr3.1 (com12 (con3d con3rr3.1))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ (¬ 𝜒) (→ 𝜑 (¬ 𝜓))))))

(MkIndexed 153 (MkTheorem nsyld (λ nsyld.1 nsyld.2 (syld nsyld.1 (con3d nsyld.2))) (-> (→ 𝜑 (→ 𝜓 (¬ 𝜒))) (→ 𝜑 (→ 𝜏 𝜒)) (→ 𝜑 (→ 𝜓 (¬ 𝜏))))))

(MkIndexed 154 (MkTheorem nsyli (λ nsyli.1 nsyli.2 (syl5 nsyli.2 (con3d nsyli.1))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜃 (¬ 𝜒)) (→ 𝜑 (→ 𝜃 (¬ 𝜓))))))

(MkIndexed 155 (MkTheorem nsyl4 (λ nsyl4.1 nsyl4.2 (syl (con1i nsyl4.2) nsyl4.1)) (-> (→ 𝜑 𝜓) (→ (¬ 𝜑) 𝜒) (→ (¬ 𝜒) 𝜓))))

(MkIndexed 156 (MkTheorem nsyl5 (λ nsyl4.1 nsyl4.2 (con1i (nsyl4 nsyl4.1 nsyl4.2))) (-> (→ 𝜑 𝜓) (→ (¬ 𝜑) 𝜒) (→ (¬ 𝜓) 𝜒))))

(MkIndexed 157 (MkTheorem pm3.2im (con2d pm2.27) (→ 𝜑 (→ 𝜓 (¬ (→ 𝜑 (¬ 𝜓)))))))

(MkIndexed 158 (MkTheorem jc (λ jc.1 jc.2 (sylc jc.1 jc.2 pm3.2im)) (-> (→ 𝜑 𝜓) (→ 𝜑 𝜒) (→ 𝜑 (¬ (→ 𝜓 (¬ 𝜒)))))))

(MkIndexed 159 (MkTheorem jcn (con3d pm2.27) (→ 𝜑 (→ (¬ 𝜓) (¬ (→ 𝜑 𝜓))))))

(MkIndexed 160 (MkTheorem jcnd (λ jcnd.1 jcnd.2 (sylc jcnd.1 jcnd.2 jcn)) (-> (→ 𝜑 𝜓) (→ 𝜑 (¬ 𝜒)) (→ 𝜑 (¬ (→ 𝜓 𝜒))))))

(MkIndexed 161 (MkTheorem impi (λ impi.1 (con1i (con3rr3 impi.1))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ (¬ (→ 𝜑 (¬ 𝜓))) 𝜒))))

(MkIndexed 162 (MkTheorem expi (λ expi.1 (syl6 pm3.2im expi.1)) (-> (→ (¬ (→ 𝜑 (¬ 𝜓))) 𝜒) (→ 𝜑 (→ 𝜓 𝜒)))))

(MkIndexed 163 (MkTheorem simprim (impi idd) (→ (¬ (→ 𝜑 (¬ 𝜓))) 𝜓)))

(MkIndexed 164 (MkTheorem simplim (con1i pm2.21) (→ (¬ (→ 𝜑 𝜓)) 𝜑)))

(MkIndexed 165 (MkTheorem pm2.5g (pm2.24d simplim) (→ (¬ (→ 𝜑 𝜓)) (→ (¬ 𝜑) 𝜒))))

(MkIndexed 166 (MkTheorem pm2.5 pm2.5g (→ (¬ (→ 𝜑 𝜓)) (→ (¬ 𝜑) 𝜓))))

(MkIndexed 167 (MkTheorem conax1 (con3i ax-1) (→ (¬ (→ 𝜑 𝜓)) (¬ 𝜓))))

(MkIndexed 168 (MkTheorem conax1k (a1d conax1) (→ (¬ (→ 𝜑 𝜓)) (→ 𝜒 (¬ 𝜓)))))

(MkIndexed 169 (MkTheorem pm2.51 conax1k (→ (¬ (→ 𝜑 𝜓)) (→ 𝜑 (¬ 𝜓)))))

(MkIndexed 170 (MkTheorem pm2.52 conax1k (→ (¬ (→ 𝜑 𝜓)) (→ (¬ 𝜑) (¬ 𝜓)))))

(MkIndexed 171 (MkTheorem pm2.521g (pm2.21d conax1) (→ (¬ (→ 𝜑 𝜓)) (→ 𝜓 𝜒))))

(MkIndexed 172 (MkTheorem pm2.521g2 (a1d simplim) (→ (¬ (→ 𝜑 𝜓)) (→ 𝜒 𝜑))))

(MkIndexed 173 (MkTheorem pm2.521 pm2.521g (→ (¬ (→ 𝜑 𝜓)) (→ 𝜓 𝜑))))

(MkIndexed 174 (MkTheorem expt (com12 (imim1d pm3.2im)) (→ (→ (¬ (→ 𝜑 (¬ 𝜓))) 𝜒) (→ 𝜑 (→ 𝜓 𝜒)))))

(MkIndexed 175 (MkTheorem impt (mpdi simprim (imim1i simplim)) (→ (→ 𝜑 (→ 𝜓 𝜒)) (→ (¬ (→ 𝜑 (¬ 𝜓))) 𝜒))))

(MkIndexed 176 (MkTheorem pm2.61d (λ pm2.61d.1 pm2.61d.2 (pm2.18d (syld (con1d pm2.61d.2) pm2.61d.1))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ (¬ 𝜓) 𝜒)) (→ 𝜑 𝜒))))

(MkIndexed 177 (MkTheorem pm2.61d1 (λ pm2.61d1.1 pm2.61d1.2 (pm2.61d pm2.61d1.1 (a1i pm2.61d1.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ (¬ 𝜓) 𝜒) (→ 𝜑 𝜒))))

(MkIndexed 178 (MkTheorem pm2.61d2 (λ pm2.61d2.1 pm2.61d2.2 (pm2.61d (a1i pm2.61d2.2) pm2.61d2.1)) (-> (→ 𝜑 (→ (¬ 𝜓) 𝜒)) (→ 𝜓 𝜒) (→ 𝜑 𝜒))))

(MkIndexed 179 (MkTheorem pm2.61i (λ pm2.61i.1 pm2.61i.2 (pm2.18i (nsyl4 pm2.61i.1 pm2.61i.2))) (-> (→ 𝜑 𝜓) (→ (¬ 𝜑) 𝜓) 𝜓)))

(MkIndexed 180 (MkTheorem pm2.61ii (λ pm2.61ii.1 pm2.61ii.2 pm2.61ii.3 (pm2.61i pm2.61ii.2 (pm2.61d2 pm2.61ii.1 pm2.61ii.3))) (-> (→ (¬ 𝜑) (→ (¬ 𝜓) 𝜒)) (→ 𝜑 𝜒) (→ 𝜓 𝜒) 𝜒)))

(MkIndexed 181 (MkTheorem pm2.61nii (λ pm2.61nii.1 pm2.61nii.2 pm2.61nii.3 (pm2.61i (pm2.61d1 pm2.61nii.1 pm2.61nii.3) pm2.61nii.2)) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ (¬ 𝜑) 𝜒) (→ (¬ 𝜓) 𝜒) 𝜒)))

(MkIndexed 182 (MkTheorem pm2.61iii (λ pm2.61iii.1 pm2.61iii.2 pm2.61iii.3 pm2.61iii.4 (pm2.61i pm2.61iii.4 (pm2.61ii pm2.61iii.1 (a1d pm2.61iii.2) (a1d pm2.61iii.3)))) (-> (→ (¬ 𝜑) (→ (¬ 𝜓) (→ (¬ 𝜒) 𝜃))) (→ 𝜑 𝜃) (→ 𝜓 𝜃) (→ 𝜒 𝜃) 𝜃)))

(MkIndexed 183 (MkTheorem ja (λ ja.1 ja.2 (pm2.61d1 (imim2i ja.2) ja.1)) (-> (→ (¬ 𝜑) 𝜒) (→ 𝜓 𝜒) (→ (→ 𝜑 𝜓) 𝜒))))

(MkIndexed 184 (MkTheorem jad (λ jad.1 jad.2 (com12 (ja (com12 jad.1) (com12 jad.2)))) (-> (→ 𝜑 (→ (¬ 𝜓) 𝜃)) (→ 𝜑 (→ 𝜒 𝜃)) (→ 𝜑 (→ (→ 𝜓 𝜒) 𝜃)))))

(MkIndexed 185 (MkTheorem pm2.01 (ja id id) (→ (→ 𝜑 (¬ 𝜑)) (¬ 𝜑))))

(MkIndexed 186 (MkTheorem pm2.01i (λ pm2.01i.1 (ax-mp pm2.01i.1 pm2.01)) (-> (→ 𝜑 (¬ 𝜑)) (¬ 𝜑))))

(MkIndexed 187 (MkTheorem pm2.01d (λ pm2.01d.1 (pm2.61d1 pm2.01d.1 id)) (-> (→ 𝜑 (→ 𝜓 (¬ 𝜓))) (→ 𝜑 (¬ 𝜓)))))

(MkIndexed 188 (MkTheorem pm2.6 (jad id idd) (→ (→ (¬ 𝜑) 𝜓) (→ (→ 𝜑 𝜓) 𝜓))))

(MkIndexed 189 (MkTheorem pm2.61 (com12 pm2.6) (→ (→ 𝜑 𝜓) (→ (→ (¬ 𝜑) 𝜓) 𝜓))))

(MkIndexed 190 (MkTheorem pm2.65 (jad idd con3) (→ (→ 𝜑 𝜓) (→ (→ 𝜑 (¬ 𝜓)) (¬ 𝜑)))))

(MkIndexed 191 (MkTheorem pm2.65i (λ pm2.65i.1 pm2.65i.2 (pm2.61i (con2i pm2.65i.2) (con3i pm2.65i.1))) (-> (→ 𝜑 𝜓) (→ 𝜑 (¬ 𝜓)) (¬ 𝜑))))

(MkIndexed 192 (MkTheorem pm2.21dd (λ pm2.21dd.1 pm2.21dd.2 (pm2.21i (pm2.65i pm2.21dd.1 pm2.21dd.2))) (-> (→ 𝜑 𝜓) (→ 𝜑 (¬ 𝜓)) (→ 𝜑 𝜒))))

(MkIndexed 193 (MkTheorem pm2.65d (λ pm2.65d.1 pm2.65d.2 (pm2.01d (nsyld pm2.65d.2 pm2.65d.1))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ 𝜓 (¬ 𝜒))) (→ 𝜑 (¬ 𝜓)))))

(MkIndexed 194 (MkTheorem mto (λ mto.1 mto.2 (pm2.65i mto.2 (a1i mto.1))) (-> (¬ 𝜓) (→ 𝜑 𝜓) (¬ 𝜑))))

(MkIndexed 195 (MkTheorem mtod (λ mtod.1 mtod.2 (pm2.65d mtod.2 (a1d mtod.1))) (-> (→ 𝜑 (¬ 𝜒)) (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (¬ 𝜓)))))

(MkIndexed 196 (MkTheorem mtoi (λ mtoi.1 mtoi.2 (mtod (a1i mtoi.1) mtoi.2)) (-> (¬ 𝜒) (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (¬ 𝜓)))))

(MkIndexed 197 (MkTheorem mt2 (λ mt2.1 mt2.2 (pm2.65i (a1i mt2.1) mt2.2)) (-> 𝜓 (→ 𝜑 (¬ 𝜓)) (¬ 𝜑))))

(MkIndexed 198 (MkTheorem mt3 (λ mt3.1 mt3.2 (notnotri (mto mt3.1 mt3.2))) (-> (¬ 𝜓) (→ (¬ 𝜑) 𝜓) 𝜑)))

(MkIndexed 199 (MkTheorem peirce (ja simplim id) (→ (→ (→ 𝜑 𝜓) 𝜑) 𝜑)))

(MkIndexed 200 (MkTheorem looinv (syl6 imim1 peirce) (→ (→ (→ 𝜑 𝜓) 𝜓) (→ (→ 𝜓 𝜑) 𝜑))))


(MkIndexed 202 (MkTheorem bijust bijust0 (¬ (→ (→ (¬ (→ (→ 𝜑 𝜓) (¬ (→ 𝜓 𝜑)))) (¬ (→ (→ 𝜑 𝜓) (¬ (→ 𝜓 𝜑))))) (¬ (→ (¬ (→ (→ 𝜑 𝜓) (¬ (→ 𝜓 𝜑)))) (¬ (→ (→ 𝜑 𝜓) (¬ (→ 𝜓 𝜑))))))))))

(MkIndexed 203 (MkAxiom df-bi (¬ (→ (→ (↔ 𝜑 𝜓) (¬ (→ (→ 𝜑 𝜓) (¬ (→ 𝜓 𝜑))))) (¬ (→ (¬ (→ (→ 𝜑 𝜓) (¬ (→ 𝜓 𝜑)))) (↔ 𝜑 𝜓)))))))

(MkIndexed 204 (MkTheorem impbi (expi (ax-mp df-bi simprim)) (→ (→ 𝜑 𝜓) (→ (→ 𝜓 𝜑) (↔ 𝜑 𝜓)))))

(MkIndexed 205 (MkTheorem impbii (λ impbii.1 impbii.2 (mp2 impbii.1 impbii.2 impbi)) (-> (→ 𝜑 𝜓) (→ 𝜓 𝜑) (↔ 𝜑 𝜓))))

(MkIndexed 206 (MkTheorem impbidd (λ impbidd.1 impbidd.2 (syl6c impbidd.1 impbidd.2 impbi)) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜑 (→ 𝜓 (→ 𝜃 𝜒))) (→ 𝜑 (→ 𝜓 (↔ 𝜒 𝜃))))))

(MkIndexed 207 (MkTheorem impbid21d (λ impbid21d.1 impbid21d.2 (syl2imc impbid21d.1 impbid21d.2 impbi)) (-> (→ 𝜓 (→ 𝜒 𝜃)) (→ 𝜑 (→ 𝜃 𝜒)) (→ 𝜑 (→ 𝜓 (↔ 𝜒 𝜃))))))

(MkIndexed 208 (MkTheorem impbid (λ impbid.1 impbid.2 (pm2.43i (impbid21d impbid.1 impbid.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ 𝜒 𝜓)) (→ 𝜑 (↔ 𝜓 𝜒)))))

(MkIndexed 209 (MkTheorem dfbi1 (mt3 df-bi (con3rr3 impbi)) (↔ (↔ 𝜑 𝜓) (¬ (→ (→ 𝜑 𝜓) (¬ (→ 𝜓 𝜑)))))))

(MkIndexed 210 (MkTheorem dfbi1ALT (ax-mp df-bi (ax-mp ax-1 (ax-mp (ax-mp ax-1 (ax-mp (ax-mp (ax-mp (ax-mp df-bi ax-1) ax-3) ax-1) ax-2)) ax-3))) (↔ (↔ 𝜑 𝜓) (¬ (→ (→ 𝜑 𝜓) (¬ (→ 𝜓 𝜑)))))))

(MkIndexed 211 (MkTheorem biimp (syl (ax-mp df-bi simplim) simplim) (→ (↔ 𝜑 𝜓) (→ 𝜑 𝜓))))

(MkIndexed 212 (MkTheorem biimpi (λ biimpi.1 (ax-mp biimpi.1 biimp)) (-> (↔ 𝜑 𝜓) (→ 𝜑 𝜓))))

(MkIndexed 213 (MkTheorem sylbi (λ sylbi.1 sylbi.2 (syl (biimpi sylbi.1) sylbi.2)) (-> (↔ 𝜑 𝜓) (→ 𝜓 𝜒) (→ 𝜑 𝜒))))

(MkIndexed 214 (MkTheorem sylib (λ sylib.1 sylib.2 (syl sylib.1 (biimpi sylib.2))) (-> (→ 𝜑 𝜓) (↔ 𝜓 𝜒) (→ 𝜑 𝜒))))

(MkIndexed 215 (MkTheorem sylbb (λ sylbb.1 sylbb.2 (sylbi sylbb.1 (biimpi sylbb.2))) (-> (↔ 𝜑 𝜓) (↔ 𝜓 𝜒) (→ 𝜑 𝜒))))

(MkIndexed 216 (MkTheorem biimpr (sylbi dfbi1 simprim) (→ (↔ 𝜑 𝜓) (→ 𝜓 𝜑))))

(MkIndexed 217 (MkTheorem bicom1 (impbid biimpr biimp) (→ (↔ 𝜑 𝜓) (↔ 𝜓 𝜑))))

(MkIndexed 218 (MkTheorem bicom (impbii bicom1 bicom1) (↔ (↔ 𝜑 𝜓) (↔ 𝜓 𝜑))))

(MkIndexed 219 (MkTheorem bicomd (λ bicomd.1 (sylib bicomd.1 bicom)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜒 𝜓)))))

(MkIndexed 220 (MkTheorem bicomi (λ bicomi.1 (ax-mp bicomi.1 bicom1)) (-> (↔ 𝜑 𝜓) (↔ 𝜓 𝜑))))

(MkIndexed 221 (MkTheorem impbid1 (λ impbid1.1 impbid1.2 (impbid impbid1.1 (a1i impbid1.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜒 𝜓) (→ 𝜑 (↔ 𝜓 𝜒)))))

(MkIndexed 222 (MkTheorem impbid2 (λ impbid2.1 impbid2.2 (bicomd (impbid1 impbid2.2 impbid2.1))) (-> (→ 𝜓 𝜒) (→ 𝜑 (→ 𝜒 𝜓)) (→ 𝜑 (↔ 𝜓 𝜒)))))

(MkIndexed 223 (MkTheorem impcon4bid (λ impcon4bid.1 impcon4bid.2 (impbid impcon4bid.1 (con4d impcon4bid.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ (¬ 𝜓) (¬ 𝜒))) (→ 𝜑 (↔ 𝜓 𝜒)))))

(MkIndexed 224 (MkTheorem biimpri (λ biimpri.1 (biimpi (bicomi biimpri.1))) (-> (↔ 𝜑 𝜓) (→ 𝜓 𝜑))))

(MkIndexed 225 (MkTheorem biimpd (λ biimpd.1 (syl biimpd.1 biimp)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (→ 𝜓 𝜒)))))

(MkIndexed 226 (MkTheorem mpbi (λ mpbi.min mpbi.maj (ax-mp mpbi.min (biimpi mpbi.maj))) (-> 𝜑 (↔ 𝜑 𝜓) 𝜓)))

(MkIndexed 227 (MkTheorem mpbir (λ mpbir.min mpbir.maj (ax-mp mpbir.min (biimpri mpbir.maj))) (-> 𝜓 (↔ 𝜑 𝜓) 𝜑)))

(MkIndexed 228 (MkTheorem mpbid (λ mpbid.min mpbid.maj (mpd mpbid.min (biimpd mpbid.maj))) (-> (→ 𝜑 𝜓) (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 𝜒))))

(MkIndexed 229 (MkTheorem mpbii (λ mpbii.min mpbii.maj (mpbid (a1i mpbii.min) mpbii.maj)) (-> 𝜓 (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 𝜒))))

(MkIndexed 230 (MkTheorem sylibr (λ sylibr.1 sylibr.2 (syl sylibr.1 (biimpri sylibr.2))) (-> (→ 𝜑 𝜓) (↔ 𝜒 𝜓) (→ 𝜑 𝜒))))

(MkIndexed 231 (MkTheorem sylbir (λ sylbir.1 sylbir.2 (syl (biimpri sylbir.1) sylbir.2)) (-> (↔ 𝜓 𝜑) (→ 𝜓 𝜒) (→ 𝜑 𝜒))))

(MkIndexed 232 (MkTheorem sylbbr (λ sylbbr.1 sylbbr.2 (sylibr (biimpri sylbbr.2) sylbbr.1)) (-> (↔ 𝜑 𝜓) (↔ 𝜓 𝜒) (→ 𝜒 𝜑))))

(MkIndexed 233 (MkTheorem sylbb1 (λ sylbb1.1 sylbb1.2 (sylib (biimpri sylbb1.1) sylbb1.2)) (-> (↔ 𝜑 𝜓) (↔ 𝜑 𝜒) (→ 𝜓 𝜒))))

(MkIndexed 234 (MkTheorem sylbb2 (λ sylbb2.1 sylbb2.2 (sylbi sylbb2.1 (biimpri sylbb2.2))) (-> (↔ 𝜑 𝜓) (↔ 𝜒 𝜓) (→ 𝜑 𝜒))))

(MkIndexed 235 (MkTheorem sylibd (λ sylibd.1 sylibd.2 (syld sylibd.1 (biimpd sylibd.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜒 𝜃)) (→ 𝜑 (→ 𝜓 𝜃)))))

(MkIndexed 236 (MkTheorem sylbid (λ sylbid.1 sylbid.2 (syld (biimpd sylbid.1) sylbid.2)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (→ 𝜒 𝜃)) (→ 𝜑 (→ 𝜓 𝜃)))))

(MkIndexed 237 (MkTheorem mpbidi (λ mpbidi.min mpbidi.maj (sylcom mpbidi.min (biimpd mpbidi.maj))) (-> (→ 𝜃 (→ 𝜑 𝜓)) (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜃 (→ 𝜑 𝜒)))))

(MkIndexed 238 (MkTheorem biimtrid (λ biimtrid.1 biimtrid.2 (syl5 (biimpi biimtrid.1) biimtrid.2)) (-> (↔ 𝜑 𝜓) (→ 𝜒 (→ 𝜓 𝜃)) (→ 𝜒 (→ 𝜑 𝜃)))))

(MkIndexed 239 (MkTheorem biimtrrid (λ biimtrrid.1 biimtrrid.2 (syl5 (biimpri biimtrrid.1) biimtrrid.2)) (-> (↔ 𝜓 𝜑) (→ 𝜒 (→ 𝜓 𝜃)) (→ 𝜒 (→ 𝜑 𝜃)))))

(MkIndexed 240 (MkTheorem imbitrid (λ imbitrid.1 imbitrid.2 (syl5 imbitrid.1 (biimpd imbitrid.2))) (-> (→ 𝜑 𝜓) (→ 𝜒 (↔ 𝜓 𝜃)) (→ 𝜒 (→ 𝜑 𝜃)))))

(MkIndexed 241 (MkTheorem syl5ibcom (λ imbitrid.1 imbitrid.2 (com12 (imbitrid imbitrid.1 imbitrid.2))) (-> (→ 𝜑 𝜓) (→ 𝜒 (↔ 𝜓 𝜃)) (→ 𝜑 (→ 𝜒 𝜃)))))

(MkIndexed 242 (MkTheorem imbitrrid (λ imbitrrid.1 imbitrrid.2 (imbitrid imbitrrid.1 (bicomd imbitrrid.2))) (-> (→ 𝜑 𝜃) (→ 𝜒 (↔ 𝜓 𝜃)) (→ 𝜒 (→ 𝜑 𝜓)))))

(MkIndexed 243 (MkTheorem syl5ibrcom (λ imbitrrid.1 imbitrrid.2 (com12 (imbitrrid imbitrrid.1 imbitrrid.2))) (-> (→ 𝜑 𝜃) (→ 𝜒 (↔ 𝜓 𝜃)) (→ 𝜑 (→ 𝜒 𝜓)))))

(MkIndexed 244 (MkTheorem biimprd (λ biimprd.1 (imbitrrid id biimprd.1)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (→ 𝜒 𝜓)))))

(MkIndexed 245 (MkTheorem biimpcd (λ biimpcd.1 (syl5ibcom id biimpcd.1)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜓 (→ 𝜑 𝜒)))))


(MkIndexed 246 (MkTheorem biimprcd (λ biimpcd.1 (syl5ibrcom id biimpcd.1)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜒 (→ 𝜑 𝜓)))))

(MkIndexed 247 (MkTheorem imbitrdi (λ imbitrdi.1 imbitrdi.2 (syl6 imbitrdi.1 (biimpi imbitrdi.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (↔ 𝜒 𝜃) (→ 𝜑 (→ 𝜓 𝜃)))))

(MkIndexed 248 (MkTheorem imbitrrdi (λ imbitrrdi.1 imbitrrdi.2 (syl6 imbitrrdi.1 (biimpri imbitrrdi.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (↔ 𝜃 𝜒) (→ 𝜑 (→ 𝜓 𝜃)))))

(MkIndexed 249 (MkTheorem biimtrdi (λ biimtrdi.1 biimtrdi.2 (syl6 (biimpd biimtrdi.1) biimtrdi.2)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜒 𝜃) (→ 𝜑 (→ 𝜓 𝜃)))))

(MkIndexed 250 (MkTheorem biimtrrdi (λ biimtrrdi.1 biimtrrdi.2 (syl6 (biimprd biimtrrdi.1) biimtrrdi.2)) (-> (→ 𝜑 (↔ 𝜒 𝜓)) (→ 𝜒 𝜃) (→ 𝜑 (→ 𝜓 𝜃)))))

(MkIndexed 251 (MkTheorem syl7bi (λ syl7bi.1 syl7bi.2 (syl7 (biimpi syl7bi.1) syl7bi.2)) (-> (↔ 𝜑 𝜓) (→ 𝜒 (→ 𝜃 (→ 𝜓 𝜏))) (→ 𝜒 (→ 𝜃 (→ 𝜑 𝜏))))))

(MkIndexed 252 (MkTheorem syl8ib (λ syl8ib.1 syl8ib.2 (syl8 syl8ib.1 (biimpi syl8ib.2))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (↔ 𝜃 𝜏) (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜏))))))

(MkIndexed 253 (MkTheorem mpbird (λ mpbird.min mpbird.maj (mpd mpbird.min (biimprd mpbird.maj))) (-> (→ 𝜑 𝜒) (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 𝜓))))

(MkIndexed 254 (MkTheorem mpbiri (λ mpbiri.min mpbiri.maj (mpbird (a1i mpbiri.min) mpbiri.maj)) (-> 𝜒 (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 𝜓))))

(MkIndexed 255 (MkTheorem sylibrd (λ sylibrd.1 sylibrd.2 (syld sylibrd.1 (biimprd sylibrd.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜃 𝜒)) (→ 𝜑 (→ 𝜓 𝜃)))))

(MkIndexed 256 (MkTheorem sylbird (λ sylbird.1 sylbird.2 (syld (biimprd sylbird.1) sylbird.2)) (-> (→ 𝜑 (↔ 𝜒 𝜓)) (→ 𝜑 (→ 𝜒 𝜃)) (→ 𝜑 (→ 𝜓 𝜃)))))

(MkIndexed 257 (MkTheorem biid (impbii id id) (↔ 𝜑 𝜑)))

(MkIndexed 258 (MkTheorem biidd (a1i biid) (→ 𝜑 (↔ 𝜓 𝜓))))

(MkIndexed 259 (MkTheorem pm5.1im (impbid21d ax-1 ax-1) (→ 𝜑 (→ 𝜓 (↔ 𝜑 𝜓)))))

(MkIndexed 260 (MkTheorem 2th (λ 2th.1 2th.2 (impbii (a1i 2th.2) (a1i 2th.1))) (-> 𝜑 𝜓 (↔ 𝜑 𝜓))))

(MkIndexed 261 (MkTheorem 2thd (λ 2thd.1 2thd.2 (sylc 2thd.1 2thd.2 pm5.1im)) (-> (→ 𝜑 𝜓) (→ 𝜑 𝜒) (→ 𝜑 (↔ 𝜓 𝜒)))))

(MkIndexed 262 (MkTheorem monothetic (2th id id) (↔ (→ 𝜑 𝜑) (→ 𝜓 𝜓))))

(MkIndexed 263 (MkTheorem ibi (λ ibi.1 (mpbid id ibi.1)) (-> (→ 𝜑 (↔ 𝜑 𝜓)) (→ 𝜑 𝜓))))

(MkIndexed 264 (MkTheorem ibir (λ ibir.1 (ibi (bicomd ibir.1))) (-> (→ 𝜑 (↔ 𝜓 𝜑)) (→ 𝜑 𝜓))))

(MkIndexed 265 (MkTheorem ibd (λ ibd.1 (syli ibd.1 biimp)) (-> (→ 𝜑 (→ 𝜓 (↔ 𝜓 𝜒))) (→ 𝜑 (→ 𝜓 𝜒)))))

(MkIndexed 266 (MkTheorem pm5.74 (impbii (impbid (imim3i biimp) (imim3i biimpr)) (impbidd (pm2.86d biimp) (pm2.86d biimpr))) (↔ (→ 𝜑 (↔ 𝜓 𝜒)) (↔ (→ 𝜑 𝜓) (→ 𝜑 𝜒)))))

(MkIndexed 267 (MkTheorem pm5.74i (λ pm5.74i.1 (mpbi pm5.74i.1 pm5.74)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (↔ (→ 𝜑 𝜓) (→ 𝜑 𝜒)))))

(MkIndexed 268 (MkTheorem pm5.74ri (λ pm5.74ri.1 (mpbir pm5.74ri.1 pm5.74)) (-> (↔ (→ 𝜑 𝜓) (→ 𝜑 𝜒)) (→ 𝜑 (↔ 𝜓 𝜒)))))

(MkIndexed 269 (MkTheorem pm5.74d (λ pm5.74d.1 (sylib pm5.74d.1 pm5.74)) (-> (→ 𝜑 (→ 𝜓 (↔ 𝜒 𝜃))) (→ 𝜑 (↔ (→ 𝜓 𝜒) (→ 𝜓 𝜃))))))

(MkIndexed 270 (MkTheorem pm5.74rd (λ pm5.74rd.1 (sylibr pm5.74rd.1 pm5.74)) (-> (→ 𝜑 (↔ (→ 𝜓 𝜒) (→ 𝜓 𝜃))) (→ 𝜑 (→ 𝜓 (↔ 𝜒 𝜃))))))

(MkIndexed 271 (MkTheorem bitri (λ bitri.1 bitri.2 (impbii (sylbb bitri.1 bitri.2) (sylbbr bitri.1 bitri.2))) (-> (↔ 𝜑 𝜓) (↔ 𝜓 𝜒) (↔ 𝜑 𝜒))))

(MkIndexed 272 (MkTheorem bitr2i (λ bitr2i.1 bitr2i.2 (bicomi (bitri bitr2i.1 bitr2i.2))) (-> (↔ 𝜑 𝜓) (↔ 𝜓 𝜒) (↔ 𝜒 𝜑))))

(MkIndexed 273 (MkTheorem bitr3i (λ bitr3i.1 bitr3i.2 (bitri (bicomi bitr3i.1) bitr3i.2)) (-> (↔ 𝜓 𝜑) (↔ 𝜓 𝜒) (↔ 𝜑 𝜒))))

(MkIndexed 274 (MkTheorem bitr4i (λ bitr4i.1 bitr4i.2 (bitri bitr4i.1 (bicomi bitr4i.2))) (-> (↔ 𝜑 𝜓) (↔ 𝜒 𝜓) (↔ 𝜑 𝜒))))

(MkIndexed 275 (MkTheorem bitrd (λ bitrd.1 bitrd.2 (pm5.74ri (bitri (pm5.74i bitrd.1) (pm5.74i bitrd.2)))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜒 𝜃)) (→ 𝜑 (↔ 𝜓 𝜃)))))

(MkIndexed 276 (MkTheorem bitr2d (λ bitr2d.1 bitr2d.2 (bicomd (bitrd bitr2d.1 bitr2d.2))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜒 𝜃)) (→ 𝜑 (↔ 𝜃 𝜓)))))

(MkIndexed 277 (MkTheorem bitr3d (λ bitr3d.1 bitr3d.2 (bitrd (bicomd bitr3d.1) bitr3d.2)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜓 𝜃)) (→ 𝜑 (↔ 𝜒 𝜃)))))

(MkIndexed 278 (MkTheorem bitr4d (λ bitr4d.1 bitr4d.2 (bitrd bitr4d.1 (bicomd bitr4d.2))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜃 𝜒)) (→ 𝜑 (↔ 𝜓 𝜃)))))

(MkIndexed 279 (MkTheorem bitrid (λ bitrid.1 bitrid.2 (bitrd (a1i bitrid.1) bitrid.2)) (-> (↔ 𝜑 𝜓) (→ 𝜒 (↔ 𝜓 𝜃)) (→ 𝜒 (↔ 𝜑 𝜃)))))

(MkIndexed 280 (MkTheorem bitr2id (λ bitr2id.1 bitr2id.2 (bicomd (bitrid bitr2id.1 bitr2id.2))) (-> (↔ 𝜑 𝜓) (→ 𝜒 (↔ 𝜓 𝜃)) (→ 𝜒 (↔ 𝜃 𝜑)))))

(MkIndexed 281 (MkTheorem bitr3id (λ bitr3id.1 bitr3id.2 (bitrid (bicomi bitr3id.1) bitr3id.2)) (-> (↔ 𝜓 𝜑) (→ 𝜒 (↔ 𝜓 𝜃)) (→ 𝜒 (↔ 𝜑 𝜃)))))

(MkIndexed 282 (MkTheorem bitr3di (λ bitr3di.1 bitr3di.2 (bitr2id (bicomi bitr3di.2) bitr3di.1)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (↔ 𝜓 𝜃) (→ 𝜑 (↔ 𝜒 𝜃)))))

(MkIndexed 283 (MkTheorem bitrdi (λ bitrdi.1 bitrdi.2 (bitrd bitrdi.1 (a1i bitrdi.2))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (↔ 𝜒 𝜃) (→ 𝜑 (↔ 𝜓 𝜃)))))

(MkIndexed 284 (MkTheorem bitr2di (λ bitr2di.1 bitr2di.2 (bicomd (bitrdi bitr2di.1 bitr2di.2))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (↔ 𝜒 𝜃) (→ 𝜑 (↔ 𝜃 𝜓)))))

(MkIndexed 285 (MkTheorem bitr4di (λ bitr4di.1 bitr4di.2 (bitrdi bitr4di.1 (bicomi bitr4di.2))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (↔ 𝜃 𝜒) (→ 𝜑 (↔ 𝜓 𝜃)))))

(MkIndexed 286 (MkTheorem bitr4id (λ bitr4id.2 bitr4id.1 (bitr2di bitr4id.1 (bicomi bitr4id.2))) (-> (↔ 𝜓 𝜒) (→ 𝜑 (↔ 𝜃 𝜒)) (→ 𝜑 (↔ 𝜓 𝜃)))))

(MkIndexed 287 (MkTheorem 3imtr3i (λ 3imtr3.1 3imtr3.2 3imtr3.3 (sylib (sylbir 3imtr3.2 3imtr3.1) 3imtr3.3)) (-> (→ 𝜑 𝜓) (↔ 𝜑 𝜒) (↔ 𝜓 𝜃) (→ 𝜒 𝜃))))

(MkIndexed 288 (MkTheorem 3imtr4i (λ 3imtr4.1 3imtr4.2 3imtr4.3 (sylibr (sylbi 3imtr4.2 3imtr4.1) 3imtr4.3)) (-> (→ 𝜑 𝜓) (↔ 𝜒 𝜑) (↔ 𝜃 𝜓) (→ 𝜒 𝜃))))

(MkIndexed 289 (MkTheorem 3imtr3d (λ 3imtr3d.1 3imtr3d.2 3imtr3d.3 (sylbird 3imtr3d.2 (sylibd 3imtr3d.1 3imtr3d.3))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜓 𝜃)) (→ 𝜑 (↔ 𝜒 𝜏)) (→ 𝜑 (→ 𝜃 𝜏)))))

(MkIndexed 290 (MkTheorem 3imtr4d (λ 3imtr4d.1 3imtr4d.2 3imtr4d.3 (sylbid 3imtr4d.2 (sylibrd 3imtr4d.1 3imtr4d.3))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜃 𝜓)) (→ 𝜑 (↔ 𝜏 𝜒)) (→ 𝜑 (→ 𝜃 𝜏)))))

(MkIndexed 291 (MkTheorem 3imtr3g (λ 3imtr3g.1 3imtr3g.2 3imtr3g.3 (imbitrdi (biimtrrid 3imtr3g.2 3imtr3g.1) 3imtr3g.3)) (-> (→ 𝜑 (→ 𝜓 𝜒)) (↔ 𝜓 𝜃) (↔ 𝜒 𝜏) (→ 𝜑 (→ 𝜃 𝜏)))))

(MkIndexed 292 (MkTheorem 3imtr4g (λ 3imtr4g.1 3imtr4g.2 3imtr4g.3 (imbitrrdi (biimtrid 3imtr4g.2 3imtr4g.1) 3imtr4g.3)) (-> (→ 𝜑 (→ 𝜓 𝜒)) (↔ 𝜃 𝜓) (↔ 𝜏 𝜒) (→ 𝜑 (→ 𝜃 𝜏)))))

(MkIndexed 293 (MkTheorem 3bitri (λ 3bitri.1 3bitri.2 3bitri.3 (bitri 3bitri.1 (bitri 3bitri.2 3bitri.3))) (-> (↔ 𝜑 𝜓) (↔ 𝜓 𝜒) (↔ 𝜒 𝜃) (↔ 𝜑 𝜃))))

(MkIndexed 294 (MkTheorem 3bitrri (λ 3bitri.1 3bitri.2 3bitri.3 (bitr3i 3bitri.3 (bitr2i 3bitri.1 3bitri.2))) (-> (↔ 𝜑 𝜓) (↔ 𝜓 𝜒) (↔ 𝜒 𝜃) (↔ 𝜃 𝜑))))

(MkIndexed 295 (MkTheorem 3bitr2i (λ 3bitr2i.1 3bitr2i.2 3bitr2i.3 (bitri (bitr4i 3bitr2i.1 3bitr2i.2) 3bitr2i.3)) (-> (↔ 𝜑 𝜓) (↔ 𝜒 𝜓) (↔ 𝜒 𝜃) (↔ 𝜑 𝜃))))

(MkIndexed 296 (MkTheorem 3bitr2ri (λ 3bitr2i.1 3bitr2i.2 3bitr2i.3 (bitr2i (bitr4i 3bitr2i.1 3bitr2i.2) 3bitr2i.3)) (-> (↔ 𝜑 𝜓) (↔ 𝜒 𝜓) (↔ 𝜒 𝜃) (↔ 𝜃 𝜑))))

(MkIndexed 297 (MkTheorem 3bitr3i (λ 3bitr3i.1 3bitr3i.2 3bitr3i.3 (bitri (bitr3i 3bitr3i.2 3bitr3i.1) 3bitr3i.3)) (-> (↔ 𝜑 𝜓) (↔ 𝜑 𝜒) (↔ 𝜓 𝜃) (↔ 𝜒 𝜃))))

(MkIndexed 298 (MkTheorem 3bitr3ri (λ 3bitr3i.1 3bitr3i.2 3bitr3i.3 (bitr3i 3bitr3i.3 (bitr3i 3bitr3i.1 3bitr3i.2))) (-> (↔ 𝜑 𝜓) (↔ 𝜑 𝜒) (↔ 𝜓 𝜃) (↔ 𝜃 𝜒))))

(MkIndexed 299 (MkTheorem 3bitr4i (λ 3bitr4i.1 3bitr4i.2 3bitr4i.3 (bitri 3bitr4i.2 (bitr4i 3bitr4i.1 3bitr4i.3))) (-> (↔ 𝜑 𝜓) (↔ 𝜒 𝜑) (↔ 𝜃 𝜓) (↔ 𝜒 𝜃))))

(MkIndexed 300 (MkTheorem 3bitr4ri (λ 3bitr4i.1 3bitr4i.2 3bitr4i.3 (bitr2i 3bitr4i.2 (bitr4i 3bitr4i.1 3bitr4i.3))) (-> (↔ 𝜑 𝜓) (↔ 𝜒 𝜑) (↔ 𝜃 𝜓) (↔ 𝜃 𝜒))))

(MkIndexed 301 (MkTheorem 3bitrd (λ 3bitrd.1 3bitrd.2 3bitrd.3 (bitrd (bitrd 3bitrd.1 3bitrd.2) 3bitrd.3)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜒 𝜃)) (→ 𝜑 (↔ 𝜃 𝜏)) (→ 𝜑 (↔ 𝜓 𝜏)))))

(MkIndexed 302 (MkTheorem 3bitrrd (λ 3bitrd.1 3bitrd.2 3bitrd.3 (bitr3d 3bitrd.3 (bitr2d 3bitrd.1 3bitrd.2))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜒 𝜃)) (→ 𝜑 (↔ 𝜃 𝜏)) (→ 𝜑 (↔ 𝜏 𝜓)))))

(MkIndexed 303 (MkTheorem 3bitr2d (λ 3bitr2d.1 3bitr2d.2 3bitr2d.3 (bitrd (bitr4d 3bitr2d.1 3bitr2d.2) 3bitr2d.3)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜃 𝜒)) (→ 𝜑 (↔ 𝜃 𝜏)) (→ 𝜑 (↔ 𝜓 𝜏)))))

(MkIndexed 304 (MkTheorem 3bitr2rd (λ 3bitr2d.1 3bitr2d.2 3bitr2d.3 (bitr2d (bitr4d 3bitr2d.1 3bitr2d.2) 3bitr2d.3)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜃 𝜒)) (→ 𝜑 (↔ 𝜃 𝜏)) (→ 𝜑 (↔ 𝜏 𝜓)))))

(MkIndexed 305 (MkTheorem 3bitr3d (λ 3bitr3d.1 3bitr3d.2 3bitr3d.3 (bitrd (bitr3d 3bitr3d.2 3bitr3d.1) 3bitr3d.3)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜓 𝜃)) (→ 𝜑 (↔ 𝜒 𝜏)) (→ 𝜑 (↔ 𝜃 𝜏)))))

(MkIndexed 306 (MkTheorem 3bitr3rd (λ 3bitr3d.1 3bitr3d.2 3bitr3d.3 (bitr3d 3bitr3d.3 (bitr3d 3bitr3d.1 3bitr3d.2))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜓 𝜃)) (→ 𝜑 (↔ 𝜒 𝜏)) (→ 𝜑 (↔ 𝜏 𝜃)))))

(MkIndexed 307 (MkTheorem 3bitr4d (λ 3bitr4d.1 3bitr4d.2 3bitr4d.3 (bitrd 3bitr4d.2 (bitr4d 3bitr4d.1 3bitr4d.3))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜃 𝜓)) (→ 𝜑 (↔ 𝜏 𝜒)) (→ 𝜑 (↔ 𝜃 𝜏)))))

(MkIndexed 308 (MkTheorem 3bitr4rd (λ 3bitr4d.1 3bitr4d.2 3bitr4d.3 (bitr4d (bitr4d 3bitr4d.3 3bitr4d.1) 3bitr4d.2)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜃 𝜓)) (→ 𝜑 (↔ 𝜏 𝜒)) (→ 𝜑 (↔ 𝜏 𝜃)))))

(MkIndexed 309 (MkTheorem 3bitr3g (λ 3bitr3g.1 3bitr3g.2 3bitr3g.3 (bitrdi (bitr3id 3bitr3g.2 3bitr3g.1) 3bitr3g.3)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (↔ 𝜓 𝜃) (↔ 𝜒 𝜏) (→ 𝜑 (↔ 𝜃 𝜏)))))

(MkIndexed 310 (MkTheorem 3bitr4g (λ 3bitr4g.1 3bitr4g.2 3bitr4g.3 (bitr4di (bitrid 3bitr4g.2 3bitr4g.1) 3bitr4g.3)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (↔ 𝜃 𝜓) (↔ 𝜏 𝜒) (→ 𝜑 (↔ 𝜃 𝜏)))))

(MkIndexed 311 (MkTheorem notnotb (impbii notnot notnotr) (↔ 𝜑 (¬ (¬ 𝜑)))))

(MkIndexed 312 (MkTheorem con34b (impbii con3 con4) (↔ (→ 𝜑 𝜓) (→ (¬ 𝜓) (¬ 𝜑)))))

(MkIndexed 313 (MkTheorem con4bid (λ con4bid.1 (impcon4bid (con4d (biimprd con4bid.1)) (biimpd con4bid.1))) (-> (→ 𝜑 (↔ (¬ 𝜓) (¬ 𝜒))) (→ 𝜑 (↔ 𝜓 𝜒)))))

(MkIndexed 314 (MkTheorem notbid (λ notbid.1 (con4bid (3bitr3g notbid.1 notnotb notnotb))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ (¬ 𝜓) (¬ 𝜒))))))

(MkIndexed 315 (MkTheorem notbi (impbii (notbid id) (con4bid id)) (↔ (↔ 𝜑 𝜓) (↔ (¬ 𝜑) (¬ 𝜓)))))

(MkIndexed 316 (MkTheorem notbii (λ notbii.1 (mpbi notbii.1 notbi)) (-> (↔ 𝜑 𝜓) (↔ (¬ 𝜑) (¬ 𝜓)))))

(MkIndexed 317 (MkTheorem con4bii (λ con4bii.1 (mpbir con4bii.1 notbi)) (-> (↔ (¬ 𝜑) (¬ 𝜓)) (↔ 𝜑 𝜓))))

(MkIndexed 318 (MkTheorem mtbi (λ mtbi.1 mtbi.2 (mto mtbi.1 (biimpri mtbi.2))) (-> (¬ 𝜑) (↔ 𝜑 𝜓) (¬ 𝜓))))

(MkIndexed 319 (MkTheorem mtbir (λ mtbir.1 mtbir.2 (mtbi mtbir.1 (bicomi mtbir.2))) (-> (¬ 𝜓) (↔ 𝜑 𝜓) (¬ 𝜑))))

(MkIndexed 320 (MkTheorem mtbid (λ mtbid.min mtbid.maj (mtod mtbid.min (biimprd mtbid.maj))) (-> (→ 𝜑 (¬ 𝜓)) (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (¬ 𝜒)))))

(MkIndexed 321 (MkTheorem mtbird (λ mtbird.min mtbird.maj (mtod mtbird.min (biimpd mtbird.maj))) (-> (→ 𝜑 (¬ 𝜒)) (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (¬ 𝜓)))))

(MkIndexed 322 (MkTheorem mtbii (λ mtbii.min mtbii.maj (mtoi mtbii.min (biimprd mtbii.maj))) (-> (¬ 𝜓) (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (¬ 𝜒)))))

(MkIndexed 323 (MkTheorem mtbiri (λ mtbiri.min mtbiri.maj (mtoi mtbiri.min (biimpd mtbiri.maj))) (-> (¬ 𝜒) (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (¬ 𝜓)))))

(MkIndexed 324 (MkTheorem sylnib (λ sylnib.1 sylnib.2 (nsyl sylnib.1 (biimpri sylnib.2))) (-> (→ 𝜑 (¬ 𝜓)) (↔ 𝜓 𝜒) (→ 𝜑 (¬ 𝜒)))))

(MkIndexed 325 (MkTheorem sylnibr (λ sylnibr.1 sylnibr.2 (sylnib sylnibr.1 (bicomi sylnibr.2))) (-> (→ 𝜑 (¬ 𝜓)) (↔ 𝜒 𝜓) (→ 𝜑 (¬ 𝜒)))))

(MkIndexed 326 (MkTheorem sylnbi (λ sylnbi.1 sylnbi.2 (sylbi (notbii sylnbi.1) sylnbi.2)) (-> (↔ 𝜑 𝜓) (→ (¬ 𝜓) 𝜒) (→ (¬ 𝜑) 𝜒))))

(MkIndexed 327 (MkTheorem sylnbir (λ sylnbir.1 sylnbir.2 (sylnbi (bicomi sylnbir.1) sylnbir.2)) (-> (↔ 𝜓 𝜑) (→ (¬ 𝜓) 𝜒) (→ (¬ 𝜑) 𝜒))))

(MkIndexed 328 (MkTheorem xchnxbi (λ xchnxbi.1 xchnxbi.2 (bitr3i (notbii xchnxbi.2) xchnxbi.1)) (-> (↔ (¬ 𝜑) 𝜓) (↔ 𝜑 𝜒) (↔ (¬ 𝜒) 𝜓))))

(MkIndexed 329 (MkTheorem xchnxbir (λ xchnxbir.1 xchnxbir.2 (xchnxbi xchnxbir.1 (bicomi xchnxbir.2))) (-> (↔ (¬ 𝜑) 𝜓) (↔ 𝜒 𝜑) (↔ (¬ 𝜒) 𝜓))))

(MkIndexed 330 (MkTheorem xchbinx (λ xchbinx.1 xchbinx.2 (bitri xchbinx.1 (notbii xchbinx.2))) (-> (↔ 𝜑 (¬ 𝜓)) (↔ 𝜓 𝜒) (↔ 𝜑 (¬ 𝜒)))))

(MkIndexed 331 (MkTheorem xchbinxr (λ xchbinxr.1 xchbinxr.2 (xchbinx xchbinxr.1 (bicomi xchbinxr.2))) (-> (↔ 𝜑 (¬ 𝜓)) (↔ 𝜒 𝜓) (↔ 𝜑 (¬ 𝜒)))))

(MkIndexed 332 (MkTheorem imbi2i (λ imbi2i.1 (pm5.74i (a1i imbi2i.1))) (-> (↔ 𝜑 𝜓) (↔ (→ 𝜒 𝜑) (→ 𝜒 𝜓)))))

(MkIndexed 333 (MkTheorem bibi2i (λ bibi2i.1 (impbii (bitrdi id bibi2i.1) (bitr4di id bibi2i.1))) (-> (↔ 𝜑 𝜓) (↔ (↔ 𝜒 𝜑) (↔ 𝜒 𝜓)))))

(MkIndexed 334 (MkTheorem bibi1i (λ bibi2i.1 (3bitri bicom (bibi2i bibi2i.1) bicom)) (-> (↔ 𝜑 𝜓) (↔ (↔ 𝜑 𝜒) (↔ 𝜓 𝜒)))))


(MkIndexed 335 (MkTheorem bibi12i (λ bibi2i.1 bibi12i.2 (bitri (bibi2i bibi12i.2) (bibi1i bibi2i.1))) (-> (↔ 𝜑 𝜓) (↔ 𝜒 𝜃) (↔ (↔ 𝜑 𝜒) (↔ 𝜓 𝜃)))))

(MkIndexed 336 (MkTheorem imbi2d (λ imbid.1 (pm5.74d (a1d imbid.1))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ (→ 𝜃 𝜓) (→ 𝜃 𝜒))))))

(MkIndexed 337 (MkTheorem imbi1d (λ imbid.1 (impbid (imim1d (biimprd imbid.1)) (imim1d (biimpd imbid.1)))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ (→ 𝜓 𝜃) (→ 𝜒 𝜃))))))

(MkIndexed 338 (MkTheorem bibi2d (λ imbid.1 (pm5.74ri (3bitr4i (bibi2i (pm5.74i imbid.1)) pm5.74 pm5.74))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ (↔ 𝜃 𝜓) (↔ 𝜃 𝜒))))))

(MkIndexed 339 (MkTheorem bibi1d (λ imbid.1 (3bitr4g (bibi2d imbid.1) bicom bicom)) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ (↔ 𝜓 𝜃) (↔ 𝜒 𝜃))))))

(MkIndexed 340 (MkTheorem imbi12d (λ imbi12d.1 imbi12d.2 (bitrd (imbi1d imbi12d.1) (imbi2d imbi12d.2))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜃 𝜏)) (→ 𝜑 (↔ (→ 𝜓 𝜃) (→ 𝜒 𝜏))))))

(MkIndexed 341 (MkTheorem bibi12d (λ imbi12d.1 imbi12d.2 (bitrd (bibi1d imbi12d.1) (bibi2d imbi12d.2))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ 𝜑 (↔ 𝜃 𝜏)) (→ 𝜑 (↔ (↔ 𝜓 𝜃) (↔ 𝜒 𝜏))))))

(MkIndexed 342 (MkTheorem imbi12 (expi (imbi12d simplim simprim)) (→ (↔ 𝜑 𝜓) (→ (↔ 𝜒 𝜃) (↔ (→ 𝜑 𝜒) (→ 𝜓 𝜃))))))

(MkIndexed 343 (MkTheorem imbi1 (imbi1d id) (→ (↔ 𝜑 𝜓) (↔ (→ 𝜑 𝜒) (→ 𝜓 𝜒)))))

(MkIndexed 344 (MkTheorem imbi2 (imbi2d id) (→ (↔ 𝜑 𝜓) (↔ (→ 𝜒 𝜑) (→ 𝜒 𝜓)))))

(MkIndexed 345 (MkTheorem imbi1i (λ imbi1i.1 (ax-mp imbi1i.1 imbi1)) (-> (↔ 𝜑 𝜓) (↔ (→ 𝜑 𝜒) (→ 𝜓 𝜒)))))

(MkIndexed 346 (MkTheorem imbi12i (λ imbi12i.1 imbi12i.2 (mp2 imbi12i.1 imbi12i.2 imbi12)) (-> (↔ 𝜑 𝜓) (↔ 𝜒 𝜃) (↔ (→ 𝜑 𝜒) (→ 𝜓 𝜃)))))

(MkIndexed 347 (MkTheorem bibi1 (bibi1d id) (→ (↔ 𝜑 𝜓) (↔ (↔ 𝜑 𝜒) (↔ 𝜓 𝜒)))))

(MkIndexed 348 (MkTheorem bitr3 (biimpd bibi1) (→ (↔ 𝜑 𝜓) (→ (↔ 𝜑 𝜒) (↔ 𝜓 𝜒)))))

(MkIndexed 349 (MkTheorem con2bi (3bitr2i notbi (bibi2i notnotb) bicom) (↔ (↔ 𝜑 (¬ 𝜓)) (↔ 𝜓 (¬ 𝜑)))))

(MkIndexed 350 (MkTheorem con2bid (λ con2bid.1 (sylibr con2bid.1 con2bi)) (-> (→ 𝜑 (↔ 𝜓 (¬ 𝜒))) (→ 𝜑 (↔ 𝜒 (¬ 𝜓))))))

(MkIndexed 351 (MkTheorem con1bid (λ con1bid.1 (bicomd (con2bid (bicomd con1bid.1)))) (-> (→ 𝜑 (↔ (¬ 𝜓) 𝜒)) (→ 𝜑 (↔ (¬ 𝜒) 𝜓)))))

(MkIndexed 352 (MkTheorem con1bii (λ con1bii.1 (bicomi (xchbinx notnotb con1bii.1))) (-> (↔ (¬ 𝜑) 𝜓) (↔ (¬ 𝜓) 𝜑))))

(MkIndexed 353 (MkTheorem con2bii (λ con2bii.1 (xchbinxr notnotb con2bii.1)) (-> (↔ 𝜑 (¬ 𝜓)) (↔ 𝜓 (¬ 𝜑)))))

(MkIndexed 354 (MkTheorem con1b (impbii con1 con1) (↔ (→ (¬ 𝜑) 𝜓) (→ (¬ 𝜓) 𝜑))))

(MkIndexed 355 (MkTheorem con2b (impbii con2 con2) (↔ (→ 𝜑 (¬ 𝜓)) (→ 𝜓 (¬ 𝜑)))))

(MkIndexed 356 (MkTheorem biimt (impbid2 ax-1 pm2.27) (→ 𝜑 (↔ 𝜓 (→ 𝜑 𝜓)))))

(MkIndexed 357 (MkTheorem pm5.5 (bicomd biimt) (→ 𝜑 (↔ (→ 𝜑 𝜓) 𝜓))))

(MkIndexed 358 (MkTheorem a1bi (λ a1bi.1 (ax-mp a1bi.1 biimt)) (-> 𝜑 (↔ 𝜓 (→ 𝜑 𝜓)))))

(MkIndexed 359 (MkTheorem mt2bi (λ mt2bi.1 (bitri (a1bi mt2bi.1) con2b)) (-> 𝜑 (↔ (¬ 𝜓) (→ 𝜓 (¬ 𝜑))))))

(MkIndexed 360 (MkTheorem mtt (bitr4di biimt con34b) (→ (¬ 𝜑) (↔ (¬ 𝜓) (→ 𝜓 𝜑)))))

(MkIndexed 361 (MkTheorem imnot (bicomd mtt) (→ (¬ 𝜓) (↔ (→ 𝜑 𝜓) (¬ 𝜑)))))

(MkIndexed 362 (MkTheorem pm5.501 (impbid pm5.1im (com12 biimp)) (→ 𝜑 (↔ 𝜓 (↔ 𝜑 𝜓)))))

(MkIndexed 363 (MkTheorem ibib (pm5.74i pm5.501) (↔ (→ 𝜑 𝜓) (→ 𝜑 (↔ 𝜑 𝜓)))))

(MkIndexed 364 (MkTheorem ibibr (pm5.74i (bitrdi pm5.501 bicom)) (↔ (→ 𝜑 𝜓) (→ 𝜑 (↔ 𝜓 𝜑)))))

(MkIndexed 365 (MkTheorem tbt (λ tbt.1 (ax-mp tbt.1 (pm5.74ri ibibr))) (-> 𝜑 (↔ 𝜓 (↔ 𝜓 𝜑)))))

(MkIndexed 366 (MkTheorem nbn2 (bitr4di pm5.501 notbi) (→ (¬ 𝜑) (↔ (¬ 𝜓) (↔ 𝜑 𝜓)))))

(MkIndexed 367 (MkTheorem bibif (bitr2di nbn2 bicom) (→ (¬ 𝜓) (↔ (↔ 𝜑 𝜓) (¬ 𝜑)))))

(MkIndexed 368 (MkTheorem nbn (λ nbn.1 (bicomi (ax-mp nbn.1 bibif))) (-> (¬ 𝜑) (↔ (¬ 𝜓) (↔ 𝜓 𝜑)))))

(MkIndexed 369 (MkTheorem nbn3 (λ nbn3.1 (nbn (notnoti nbn3.1))) (-> 𝜑 (↔ (¬ 𝜓) (↔ 𝜓 (¬ 𝜑))))))

(MkIndexed 370 (MkTheorem pm5.21im (biimpd nbn2) (→ (¬ 𝜑) (→ (¬ 𝜓) (↔ 𝜑 𝜓)))))

(MkIndexed 371 (MkTheorem 2false (λ 2false.1 2false.2 (con4bii (2th 2false.1 2false.2))) (-> (¬ 𝜑) (¬ 𝜓) (↔ 𝜑 𝜓))))

(MkIndexed 372 (MkTheorem 2falsed (λ 2falsed.1 2falsed.2 (con4bid (2thd 2falsed.1 2falsed.2))) (-> (→ 𝜑 (¬ 𝜓)) (→ 𝜑 (¬ 𝜒)) (→ 𝜑 (↔ 𝜓 𝜒)))))

(MkIndexed 373 (MkTheorem pm5.21ni (λ pm5.21ni.1 pm5.21ni.2 (2falsed (con3i pm5.21ni.1) (con3i pm5.21ni.2))) (-> (→ 𝜑 𝜓) (→ 𝜒 𝜓) (→ (¬ 𝜓) (↔ 𝜑 𝜒)))))

(MkIndexed 374 (MkTheorem pm5.21nii (λ pm5.21ni.1 pm5.21ni.2 pm5.21nii.3 (pm2.61i pm5.21nii.3 (pm5.21ni pm5.21ni.1 pm5.21ni.2))) (-> (→ 𝜑 𝜓) (→ 𝜒 𝜓) (→ 𝜓 (↔ 𝜑 𝜒)) (↔ 𝜑 𝜒))))

(MkIndexed 375 (MkTheorem pm5.21ndd (λ pm5.21ndd.1 pm5.21ndd.2 pm5.21ndd.3 (pm2.61d pm5.21ndd.3 (syl6c (con3d pm5.21ndd.1) (con3d pm5.21ndd.2) pm5.21im))) (-> (→ 𝜑 (→ 𝜒 𝜓)) (→ 𝜑 (→ 𝜃 𝜓)) (→ 𝜑 (→ 𝜓 (↔ 𝜒 𝜃))) (→ 𝜑 (↔ 𝜒 𝜃)))))

(MkIndexed 376 (MkTheorem bija (λ bija.1 bija.2 (pm2.61d (syli biimpr bija.1) (syli (con3d biimp) bija.2))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ (¬ 𝜑) (→ (¬ 𝜓) 𝜒)) (→ (↔ 𝜑 𝜓) 𝜒))))

(MkIndexed 377 (MkTheorem pm5.18 (pm2.61i (bitr2d (con1bid pm5.501) pm5.501) (bitr2d (con1bid nbn2) nbn2)) (↔ (↔ 𝜑 𝜓) (¬ (↔ 𝜑 (¬ 𝜓))))))

(MkIndexed 378 (MkTheorem xor3 (bicomi (con2bii pm5.18)) (↔ (¬ (↔ 𝜑 𝜓)) (↔ 𝜑 (¬ 𝜓)))))

(MkIndexed 379 (MkTheorem nbbn (3bitrri xor3 con2bi bicom) (↔ (↔ (¬ 𝜑) 𝜓) (¬ (↔ 𝜑 𝜓)))))

(MkIndexed 380 (MkTheorem biass (pm2.61i (bitr3d (bibi1d pm5.501) pm5.501) (bitr3d (bitr3id nbbn (bibi1d nbn2)) nbn2)) (↔ (↔ (↔ 𝜑 𝜓) 𝜒) (↔ 𝜑 (↔ 𝜓 𝜒)))))

(MkIndexed 381 (MkTheorem biluk (bitr4i (mpbi (bitri (bibi1i bicom) biass) biass) biass) (↔ (↔ 𝜑 𝜓) (↔ (↔ 𝜒 𝜓) (↔ 𝜑 𝜒)))))

(MkIndexed 382 (MkTheorem pm5.19 (mpbi biid pm5.18) (¬ (↔ 𝜑 (¬ 𝜑)))))

(MkIndexed 383 (MkTheorem bi2.04 (impbii pm2.04 pm2.04) (↔ (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜓 (→ 𝜑 𝜒)))))

(MkIndexed 384 (MkTheorem pm5.4 (pm5.74i pm5.5) (↔ (→ 𝜑 (→ 𝜑 𝜓)) (→ 𝜑 𝜓))))

(MkIndexed 385 (MkTheorem imdi (impbii ax-2 pm2.86) (↔ (→ 𝜑 (→ 𝜓 𝜒)) (→ (→ 𝜑 𝜓) (→ 𝜑 𝜒)))))

(MkIndexed 386 (MkTheorem pm5.41 (bicomi imdi) (↔ (→ (→ 𝜑 𝜓) (→ 𝜑 𝜒)) (→ 𝜑 (→ 𝜓 𝜒)))))

(MkIndexed 387 (MkTheorem imbibi (pm5.74rd (bitr3id pm5.4 imbi2)) (→ (↔ (→ 𝜑 𝜓) 𝜒) (→ 𝜑 (↔ 𝜓 𝜒)))))

(MkIndexed 388 (MkTheorem pm4.8 (impbii pm2.01 ax-1) (↔ (→ 𝜑 (¬ 𝜑)) (¬ 𝜑))))

(MkIndexed 389 (MkTheorem pm4.81 (impbii pm2.18 pm2.24) (↔ (→ (¬ 𝜑) 𝜑) 𝜑)))

(MkIndexed 390 (MkTheorem imim21b (bitrid bi2.04 (pm5.74d (imim2i (imbi1d pm5.5)))) (→ (→ 𝜓 𝜑) (↔ (→ (→ 𝜑 𝜒) (→ 𝜓 𝜃)) (→ 𝜓 (→ 𝜒 𝜃))))))

(MkIndexed 391 (MkAxiom df-an (↔ (∧ 𝜑 𝜓) (¬ (→ 𝜑 (¬ 𝜓))))))

(MkIndexed 392 (MkTheorem pm4.63 (bicomi df-an) (↔ (¬ (→ 𝜑 (¬ 𝜓))) (∧ 𝜑 𝜓))))

(MkIndexed 393 (MkTheorem pm4.67 pm4.63 (↔ (¬ (→ (¬ 𝜑) (¬ 𝜓))) (∧ (¬ 𝜑) 𝜓))))

(MkIndexed 394 (MkTheorem imnan (con2bii df-an) (↔ (→ 𝜑 (¬ 𝜓)) (¬ (∧ 𝜑 𝜓)))))

(MkIndexed 395 (MkTheorem imnani (λ imnani.1 (mpbir imnani.1 imnan)) (-> (¬ (∧ 𝜑 𝜓)) (→ 𝜑 (¬ 𝜓)))))

(MkIndexed 396 (MkTheorem iman (bitri (imbi2i notnotb) imnan) (↔ (→ 𝜑 𝜓) (¬ (∧ 𝜑 (¬ 𝜓))))))

(MkIndexed 397 (MkTheorem pm3.24 (mpbi id iman) (¬ (∧ 𝜑 (¬ 𝜑)))))

(MkIndexed 398 (MkTheorem annim (con2bii iman) (↔ (∧ 𝜑 (¬ 𝜓)) (¬ (→ 𝜑 𝜓)))))

(MkIndexed 399 (MkTheorem pm4.61 (bicomi annim) (↔ (¬ (→ 𝜑 𝜓)) (∧ 𝜑 (¬ 𝜓)))))

(MkIndexed 400 (MkTheorem pm4.65 pm4.61 (↔ (¬ (→ (¬ 𝜑) 𝜓)) (∧ (¬ 𝜑) (¬ 𝜓)))))

(MkIndexed 401 (MkTheorem imp (λ imp.1 (sylbi df-an (impi imp.1))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ (∧ 𝜑 𝜓) 𝜒))))

(MkIndexed 402 (MkTheorem impcom (λ imp.1 (imp (com12 imp.1))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ (∧ 𝜓 𝜑) 𝜒))))

(MkIndexed 403 (MkTheorem con3dimp (λ con3dimp.1 (imp (con3d con3dimp.1))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ (∧ 𝜑 (¬ 𝜒)) (¬ 𝜓)))))

(MkIndexed 404 (MkTheorem mpnanrd (λ mpnanrd.1 mpnanrd.2 (mpd mpnanrd.1 (sylibr mpnanrd.2 imnan))) (-> (→ 𝜑 𝜓) (→ 𝜑 (¬ (∧ 𝜓 𝜒))) (→ 𝜑 (¬ 𝜒)))))

(MkIndexed 405 (MkTheorem impd (λ impd.1 (com12 (imp (com3l impd.1)))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜑 (→ (∧ 𝜓 𝜒) 𝜃)))))

(MkIndexed 406 (MkTheorem impcomd (λ impd.1 (impd (com23 impd.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ 𝜑 (→ (∧ 𝜒 𝜓) 𝜃)))))

(MkIndexed 407 (MkTheorem ex (λ ex.1 (expi (sylbir df-an ex.1))) (-> (→ (∧ 𝜑 𝜓) 𝜒) (→ 𝜑 (→ 𝜓 𝜒)))))

(MkIndexed 408 (MkTheorem expcom (λ ex.1 (com12 (ex ex.1))) (-> (→ (∧ 𝜑 𝜓) 𝜒) (→ 𝜓 (→ 𝜑 𝜒)))))

(MkIndexed 409 (MkTheorem expdcom (λ expd.1 (ex (com12 expd.1))) (-> (→ 𝜑 (→ (∧ 𝜓 𝜒) 𝜃)) (→ 𝜓 (→ 𝜒 (→ 𝜑 𝜃))))))

(MkIndexed 410 (MkTheorem expd (λ expd.1 (com3r (expdcom expd.1))) (-> (→ 𝜑 (→ (∧ 𝜓 𝜒) 𝜃)) (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))))))

(MkIndexed 411 (MkTheorem expcomd (λ expcomd.1 (com23 (expd expcomd.1))) (-> (→ 𝜑 (→ (∧ 𝜓 𝜒) 𝜃)) (→ 𝜑 (→ 𝜒 (→ 𝜓 𝜃))))))

(MkIndexed 412 (MkTheorem imp31 (λ imp31.1 (imp (imp imp31.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ (∧ (∧ 𝜑 𝜓) 𝜒) 𝜃))))

(MkIndexed 413 (MkTheorem imp32 (λ imp31.1 (imp (impd imp31.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))) (→ (∧ 𝜑 (∧ 𝜓 𝜒)) 𝜃))))

(MkIndexed 414 (MkTheorem exp31 (λ exp31.1 (ex (ex exp31.1))) (-> (→ (∧ (∧ 𝜑 𝜓) 𝜒) 𝜃) (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))))))

(MkIndexed 415 (MkTheorem exp32 (λ exp32.1 (expd (ex exp32.1))) (-> (→ (∧ 𝜑 (∧ 𝜓 𝜒)) 𝜃) (→ 𝜑 (→ 𝜓 (→ 𝜒 𝜃))))))

(MkIndexed 416 (MkTheorem imp4b (λ imp4.1 (impd (imp imp4.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))) (→ (∧ 𝜑 𝜓) (→ (∧ 𝜒 𝜃) 𝜏)))))

(MkIndexed 417 (MkTheorem imp4a (λ imp4.1 (ex (imp4b imp4.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))) (→ 𝜑 (→ 𝜓 (→ (∧ 𝜒 𝜃) 𝜏))))))

(MkIndexed 418 (MkTheorem imp4c (λ imp4.1 (impd (impd imp4.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))) (→ 𝜑 (→ (∧ (∧ 𝜓 𝜒) 𝜃) 𝜏)))))

(MkIndexed 419 (MkTheorem imp4d (λ imp4.1 (impd (imp4a imp4.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))) (→ 𝜑 (→ (∧ 𝜓 (∧ 𝜒 𝜃)) 𝜏)))))
(MkIndexed 420 (MkTheorem imp41 (λ imp4.1 (imp31 (imp imp4.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))) (→ (∧ (∧ (∧ 𝜑 𝜓) 𝜒) 𝜃) 𝜏))))

(MkIndexed 421 (MkTheorem imp42 (λ imp4.1 (imp (imp32 imp4.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))) (→ (∧ (∧ 𝜑 (∧ 𝜓 𝜒)) 𝜃) 𝜏))))

(MkIndexed 422 (MkTheorem imp43 (λ imp4.1 (imp (imp4b imp4.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))) (→ (∧ (∧ 𝜑 𝜓) (∧ 𝜒 𝜃)) 𝜏))))

(MkIndexed 423 (MkTheorem imp44 (λ imp4.1 (imp (imp4c imp4.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))) (→ (∧ 𝜑 (∧ (∧ 𝜓 𝜒) 𝜃)) 𝜏))))

(MkIndexed 424 (MkTheorem imp45 (λ imp4.1 (imp (imp4d imp4.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))) (→ (∧ 𝜑 (∧ 𝜓 (∧ 𝜒 𝜃))) 𝜏))))

(MkIndexed 425 (MkTheorem exp4b (λ exp4b.1 (ex (expd exp4b.1))) (-> (→ (∧ 𝜑 𝜓) (→ (∧ 𝜒 𝜃) 𝜏)) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))))))

(MkIndexed 426 (MkTheorem exp4a (λ exp4a.1 (exp4b (imp exp4a.1))) (-> (→ 𝜑 (→ 𝜓 (→ (∧ 𝜒 𝜃) 𝜏))) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))))))

(MkIndexed 427 (MkTheorem exp4c (λ exp4c.1 (expd (expd exp4c.1))) (-> (→ 𝜑 (→ (∧ (∧ 𝜓 𝜒) 𝜃) 𝜏)) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))))))

(MkIndexed 428 (MkTheorem exp4d (λ exp4d.1 (exp4a (expd exp4d.1))) (-> (→ 𝜑 (→ (∧ 𝜓 (∧ 𝜒 𝜃)) 𝜏)) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))))))

(MkIndexed 429 (MkTheorem exp41 (λ exp41.1 (exp31 (ex exp41.1))) (-> (→ (∧ (∧ (∧ 𝜑 𝜓) 𝜒) 𝜃) 𝜏) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))))))

(MkIndexed 430 (MkTheorem exp42 (λ exp42.1 (expd (exp31 exp42.1))) (-> (→ (∧ (∧ 𝜑 (∧ 𝜓 𝜒)) 𝜃) 𝜏) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))))))

(MkIndexed 431 (MkTheorem exp43 (λ exp43.1 (exp4b (ex exp43.1))) (-> (→ (∧ (∧ 𝜑 𝜓) (∧ 𝜒 𝜃)) 𝜏) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))))))

(MkIndexed 432 (MkTheorem exp44 (λ exp44.1 (expd (exp32 exp44.1))) (-> (→ (∧ 𝜑 (∧ (∧ 𝜓 𝜒) 𝜃)) 𝜏) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))))))

(MkIndexed 433 (MkTheorem exp45 (λ exp45.1 (exp4a (exp32 exp45.1))) (-> (→ (∧ 𝜑 (∧ 𝜓 (∧ 𝜒 𝜃))) 𝜏) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 𝜏)))))))

(MkIndexed 434 (MkTheorem imp5d (λ imp5.1 (impd (imp31 imp5.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))) (→ (∧ (∧ 𝜑 𝜓) 𝜒) (→ (∧ 𝜃 𝜏) 𝜂)))))

(MkIndexed 435 (MkTheorem imp5a (λ imp5.1 (exp31 (imp5d imp5.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ (∧ 𝜃 𝜏) 𝜂)))))))

(MkIndexed 436 (MkTheorem imp5g (λ imp5.1 (impd (imp4b imp5.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))) (→ (∧ 𝜑 𝜓) (→ (∧ (∧ 𝜒 𝜃) 𝜏) 𝜂)))))

(MkIndexed 437 (MkTheorem imp55 (λ imp5.1 (imp42 (imp4a imp5.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))) (→ (∧ (∧ 𝜑 (∧ 𝜓 (∧ 𝜒 𝜃))) 𝜏) 𝜂))))

(MkIndexed 438 (MkTheorem imp511 (λ imp5.1 (imp44 (imp4a imp5.1))) (-> (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))) (→ (∧ 𝜑 (∧ (∧ 𝜓 (∧ 𝜒 𝜃)) 𝜏)) 𝜂))))

(MkIndexed 439 (MkTheorem exp5c (λ exp5c.1 (expd (exp4a exp5c.1))) (-> (→ 𝜑 (→ (∧ 𝜓 𝜒) (→ (∧ 𝜃 𝜏) 𝜂))) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))))))

(MkIndexed 440 (MkTheorem exp5j (λ exp5j.1 (exp4c (expd exp5j.1))) (-> (→ 𝜑 (→ (∧ (∧ (∧ 𝜓 𝜒) 𝜃) 𝜏) 𝜂)) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))))))

(MkIndexed 441 (MkTheorem exp5l (λ exp5l.1 (exp5c (expd exp5l.1))) (-> (→ 𝜑 (→ (∧ (∧ 𝜓 𝜒) (∧ 𝜃 𝜏)) 𝜂)) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))))))

(MkIndexed 442 (MkTheorem exp53 (λ exp53.1 (exp43 (ex exp53.1))) (-> (→ (∧ (∧ (∧ 𝜑 𝜓) (∧ 𝜒 𝜃)) 𝜏) 𝜂) (→ 𝜑 (→ 𝜓 (→ 𝜒 (→ 𝜃 (→ 𝜏 𝜂))))))))

(MkIndexed 443 (MkTheorem pm3.3 (expd id) (→ (→ (∧ 𝜑 𝜓) 𝜒) (→ 𝜑 (→ 𝜓 𝜒)))))

(MkIndexed 444 (MkTheorem pm3.31 (impd id) (→ (→ 𝜑 (→ 𝜓 𝜒)) (→ (∧ 𝜑 𝜓) 𝜒))))

(MkIndexed 445 (MkTheorem impexp (impbii pm3.3 pm3.31) (↔ (→ (∧ 𝜑 𝜓) 𝜒) (→ 𝜑 (→ 𝜓 𝜒)))))

(MkIndexed 446 (MkTheorem impancom (λ impancom.1 (imp (com23 (ex impancom.1)))) (-> (→ (∧ 𝜑 𝜓) (→ 𝜒 𝜃)) (→ (∧ 𝜑 𝜒) (→ 𝜓 𝜃)))))

(MkIndexed 447 (MkTheorem expdimp (λ expdimp.1 (imp (expd expdimp.1))) (-> (→ 𝜑 (→ (∧ 𝜓 𝜒) 𝜃)) (→ (∧ 𝜑 𝜓) (→ 𝜒 𝜃)))))

(MkIndexed 448 (MkTheorem expimpd (λ expimpd.1 (impd (ex expimpd.1))) (-> (→ (∧ 𝜑 𝜓) (→ 𝜒 𝜃)) (→ 𝜑 (→ (∧ 𝜓 𝜒) 𝜃)))))

(MkIndexed 449 (MkTheorem impr (λ impr.1 (imp32 (ex impr.1))) (-> (→ (∧ 𝜑 𝜓) (→ 𝜒 𝜃)) (→ (∧ 𝜑 (∧ 𝜓 𝜒)) 𝜃))))

(MkIndexed 450 (MkTheorem impl (λ impl.1 (imp31 (expd impl.1))) (-> (→ 𝜑 (→ (∧ 𝜓 𝜒) 𝜃)) (→ (∧ (∧ 𝜑 𝜓) 𝜒) 𝜃))))
(MkIndexed 451 (MkTheorem expr (λ expr.1 (imp (exp32 expr.1))) (-> (→ (∧ 𝜑 (∧ 𝜓 𝜒)) 𝜃) (→ (∧ 𝜑 𝜓) (→ 𝜒 𝜃)))))

(MkIndexed 452 (MkTheorem expl (λ expl.1 (impd (exp31 expl.1))) (-> (→ (∧ (∧ 𝜑 𝜓) 𝜒) 𝜃) (→ 𝜑 (→ (∧ 𝜓 𝜒) 𝜃)))))

(MkIndexed 453 (MkTheorem ancoms (λ ancoms.1 (imp (expcom ancoms.1))) (-> (→ (∧ 𝜑 𝜓) 𝜒) (→ (∧ 𝜓 𝜑) 𝜒))))

(MkIndexed 454 (MkTheorem pm3.22 (ancoms id) (→ (∧ 𝜑 𝜓) (∧ 𝜓 𝜑))))

(MkIndexed 455 (MkTheorem ancom (impbii pm3.22 pm3.22) (↔ (∧ 𝜑 𝜓) (∧ 𝜓 𝜑))))

(MkIndexed 456 (MkTheorem ancomd (λ ancomd.1 (sylib ancomd.1 ancom)) (-> (→ 𝜑 (∧ 𝜓 𝜒)) (→ 𝜑 (∧ 𝜒 𝜓)))))

(MkIndexed 457 (MkTheorem biancomi (λ biancomi.1 (bitr4i biancomi.1 ancom)) (-> (↔ 𝜑 (∧ 𝜒 𝜓)) (↔ 𝜑 (∧ 𝜓 𝜒)))))

(MkIndexed 458 (MkTheorem biancomd (λ biancomd.1 (bitrdi biancomd.1 ancom)) (-> (→ 𝜑 (↔ 𝜓 (∧ 𝜃 𝜒))) (→ 𝜑 (↔ 𝜓 (∧ 𝜒 𝜃))))))

(MkIndexed 459 (MkTheorem ancomst (imbi1i ancom) (↔ (→ (∧ 𝜑 𝜓) 𝜒) (→ (∧ 𝜓 𝜑) 𝜒))))

(MkIndexed 460 (MkTheorem ancomsd (λ ancomsd.1 (impd (expcomd ancomsd.1))) (-> (→ 𝜑 (→ (∧ 𝜓 𝜒) 𝜃)) (→ 𝜑 (→ (∧ 𝜒 𝜓) 𝜃)))))

(MkIndexed 461 (MkTheorem anasss (λ anasss.1 (imp32 (exp31 anasss.1))) (-> (→ (∧ (∧ 𝜑 𝜓) 𝜒) 𝜃) (→ (∧ 𝜑 (∧ 𝜓 𝜒)) 𝜃))))

(MkIndexed 462 (MkTheorem anassrs (λ anassrs.1 (imp31 (exp32 anassrs.1))) (-> (→ (∧ 𝜑 (∧ 𝜓 𝜒)) 𝜃) (→ (∧ (∧ 𝜑 𝜓) 𝜒) 𝜃))))

(MkIndexed 463 (MkTheorem anass (impbii (anassrs id) (anasss id)) (↔ (∧ (∧ 𝜑 𝜓) 𝜒) (∧ 𝜑 (∧ 𝜓 𝜒)))))

(MkIndexed 464 (MkTheorem pm3.2 (ex id) (→ 𝜑 (→ 𝜓 (∧ 𝜑 𝜓)))))

(MkIndexed 465 (MkTheorem pm3.2i (λ pm3.2i.1 pm3.2i.2 (mp2 pm3.2i.1 pm3.2i.2 pm3.2)) (-> 𝜑 𝜓 (∧ 𝜑 𝜓))))

(MkIndexed 466 (MkTheorem pm3.21 (expcom id) (→ 𝜑 (→ 𝜓 (∧ 𝜓 𝜑)))))

(MkIndexed 467 (MkTheorem pm3.43i (imim3i pm3.2) (→ (→ 𝜑 𝜓) (→ (→ 𝜑 𝜒) (→ 𝜑 (∧ 𝜓 𝜒))))))

(MkIndexed 468 (MkTheorem pm3.43 (imp pm3.43i) (→ (∧ (→ 𝜑 𝜓) (→ 𝜑 𝜒)) (→ 𝜑 (∧ 𝜓 𝜒)))))

(MkIndexed 469 (MkTheorem dfbi2 (bitr4i dfbi1 df-an) (↔ (↔ 𝜑 𝜓) (∧ (→ 𝜑 𝜓) (→ 𝜓 𝜑)))))

(MkIndexed 470 (MkTheorem dfbi (mpbi dfbi2 dfbi2) (∧ (→ (↔ 𝜑 𝜓) (∧ (→ 𝜑 𝜓) (→ 𝜓 𝜑))) (→ (∧ (→ 𝜑 𝜓) (→ 𝜓 𝜑)) (↔ 𝜑 𝜓)))))

(MkIndexed 471 (MkTheorem biimpa (λ biimpa.1 (imp (biimpd biimpa.1))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ (∧ 𝜑 𝜓) 𝜒))))

(MkIndexed 472 (MkTheorem biimpar (λ biimpa.1 (imp (biimprd biimpa.1))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ (∧ 𝜑 𝜒) 𝜓))))

(MkIndexed 473 (MkTheorem biimpac (λ biimpa.1 (imp (biimpcd biimpa.1))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ (∧ 𝜓 𝜑) 𝜒))))

(MkIndexed 474 (MkTheorem biimparc (λ biimpa.1 (imp (biimprcd biimpa.1))) (-> (→ 𝜑 (↔ 𝜓 𝜒)) (→ (∧ 𝜒 𝜑) 𝜓))))

(MkIndexed 475 (MkTheorem adantr (λ adantr.1 (imp (a1d adantr.1))) (-> (→ 𝜑 𝜓) (→ (∧ 𝜑 𝜒) 𝜓))))

(MkIndexed 476 (MkTheorem adantl (λ adantl.1 (ancoms (adantr adantl.1))) (-> (→ 𝜑 𝜓) (→ (∧ 𝜒 𝜑) 𝜓))))

(MkIndexed 477 (MkTheorem simpl (adantr id) (→ (∧ 𝜑 𝜓) 𝜑)))

(MkIndexed 478 (MkTheorem simpli (λ simpli.1 (ax-mp simpli.1 simpl)) (-> (∧ 𝜑 𝜓) 𝜑)))

(MkIndexed 479 (MkTheorem simpr (adantl id) (→ (∧ 𝜑 𝜓) 𝜓)))

(MkIndexed 480 (MkTheorem simpri (λ simpri.1 (ax-mp simpri.1 simpr)) (-> (∧ 𝜑 𝜓) 𝜓)))

(MkIndexed 481 (MkTheorem intnan (λ intnan.1 (mto intnan.1 simpr)) (-> (¬ 𝜑) (¬ (∧ 𝜓 𝜑)))))

(MkIndexed 482 (MkTheorem intnanr (λ intnan.1 (mto intnan.1 simpl)) (-> (¬ 𝜑) (¬ (∧ 𝜑 𝜓)))))

(MkIndexed 483 (MkTheorem intnand (λ intnand.1 (nsyl intnand.1 simpr)) (-> (→ 𝜑 (¬ 𝜓)) (→ 𝜑 (¬ (∧ 𝜒 𝜓))))))

(MkIndexed 484 (MkTheorem intnanrd (λ intnand.1 (nsyl intnand.1 simpl)) (-> (→ 𝜑 (¬ 𝜓)) (→ 𝜑 (¬ (∧ 𝜓 𝜒))))))

(MkIndexed 485 (MkTheorem adantld (λ adantld.1 (syl5 simpr adantld.1)) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ (∧ 𝜃 𝜓) 𝜒)))))

(MkIndexed 486 (MkTheorem adantrd (λ adantrd.1 (syl5 simpl adantrd.1)) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜑 (→ (∧ 𝜓 𝜃) 𝜒)))))

(MkIndexed 487 (MkTheorem pm3.41 (imim1i simpl) (→ (→ 𝜑 𝜒) (→ (∧ 𝜑 𝜓) 𝜒))))

(MkIndexed 488 (MkTheorem pm3.42 (imim1i simpr) (→ (→ 𝜓 𝜒) (→ (∧ 𝜑 𝜓) 𝜒))))

(MkIndexed 489 (MkTheorem simpld (λ simpld.1 (syl simpld.1 simpl)) (-> (→ 𝜑 (∧ 𝜓 𝜒)) (→ 𝜑 𝜓))))

(MkIndexed 490 (MkTheorem simprd (λ simprd.1 (simpld (ancomd simprd.1))) (-> (→ 𝜑 (∧ 𝜓 𝜒)) (→ 𝜑 𝜒))))

(MkIndexed 491 (MkTheorem simprbi (λ simprbi.1 (simprd (biimpi simprbi.1))) (-> (↔ 𝜑 (∧ 𝜓 𝜒)) (→ 𝜑 𝜒))))

(MkIndexed 492 (MkTheorem simplbi (λ simplbi.1 (simpld (biimpi simplbi.1))) (-> (↔ 𝜑 (∧ 𝜓 𝜒)) (→ 𝜑 𝜓))))

(MkIndexed 493 (MkTheorem simprbda (λ pm3.26bda.1 (simpld (biimpa pm3.26bda.1))) (-> (→ 𝜑 (↔ 𝜓 (∧ 𝜒 𝜃))) (→ (∧ 𝜑 𝜓) 𝜒))))

(MkIndexed 494 (MkTheorem simplbda (λ pm3.26bda.1 (simprd (biimpa pm3.26bda.1))) (-> (→ 𝜑 (↔ 𝜓 (∧ 𝜒 𝜃))) (→ (∧ 𝜑 𝜓) 𝜃))))

(MkIndexed 495 (MkTheorem simplbi2 (λ simplbi2.1 (ex (biimpri simplbi2.1))) (-> (↔ 𝜑 (∧ 𝜓 𝜒)) (→ 𝜓 (→ 𝜒 𝜑)))))

(MkIndexed 496 (MkTheorem simplbi2comt (expcomd biimpr) (→ (↔ 𝜑 (∧ 𝜓 𝜒)) (→ 𝜒 (→ 𝜓 𝜑)))))

(MkIndexed 497 (MkTheorem simplbi2com (λ simplbi2com.1 (com12 (simplbi2 simplbi2com.1))) (-> (↔ 𝜑 (∧ 𝜓 𝜒)) (→ 𝜒 (→ 𝜓 𝜑)))))

(MkIndexed 498 (MkTheorem simpl2im (λ simpl2im.1 simpl2im.2 (syl (simprd simpl2im.1) simpl2im.2)) (-> (→ 𝜑 (∧ 𝜓 𝜒)) (→ 𝜒 𝜃) (→ 𝜑 𝜃))))

(MkIndexed 499 (MkTheorem simplbiim (λ simplbiim.1 simplbiim.2 (syl (simprbi simplbiim.1) simplbiim.2)) (-> (↔ 𝜑 (∧ 𝜓 𝜒)) (→ 𝜒 𝜃) (→ 𝜑 𝜃))))

(MkIndexed 500 (MkTheorem impel (λ impel.1 impel.2 (imp (syl5 impel.2 impel.1))) (-> (→ 𝜑 (→ 𝜓 𝜒)) (→ 𝜃 𝜓) (→ (∧ 𝜑 𝜃) 𝜒))))



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