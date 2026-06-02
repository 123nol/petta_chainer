;; ============================================================
;; Mathlib Mined Implications — PeTTaChainer AtomSpace Format
;; ============================================================

!(compileadd kb
   (: (no_inverse AddConstMap.toEnd_to_AddConstMap_to_End)
      (Implication
         (Premises
            (Provable (AddConstMap $x))
         )
         (Conclusions
            (Provable (End $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddConstEquiv_extends_G)
      (Implication
         (Premises
            (Provable (AddConstEquiv $x))
         )
         (Conclusions
            (Provable (G $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddConstEquiv_extends_AddConstMap)
      (Implication
         (Premises
            (Provable (AddConstEquiv $x))
         )
         (Conclusions
            (Provable (AddConstMap $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddConstEquiv.Simps.symm_apply_to_H_to_G)
      (Implication
         (Premises
            (Provable (H $x))
         )
         (Conclusions
            (Provable (G $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddConstEquiv.toPerm_to_AddConstEquiv_to_Perm)
      (Implication
         (Premises
            (Provable (AddConstEquiv $x))
         )
         (Conclusions
            (Provable (Perm $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddTorsor_extends_AddAction)
      (Implication
         (Premises
            (Provable (AddTorsor $x))
         )
         (Conclusions
            (Provable (AddAction $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddTorsor_extends_VSub)
      (Implication
         (Premises
            (Provable (AddTorsor $x))
         )
         (Conclusions
            (Provable (VSub $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse IsAffineAddMonoid_extends_IsCancelAdd)
      (Implication
         (Premises
            (Provable (IsAffineAddMonoid $x))
         )
         (Conclusions
            (Provable (IsCancelAdd $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse IsAffineAddMonoid_extends_FG)
      (Implication
         (Premises
            (Provable (IsAffineAddMonoid $x))
         )
         (Conclusions
            (Provable (FG $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse IsAffineAddMonoid_extends_IsAddTorsionFree)
      (Implication
         (Premises
            (Provable (IsAffineAddMonoid $x))
         )
         (Conclusions
            (Provable (IsAddTorsionFree $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse IsAffineMonoid_extends_IsCancelMul)
      (Implication
         (Premises
            (Provable (IsAffineMonoid $x))
         )
         (Conclusions
            (Provable (IsCancelMul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse IsAffineMonoid_extends_FG)
      (Implication
         (Premises
            (Provable (IsAffineMonoid $x))
         )
         (Conclusions
            (Provable (FG $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse IsAffineMonoid_extends_IsMulTorsionFree)
      (Implication
         (Premises
            (Provable (IsAffineMonoid $x))
         )
         (Conclusions
            (Provable (IsMulTorsionFree $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Module.isTorsionFree_iff_faithfulSMul_to_IsTorsionFree_to_FaithfulSMul)
      (Implication
         (Premises
            (Provable (IsTorsionFree $x))
         )
         (Conclusions
            (Provable (FaithfulSMul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Module.isTorsionFree_iff_faithfulSMul_to_FaithfulSMul_to_IsTorsionFree)
      (Implication
         (Premises
            (Provable (FaithfulSMul $x))
         )
         (Conclusions
            (Provable (IsTorsionFree $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NoZeroSMulDivisors.iff_faithfulSMul_to_IsTorsionFree_to_FaithfulSMul)
      (Implication
         (Premises
            (Provable (IsTorsionFree $x))
         )
         (Conclusions
            (Provable (FaithfulSMul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NoZeroSMulDivisors.iff_faithfulSMul_to_FaithfulSMul_to_IsTorsionFree)
      (Implication
         (Premises
            (Provable (FaithfulSMul $x))
         )
         (Conclusions
            (Provable (IsTorsionFree $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgHom.lmul_to_A_to_End)
      (Implication
         (Premises
            (Provable (A $x))
         )
         (Conclusions
            (Provable (End $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Algebra.lmul_to_A_to_End)
      (Implication
         (Premises
            (Provable (A $x))
         )
         (Conclusions
            (Provable (End $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Algebra_extends_SMul)
      (Implication
         (Premises
            (Provable (Algebra $x))
         )
         (Conclusions
            (Provable (SMul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Algebra.cast_to_R_to_A)
      (Implication
         (Premises
            (Provable (R $x))
         )
         (Conclusions
            (Provable (A $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgEquiv_extends_A)
      (Implication
         (Premises
            (Provable (AlgEquiv $x))
         )
         (Conclusions
            (Provable (A $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgEquivClass_extends_RingEquivClass)
      (Implication
         (Premises
            (Provable (AlgEquivClass $x))
         )
         (Conclusions
            (Provable (RingEquivClass $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgEquiv.congr_arg_to_x_to_f)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgEquiv.symm_apply_eq_to_symm_to_x)
      (Implication
         (Premises
            (Provable (symm $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgEquiv.symm_apply_eq_to_x_to_symm)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (symm $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgEquiv.eq_symm_apply_to_symm_to_e)
      (Implication
         (Premises
            (Provable (symm $x))
         )
         (Conclusions
            (Provable (e $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgEquiv.eq_symm_apply_to_e_to_symm)
      (Implication
         (Premises
            (Provable (e $x))
         )
         (Conclusions
            (Provable (symm $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgHom_extends_A)
      (Implication
         (Premises
            (Provable (AlgHom $x))
         )
         (Conclusions
            (Provable (A $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgHomClass_extends_RingHomClass)
      (Implication
         (Premises
            (Provable (AlgHomClass $x))
         )
         (Conclusions
            (Provable (RingHomClass $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Algebra.ext_id_iff_to_f_to_True)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (True $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Algebra.ext_id_iff_to_True_to_f)
      (Implication
         (Premises
            (Provable (True $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgHom_extends_A)
      (Implication
         (Premises
            (Provable (NonUnitalAlgHom $x))
         )
         (Conclusions
            (Provable (A $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgSemiHomClass_extends_DistribMulActionSemiHomClass)
      (Implication
         (Premises
            (Provable (NonUnitalAlgSemiHomClass $x))
         )
         (Conclusions
            (Provable (DistribMulActionSemiHomClass $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgSemiHomClass_extends_MulHomClass)
      (Implication
         (Premises
            (Provable (NonUnitalAlgSemiHomClass $x))
         )
         (Conclusions
            (Provable (MulHomClass $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgHom.Simps.apply_to_A_to_B)
      (Implication
         (Premises
            (Provable (A $x))
         )
         (Conclusions
            (Provable (B $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra_extends_NonUnitalSubsemiring)
      (Implication
         (Premises
            (Provable (NonUnitalSubalgebra $x))
         )
         (Conclusions
            (Provable (NonUnitalSubsemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra_extends_Submodule)
      (Implication
         (Premises
            (Provable (NonUnitalSubalgebra $x))
         )
         (Conclusions
            (Provable (Submodule $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.toNonUnitalSubsemiring_inj_to_toNonUnitalSubsemiring_to_s)
      (Implication
         (Premises
            (Provable (toNonUnitalSubsemiring $x))
         )
         (Conclusions
            (Provable (s $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.toNonUnitalSubsemiring_inj_to_s_to_toNonUnitalSubsemiring)
      (Implication
         (Premises
            (Provable (s $x))
         )
         (Conclusions
            (Provable (toNonUnitalSubsemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.toSubmodule_inj_to_toSubmodule_to_s)
      (Implication
         (Premises
            (Provable (toSubmodule $x))
         )
         (Conclusions
            (Provable (s $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.toSubmodule_inj_to_s_to_toSubmodule)
      (Implication
         (Premises
            (Provable (s $x))
         )
         (Conclusions
            (Provable (toSubmodule $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.mem_carrier_to_carrier_to_x)
      (Implication
         (Premises
            (Provable (carrier $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.mem_carrier_to_x_to_carrier)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (carrier $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.mem_toNonUnitalSubsemiring_to_toNonUnitalSubsemiring_to_x)
      (Implication
         (Premises
            (Provable (toNonUnitalSubsemiring $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.mem_toNonUnitalSubsemiring_to_x_to_toNonUnitalSubsemiring)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (toNonUnitalSubsemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.mem_toSubmodule_to_toSubmodule_to_x)
      (Implication
         (Premises
            (Provable (toSubmodule $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.mem_toSubmodule_to_x_to_toSubmodule)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (toSubmodule $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.mem_toNonUnitalSubring_to_toNonUnitalSubring_to_x)
      (Implication
         (Premises
            (Provable (toNonUnitalSubring $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.mem_toNonUnitalSubring_to_x_to_toNonUnitalSubring)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (toNonUnitalSubring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.toNonUnitalSubring_inj_to_toNonUnitalSubring_to_S)
      (Implication
         (Premises
            (Provable (toNonUnitalSubring $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.toNonUnitalSubring_inj_to_S_to_toNonUnitalSubring)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (toNonUnitalSubring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.map_le_to_map_to_S)
      (Implication
         (Premises
            (Provable (map $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.map_le_to_S_to_map)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (map $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.mem_comap_to_x_to_f)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSubalgebra.mem_comap_to_f_to_x)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Submodule.mem_toNonUnitalSubalgebra_to_toNonUnitalSubalgebra_to_x)
      (Implication
         (Premises
            (Provable (toNonUnitalSubalgebra $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Submodule.mem_toNonUnitalSubalgebra_to_x_to_toNonUnitalSubalgebra)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (toNonUnitalSubalgebra $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgebra.adjoin_le_iff_to_adjoin_to_s)
      (Implication
         (Premises
            (Provable (adjoin $x))
         )
         (Conclusions
            (Provable (s $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgebra.adjoin_le_iff_to_s_to_adjoin)
      (Implication
         (Premises
            (Provable (s $x))
         )
         (Conclusions
            (Provable (adjoin $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgebra.toNonUnitalSubsemiring_eq_top_to_toNonUnitalSubsemiring_to_S)
      (Implication
         (Premises
            (Provable (toNonUnitalSubsemiring $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgebra.toNonUnitalSubsemiring_eq_top_to_S_to_toNonUnitalSubsemiring)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (toNonUnitalSubsemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgebra.toSubmodule_eq_top_to_toSubmodule_to_S)
      (Implication
         (Premises
            (Provable (toSubmodule $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgebra.toSubmodule_eq_top_to_S_to_toSubmodule)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (toSubmodule $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgebra.toNonUnitalSubring_eq_top_to_toNonUnitalSubring_to_S)
      (Implication
         (Premises
            (Provable (toNonUnitalSubring $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgebra.toNonUnitalSubring_eq_top_to_S_to_toNonUnitalSubring)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (toNonUnitalSubring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgebra.to_subring_eq_top_to_toNonUnitalSubring_to_S)
      (Implication
         (Premises
            (Provable (toNonUnitalSubring $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgebra.to_subring_eq_top_to_S_to_toNonUnitalSubring)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (toNonUnitalSubring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgebra.range_eq_top_to_range_to_Surjective)
      (Implication
         (Premises
            (Provable (range $x))
         )
         (Conclusions
            (Provable (Surjective $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalAlgebra.range_eq_top_to_Surjective_to_range)
      (Implication
         (Premises
            (Provable (Surjective $x))
         )
         (Conclusions
            (Provable (range $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Submodule.mul_mem_smul_iff_to_x_to_y)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (y $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Submodule.mul_mem_smul_iff_to_y_to_x)
      (Implication
         (Premises
            (Provable (y $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse spectrum.mem_spectrum_iff_resolvent_zero_to_r_to_resolvent)
      (Implication
         (Premises
            (Provable (r $x))
         )
         (Conclusions
            (Provable (resolvent $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse spectrum.mem_spectrum_iff_resolvent_zero_to_resolvent_to_r)
      (Implication
         (Premises
            (Provable (resolvent $x))
         )
         (Conclusions
            (Provable (r $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse quasispectrumRestricts_iff_spectrumRestricts_to_QuasispectrumRestricts_to_SpectrumRestricts)
      (Implication
         (Premises
            (Provable (QuasispectrumRestricts $x))
         )
         (Conclusions
            (Provable (SpectrumRestricts $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse quasispectrumRestricts_iff_spectrumRestricts_to_SpectrumRestricts_to_QuasispectrumRestricts)
      (Implication
         (Premises
            (Provable (SpectrumRestricts $x))
         )
         (Conclusions
            (Provable (QuasispectrumRestricts $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra_extends_Subsemiring)
      (Implication
         (Premises
            (Provable (Subalgebra $x))
         )
         (Conclusions
            (Provable (Subsemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.mem_toSubsemiring_to_toSubsemiring_to_x)
      (Implication
         (Premises
            (Provable (toSubsemiring $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.mem_toSubsemiring_to_x_to_toSubsemiring)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (toSubsemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.mem_carrier_to_carrier_to_x)
      (Implication
         (Premises
            (Provable (carrier $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.mem_carrier_to_x_to_carrier)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (carrier $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.toSubsemiring_inj_to_toSubsemiring_to_S)
      (Implication
         (Premises
            (Provable (toSubsemiring $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.toSubsemiring_inj_to_S_to_toSubsemiring)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (toSubsemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.mem_toNonUnitalSubalgebra_to_toNonUnitalSubalgebra_to_x)
      (Implication
         (Premises
            (Provable (toNonUnitalSubalgebra $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.mem_toNonUnitalSubalgebra_to_x_to_toNonUnitalSubalgebra)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (toNonUnitalSubalgebra $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.toNonUnitalSubalgebra_inj_to_toNonUnitalSubalgebra_to_S)
      (Implication
         (Premises
            (Provable (toNonUnitalSubalgebra $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.toNonUnitalSubalgebra_inj_to_S_to_toNonUnitalSubalgebra)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (toNonUnitalSubalgebra $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.mem_toSubring_to_toSubring_to_x)
      (Implication
         (Premises
            (Provable (toSubring $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.mem_toSubring_to_x_to_toSubring)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (toSubring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.toSubring_inj_to_toSubring_to_S)
      (Implication
         (Premises
            (Provable (toSubring $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.toSubring_inj_to_S_to_toSubring)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (toSubring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.map_le_to_map_to_S)
      (Implication
         (Premises
            (Provable (map $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.map_le_to_S_to_map)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (map $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.mem_comap_to_x_to_f)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.mem_comap_to_f_to_x)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Submodule.mem_toSubalgebra_to_toSubalgebra_to_x)
      (Implication
         (Premises
            (Provable (toSubalgebra $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Submodule.mem_toSubalgebra_to_x_to_toSubalgebra)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (toSubalgebra $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgHom.rangeRestrict_to_A_to_range)
      (Implication
         (Premises
            (Provable (A $x))
         )
         (Conclusions
            (Provable (range $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgHom.le_equalizer_to_S_to_EqOn)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (EqOn $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgHom.le_equalizer_to_EqOn_to_S)
      (Implication
         (Premises
            (Provable (EqOn $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.le_centralizer_iff_to_S_to_T)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (T $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.le_centralizer_iff_to_T_to_S)
      (Implication
         (Premises
            (Provable (T $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Algebra.toSubmodule_eq_top_to_toSubmodule_to_S)
      (Implication
         (Premises
            (Provable (toSubmodule $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Algebra.toSubmodule_eq_top_to_S_to_toSubmodule)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (toSubmodule $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Algebra.toSubsemiring_eq_top_to_toSubsemiring_to_S)
      (Implication
         (Premises
            (Provable (toSubsemiring $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Algebra.toSubsemiring_eq_top_to_S_to_toSubsemiring)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (toSubsemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Algebra.toSubring_eq_top_to_toSubring_to_S)
      (Implication
         (Premises
            (Provable (toSubring $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Algebra.toSubring_eq_top_to_S_to_toSubring)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (toSubring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgHom.range_eq_top_to_range_to_Surjective)
      (Implication
         (Premises
            (Provable (range $x))
         )
         (Conclusions
            (Provable (Surjective $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgHom.range_eq_top_to_Surjective_to_range)
      (Implication
         (Premises
            (Provable (Surjective $x))
         )
         (Conclusions
            (Provable (range $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Algebra.adjoin_le_iff_to_adjoin_to_s)
      (Implication
         (Premises
            (Provable (adjoin $x))
         )
         (Conclusions
            (Provable (s $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Algebra.adjoin_le_iff_to_s_to_adjoin)
      (Implication
         (Premises
            (Provable (s $x))
         )
         (Conclusions
            (Provable (adjoin $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.toNonUnitalSubalgebra_le_toNonUnitalSubalgebra_to_toNonUnitalSubalgebra_to_S)
      (Implication
         (Premises
            (Provable (toNonUnitalSubalgebra $x))
         )
         (Conclusions
            (Provable (S $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.toNonUnitalSubalgebra_le_toNonUnitalSubalgebra_to_S_to_toNonUnitalSubalgebra)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (toNonUnitalSubalgebra $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.toNonUnitalSubalgebra_mono_to_S_to_toNonUnitalSubalgebra)
      (Implication
         (Premises
            (Provable (S $x))
         )
         (Conclusions
            (Provable (toNonUnitalSubalgebra $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.mem_op_to_op_to_unop)
      (Implication
         (Premises
            (Provable (op $x))
         )
         (Conclusions
            (Provable (unop $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.mem_op_to_unop_to_op)
      (Implication
         (Premises
            (Provable (unop $x))
         )
         (Conclusions
            (Provable (op $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.mem_unop_to_unop_to_op)
      (Implication
         (Premises
            (Provable (unop $x))
         )
         (Conclusions
            (Provable (op $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.mem_unop_to_op_to_unop)
      (Implication
         (Premises
            (Provable (op $x))
         )
         (Conclusions
            (Provable (unop $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.op_le_iff_to_op_to_unop)
      (Implication
         (Premises
            (Provable (op $x))
         )
         (Conclusions
            (Provable (unop $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.op_le_iff_to_unop_to_op)
      (Implication
         (Premises
            (Provable (unop $x))
         )
         (Conclusions
            (Provable (op $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.le_op_iff_to_op_to_unop)
      (Implication
         (Premises
            (Provable (op $x))
         )
         (Conclusions
            (Provable (unop $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.le_op_iff_to_unop_to_op)
      (Implication
         (Premises
            (Provable (unop $x))
         )
         (Conclusions
            (Provable (op $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Subalgebra.smul_mem_pointwise_smul_to_r_to_m)
      (Implication
         (Premises
            (Provable (r $x))
         )
         (Conclusions
            (Provable (m $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Algebra.lsmul_to_A_to_End)
      (Implication
         (Premises
            (Provable (A $x))
         )
         (Conclusions
            (Provable (End $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Unitization_extends_R)
      (Implication
         (Premises
            (Provable (Unitization $x))
         )
         (Conclusions
            (Provable (R $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Unitization.toProd_inj_iff_to_toProd_to_x)
      (Implication
         (Premises
            (Provable (toProd $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Unitization.toProd_inj_iff_to_x_to_toProd)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (toProd $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Unitization.inl_inj_to_inl_to_x)
      (Implication
         (Premises
            (Provable (inl $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Unitization.inl_inj_to_x_to_inl)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (inl $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgHom.mulLeftRight_to_TensorProduct_to_End)
      (Implication
         (Premises
            (Provable (TensorProduct $x))
         )
         (Conclusions
            (Provable (End $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse IsAzumaya_extends_Projective)
      (Implication
         (Premises
            (Provable (IsAzumaya $x))
         )
         (Conclusions
            (Provable (Projective $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse IsAzumaya_extends_FaithfulSMul)
      (Implication
         (Premises
            (Provable (IsAzumaya $x))
         )
         (Conclusions
            (Provable (FaithfulSMul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse IsAzumaya_extends_Finite)
      (Implication
         (Premises
            (Provable (IsAzumaya $x))
         )
         (Conclusions
            (Provable (Finite $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Associates.rel_associated_iff_map_eq_map_to_Rel_to_mk)
      (Implication
         (Premises
            (Provable (Rel $x))
         )
         (Conclusions
            (Provable (mk $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Associates.rel_associated_iff_map_eq_map_to_mk_to_Rel)
      (Implication
         (Premises
            (Provable (mk $x))
         )
         (Conclusions
            (Provable (Rel $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Finset.eq_of_card_le_one_of_prod_eq_to_x_to_f)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Finset.eq_of_card_le_one_of_sum_eq_to_x_to_f)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Finset.eq_one_of_prod_eq_one_to_x_to_f)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Finset.eq_zero_of_sum_eq_zero_to_x_to_f)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse List.alternatingSum_to_List_to_G)
      (Implication
         (Premises
            (Provable (List $x))
         )
         (Conclusions
            (Provable (G $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse List.alternatingProd_to_List_to_G)
      (Implication
         (Premises
            (Provable (List $x))
         )
         (Conclusions
            (Provable (G $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Multiset.dvd_prod_to_a_to_prod)
      (Implication
         (Premises
            (Provable (a $x))
         )
         (Conclusions
            (Provable (prod $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Multiset.prod_to_Multiset_to_M)
      (Implication
         (Premises
            (Provable (Multiset $x))
         )
         (Conclusions
            (Provable (M $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Multiset.sum_to_Multiset_to_M)
      (Implication
         (Premises
            (Provable (Multiset $x))
         )
         (Conclusions
            (Provable (M $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CSA_extends_AlgCat)
      (Implication
         (Premises
            (Provable (CSA $x))
         )
         (Conclusions
            (Provable (AlgCat $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgCat.hom_ext_iff_to_f_to_hom)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (hom $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AlgCat.hom_ext_iff_to_hom_to_f)
      (Implication
         (Premises
            (Provable (hom $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse BialgCat.hom_ext_iff_to_f_to_toBialgHom)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (toBialgHom $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse BialgCat.hom_ext_iff_to_toBialgHom_to_f)
      (Implication
         (Premises
            (Provable (toBialgHom $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse BoolRing.hom_ext_iff_to_f_to_hom)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (hom $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse BoolRing.hom_ext_iff_to_hom_to_f)
      (Implication
         (Premises
            (Provable (hom $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CoalgCat_extends_ModuleCat)
      (Implication
         (Premises
            (Provable (CoalgCat $x))
         )
         (Conclusions
            (Provable (ModuleCat $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CoalgCat.hom_ext_iff_to_f_to_toCoalgHom)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (toCoalgHom $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CoalgCat.hom_ext_iff_to_toCoalgHom_to_f)
      (Implication
         (Premises
            (Provable (toCoalgHom $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommAlgCat.hom_ext_iff_to_f_to_hom)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (hom $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommAlgCat.hom_ext_iff_to_hom_to_f)
      (Implication
         (Premises
            (Provable (hom $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommBialgCat.hom_ext_iff_to_f_to_hom)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (hom $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommBialgCat.hom_ext_iff_to_hom_to_f)
      (Implication
         (Premises
            (Provable (hom $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse ModuleCat.isFG_iff_to_isFG_to_Finite)
      (Implication
         (Premises
            (Provable (isFG $x))
         )
         (Conclusions
            (Provable (Finite $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse ModuleCat.isFG_iff_to_Finite_to_isFG)
      (Implication
         (Premises
            (Provable (Finite $x))
         )
         (Conclusions
            (Provable (isFG $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse FGModuleCat.hom_ext_iff_to_f_to_hom)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (hom $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse FGModuleCat.hom_ext_iff_to_hom_to_f)
      (Implication
         (Premises
            (Provable (hom $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommGrpCat.normalMono_to_Mono_to_NormalMono)
      (Implication
         (Premises
            (Provable (Mono $x))
         )
         (Conclusions
            (Provable (NormalMono $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommGrpCat.normalEpi_to_Epi_to_NormalEpi)
      (Implication
         (Premises
            (Provable (Epi $x))
         )
         (Conclusions
            (Provable (NormalEpi $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddGrpCat.hom_ext_iff_to_f_to_hom)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (hom $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddGrpCat.hom_ext_iff_to_hom_to_f)
      (Implication
         (Premises
            (Provable (hom $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse GrpCat.hom_ext_iff_to_f_to_hom)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (hom $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse GrpCat.hom_ext_iff_to_hom_to_f)
      (Implication
         (Premises
            (Provable (hom $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommGrpCat.hom_ext_iff_to_f_to_hom)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (hom $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommGrpCat.hom_ext_iff_to_hom_to_f)
      (Implication
         (Premises
            (Provable (hom $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommGrpCat.hom_ext_iff_to_f_to_hom)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (hom $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommGrpCat.hom_ext_iff_to_hom_to_f)
      (Implication
         (Premises
            (Provable (hom $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommGrpCat.Colimits.Quot.desc_to_Quot_to_pt)
      (Implication
         (Premises
            (Provable (Quot $x))
         )
         (Conclusions
            (Provable (pt $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommGrpCat.prop_isFinite_iff_to_isFinite_to_Finite)
      (Implication
         (Premises
            (Provable (isFinite $x))
         )
         (Conclusions
            (Provable (Finite $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommGrpCat.prop_isFinite_iff_to_Finite_to_isFinite)
      (Implication
         (Premises
            (Provable (Finite $x))
         )
         (Conclusions
            (Provable (isFinite $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse GrpCat.isZero_iff_subsingleton_to_IsZero_to_Subsingleton)
      (Implication
         (Premises
            (Provable (IsZero $x))
         )
         (Conclusions
            (Provable (Subsingleton $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse GrpCat.isZero_iff_subsingleton_to_Subsingleton_to_IsZero)
      (Implication
         (Premises
            (Provable (Subsingleton $x))
         )
         (Conclusions
            (Provable (IsZero $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddGrpCat.isZero_iff_subsingleton_to_IsZero_to_Subsingleton)
      (Implication
         (Premises
            (Provable (IsZero $x))
         )
         (Conclusions
            (Provable (Subsingleton $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddGrpCat.isZero_iff_subsingleton_to_Subsingleton_to_IsZero)
      (Implication
         (Premises
            (Provable (Subsingleton $x))
         )
         (Conclusions
            (Provable (IsZero $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommGrpCat.isZero_iff_subsingleton_to_IsZero_to_Subsingleton)
      (Implication
         (Premises
            (Provable (IsZero $x))
         )
         (Conclusions
            (Provable (Subsingleton $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommGrpCat.isZero_iff_subsingleton_to_Subsingleton_to_IsZero)
      (Implication
         (Premises
            (Provable (Subsingleton $x))
         )
         (Conclusions
            (Provable (IsZero $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommGrpCat.isZero_iff_subsingleton_to_IsZero_to_Subsingleton)
      (Implication
         (Premises
            (Provable (IsZero $x))
         )
         (Conclusions
            (Provable (Subsingleton $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommGrpCat.isZero_iff_subsingleton_to_Subsingleton_to_IsZero)
      (Implication
         (Premises
            (Provable (Subsingleton $x))
         )
         (Conclusions
            (Provable (IsZero $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse HopfAlgCat.hom_ext_iff_to_f_to_toBialgHom)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (toBialgHom $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse HopfAlgCat.hom_ext_iff_to_toBialgHom_to_f)
      (Implication
         (Premises
            (Provable (toBialgHom $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse ModuleCat.hom_ext_iff_to_f_to_hom)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (hom $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse ModuleCat.hom_ext_iff_to_hom_to_f)
      (Implication
         (Premises
            (Provable (hom $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse ModuleCat.isZero_iff_subsingleton_to_IsZero_to_Subsingleton)
      (Implication
         (Premises
            (Provable (IsZero $x))
         )
         (Conclusions
            (Provable (Subsingleton $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse ModuleCat.isZero_iff_subsingleton_to_Subsingleton_to_IsZero)
      (Implication
         (Premises
            (Provable (Subsingleton $x))
         )
         (Conclusions
            (Provable (IsZero $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse ModuleCat.exteriorPower.hom_ext_iff_to_f_to_postcomp)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (postcomp $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse ModuleCat.exteriorPower.hom_ext_iff_to_postcomp_to_f)
      (Implication
         (Premises
            (Provable (postcomp $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse PresheafOfModules.Hom.ext_iff_to_x_to_app)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (app $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse PresheafOfModules.Hom.ext_iff_to_app_to_x)
      (Implication
         (Premises
            (Provable (app $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SemimoduleCat.hom_ext_iff_to_f_to_hom)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (hom $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SemimoduleCat.hom_ext_iff_to_hom_to_f)
      (Implication
         (Premises
            (Provable (hom $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SemimoduleCat.isZero_iff_subsingleton_to_IsZero_to_Subsingleton)
      (Implication
         (Premises
            (Provable (IsZero $x))
         )
         (Conclusions
            (Provable (Subsingleton $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SemimoduleCat.isZero_iff_subsingleton_to_Subsingleton_to_IsZero)
      (Implication
         (Premises
            (Provable (Subsingleton $x))
         )
         (Conclusions
            (Provable (IsZero $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SheafOfModules.Hom.ext_iff_to_x_to_val)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (val $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SheafOfModules.Hom.ext_iff_to_val_to_x)
      (Implication
         (Premises
            (Provable (val $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SheafOfModules.hom_ext_iff_to_f_to_val)
      (Implication
         (Premises
            (Provable (f $x))
         )
         (Conclusions
            (Provable (val $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SheafOfModules.hom_ext_iff_to_val_to_f)
      (Implication
         (Premises
            (Provable (val $x))
         )
         (Conclusions
            (Provable (f $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivisionSemiring_extends_Semiring)
      (Implication
         (Premises
            (Provable (DivisionSemiring $x))
         )
         (Conclusions
            (Provable (Semiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivisionSemiring_extends_GroupWithZero)
      (Implication
         (Premises
            (Provable (DivisionSemiring $x))
         )
         (Conclusions
            (Provable (GroupWithZero $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivisionSemiring_extends_NNRatCast)
      (Implication
         (Premises
            (Provable (DivisionSemiring $x))
         )
         (Conclusions
            (Provable (NNRatCast $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivisionRing_extends_Ring)
      (Implication
         (Premises
            (Provable (DivisionRing $x))
         )
         (Conclusions
            (Provable (Ring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivisionRing_extends_DivInvMonoid)
      (Implication
         (Premises
            (Provable (DivisionRing $x))
         )
         (Conclusions
            (Provable (DivInvMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivisionRing_extends_Nontrivial)
      (Implication
         (Premises
            (Provable (DivisionRing $x))
         )
         (Conclusions
            (Provable (Nontrivial $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivisionRing_extends_NNRatCast)
      (Implication
         (Premises
            (Provable (DivisionRing $x))
         )
         (Conclusions
            (Provable (NNRatCast $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivisionRing_extends_RatCast)
      (Implication
         (Premises
            (Provable (DivisionRing $x))
         )
         (Conclusions
            (Provable (RatCast $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Semifield_extends_CommSemiring)
      (Implication
         (Premises
            (Provable (Semifield $x))
         )
         (Conclusions
            (Provable (CommSemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Semifield_extends_DivisionSemiring)
      (Implication
         (Premises
            (Provable (Semifield $x))
         )
         (Conclusions
            (Provable (DivisionSemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Semifield_extends_CommGroupWithZero)
      (Implication
         (Premises
            (Provable (Semifield $x))
         )
         (Conclusions
            (Provable (CommGroupWithZero $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Field_extends_CommRing)
      (Implication
         (Premises
            (Provable (Field $x))
         )
         (Conclusions
            (Provable (CommRing $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Field_extends_DivisionRing)
      (Implication
         (Premises
            (Provable (Field $x))
         )
         (Conclusions
            (Provable (DivisionRing $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse IsCancelMul_extends_IsLeftCancelMul)
      (Implication
         (Premises
            (Provable (IsCancelMul $x))
         )
         (Conclusions
            (Provable (IsLeftCancelMul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse IsCancelMul_extends_IsRightCancelMul)
      (Implication
         (Premises
            (Provable (IsCancelMul $x))
         )
         (Conclusions
            (Provable (IsRightCancelMul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse isCancelMul_iff_to_IsCancelMul_to_IsLeftCancelMul)
      (Implication
         (Premises
            (Provable (IsCancelMul $x))
         )
         (Conclusions
            (Provable (IsLeftCancelMul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse isCancelMul_iff_to_IsLeftCancelMul_to_IsCancelMul)
      (Implication
         (Premises
            (Provable (IsLeftCancelMul $x))
         )
         (Conclusions
            (Provable (IsCancelMul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse IsCancelAdd_extends_IsLeftCancelAdd)
      (Implication
         (Premises
            (Provable (IsCancelAdd $x))
         )
         (Conclusions
            (Provable (IsLeftCancelAdd $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse IsCancelAdd_extends_IsRightCancelAdd)
      (Implication
         (Premises
            (Provable (IsCancelAdd $x))
         )
         (Conclusions
            (Provable (IsRightCancelAdd $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse isCancelAdd_iff_to_IsCancelAdd_to_IsLeftCancelAdd)
      (Implication
         (Premises
            (Provable (IsCancelAdd $x))
         )
         (Conclusions
            (Provable (IsLeftCancelAdd $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse isCancelAdd_iff_to_IsLeftCancelAdd_to_IsCancelAdd)
      (Implication
         (Premises
            (Provable (IsLeftCancelAdd $x))
         )
         (Conclusions
            (Provable (IsCancelAdd $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse mul_left_cancel_to_a_to_b)
      (Implication
         (Premises
            (Provable (a $x))
         )
         (Conclusions
            (Provable (b $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse add_left_cancel_to_a_to_b)
      (Implication
         (Premises
            (Provable (a $x))
         )
         (Conclusions
            (Provable (b $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse mul_left_cancel_iff_to_a_to_b)
      (Implication
         (Premises
            (Provable (a $x))
         )
         (Conclusions
            (Provable (b $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse mul_left_cancel_iff_to_b_to_a)
      (Implication
         (Premises
            (Provable (b $x))
         )
         (Conclusions
            (Provable (a $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse add_left_cancel_iff_to_a_to_b)
      (Implication
         (Premises
            (Provable (a $x))
         )
         (Conclusions
            (Provable (b $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse add_left_cancel_iff_to_b_to_a)
      (Implication
         (Premises
            (Provable (b $x))
         )
         (Conclusions
            (Provable (a $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse mul_right_inj_to_a_to_b)
      (Implication
         (Premises
            (Provable (a $x))
         )
         (Conclusions
            (Provable (b $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse mul_right_inj_to_b_to_a)
      (Implication
         (Premises
            (Provable (b $x))
         )
         (Conclusions
            (Provable (a $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse add_right_inj_to_a_to_b)
      (Implication
         (Premises
            (Provable (a $x))
         )
         (Conclusions
            (Provable (b $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse add_right_inj_to_b_to_a)
      (Implication
         (Premises
            (Provable (b $x))
         )
         (Conclusions
            (Provable (a $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse mul_ne_mul_right_to_a_to_b)
      (Implication
         (Premises
            (Provable (a $x))
         )
         (Conclusions
            (Provable (b $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse mul_ne_mul_right_to_b_to_a)
      (Implication
         (Premises
            (Provable (b $x))
         )
         (Conclusions
            (Provable (a $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse add_ne_add_right_to_a_to_b)
      (Implication
         (Premises
            (Provable (a $x))
         )
         (Conclusions
            (Provable (b $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse add_ne_add_right_to_b_to_a)
      (Implication
         (Premises
            (Provable (b $x))
         )
         (Conclusions
            (Provable (a $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Semigroup_extends_Mul)
      (Implication
         (Premises
            (Provable (Semigroup $x))
         )
         (Conclusions
            (Provable (Mul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Semigroup.ext_iff_to_x_to_mul)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (mul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Semigroup.ext_iff_to_mul_to_x)
      (Implication
         (Premises
            (Provable (mul $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddSemigroup_extends_Add)
      (Implication
         (Premises
            (Provable (AddSemigroup $x))
         )
         (Conclusions
            (Provable (Add $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddSemigroup.ext_iff_to_x_to_add)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (add $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddSemigroup.ext_iff_to_add_to_x)
      (Implication
         (Premises
            (Provable (add $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommMagma_extends_Add)
      (Implication
         (Premises
            (Provable (AddCommMagma $x))
         )
         (Conclusions
            (Provable (Add $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommMagma.ext_iff_to_x_to_add)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (add $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommMagma.ext_iff_to_add_to_x)
      (Implication
         (Premises
            (Provable (add $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommMagma_extends_Mul)
      (Implication
         (Premises
            (Provable (CommMagma $x))
         )
         (Conclusions
            (Provable (Mul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommMagma.ext_iff_to_x_to_mul)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (mul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommMagma.ext_iff_to_mul_to_x)
      (Implication
         (Premises
            (Provable (mul $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommSemigroup_extends_Semigroup)
      (Implication
         (Premises
            (Provable (CommSemigroup $x))
         )
         (Conclusions
            (Provable (Semigroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommSemigroup_extends_CommMagma)
      (Implication
         (Premises
            (Provable (CommSemigroup $x))
         )
         (Conclusions
            (Provable (CommMagma $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommSemigroup.ext_iff_to_x_to_mul)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (mul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommSemigroup.ext_iff_to_mul_to_x)
      (Implication
         (Premises
            (Provable (mul $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommSemigroup_extends_AddSemigroup)
      (Implication
         (Premises
            (Provable (AddCommSemigroup $x))
         )
         (Conclusions
            (Provable (AddSemigroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommSemigroup_extends_AddCommMagma)
      (Implication
         (Premises
            (Provable (AddCommSemigroup $x))
         )
         (Conclusions
            (Provable (AddCommMagma $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommSemigroup.ext_iff_to_x_to_add)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (add $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommSemigroup.ext_iff_to_add_to_x)
      (Implication
         (Premises
            (Provable (add $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse isLeftRegular_iff_isRegular_to_IsLeftRegular_to_IsRegular)
      (Implication
         (Premises
            (Provable (IsLeftRegular $x))
         )
         (Conclusions
            (Provable (IsRegular $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse isLeftRegular_iff_isRegular_to_IsRegular_to_IsLeftRegular)
      (Implication
         (Premises
            (Provable (IsRegular $x))
         )
         (Conclusions
            (Provable (IsLeftRegular $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse isAddLeftRegular_iff_isAddRegular_to_IsAddLeftRegular_to_IsAddRegular)
      (Implication
         (Premises
            (Provable (IsAddLeftRegular $x))
         )
         (Conclusions
            (Provable (IsAddRegular $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse isAddLeftRegular_iff_isAddRegular_to_IsAddRegular_to_IsAddLeftRegular)
      (Implication
         (Premises
            (Provable (IsAddRegular $x))
         )
         (Conclusions
            (Provable (IsAddLeftRegular $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse isRightRegular_iff_isRegular_to_IsRightRegular_to_IsRegular)
      (Implication
         (Premises
            (Provable (IsRightRegular $x))
         )
         (Conclusions
            (Provable (IsRegular $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse isRightRegular_iff_isRegular_to_IsRegular_to_IsRightRegular)
      (Implication
         (Premises
            (Provable (IsRegular $x))
         )
         (Conclusions
            (Provable (IsRightRegular $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse isAddRightRegular_iff_isAddRegular_to_IsAddRightRegular_to_IsAddRegular)
      (Implication
         (Premises
            (Provable (IsAddRightRegular $x))
         )
         (Conclusions
            (Provable (IsAddRegular $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse isAddRightRegular_iff_isAddRegular_to_IsAddRegular_to_IsAddRightRegular)
      (Implication
         (Premises
            (Provable (IsAddRegular $x))
         )
         (Conclusions
            (Provable (IsAddRightRegular $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse LeftCancelSemigroup_extends_Semigroup)
      (Implication
         (Premises
            (Provable (LeftCancelSemigroup $x))
         )
         (Conclusions
            (Provable (Semigroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse LeftCancelSemigroup_extends_IsLeftCancelMul)
      (Implication
         (Premises
            (Provable (LeftCancelSemigroup $x))
         )
         (Conclusions
            (Provable (IsLeftCancelMul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse LeftCancelSemigroup.ext_iff_to_x_to_mul)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (mul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse LeftCancelSemigroup.ext_iff_to_mul_to_x)
      (Implication
         (Premises
            (Provable (mul $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddLeftCancelSemigroup_extends_AddSemigroup)
      (Implication
         (Premises
            (Provable (AddLeftCancelSemigroup $x))
         )
         (Conclusions
            (Provable (AddSemigroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddLeftCancelSemigroup_extends_IsLeftCancelAdd)
      (Implication
         (Premises
            (Provable (AddLeftCancelSemigroup $x))
         )
         (Conclusions
            (Provable (IsLeftCancelAdd $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddLeftCancelSemigroup.ext_iff_to_x_to_add)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (add $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddLeftCancelSemigroup.ext_iff_to_add_to_x)
      (Implication
         (Premises
            (Provable (add $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse RightCancelSemigroup_extends_Semigroup)
      (Implication
         (Premises
            (Provable (RightCancelSemigroup $x))
         )
         (Conclusions
            (Provable (Semigroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse RightCancelSemigroup_extends_IsRightCancelMul)
      (Implication
         (Premises
            (Provable (RightCancelSemigroup $x))
         )
         (Conclusions
            (Provable (IsRightCancelMul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse RightCancelSemigroup.ext_iff_to_x_to_mul)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (mul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse RightCancelSemigroup.ext_iff_to_mul_to_x)
      (Implication
         (Premises
            (Provable (mul $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddRightCancelSemigroup_extends_AddSemigroup)
      (Implication
         (Premises
            (Provable (AddRightCancelSemigroup $x))
         )
         (Conclusions
            (Provable (AddSemigroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddRightCancelSemigroup_extends_IsRightCancelAdd)
      (Implication
         (Premises
            (Provable (AddRightCancelSemigroup $x))
         )
         (Conclusions
            (Provable (IsRightCancelAdd $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddRightCancelSemigroup.ext_iff_to_x_to_add)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (add $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddRightCancelSemigroup.ext_iff_to_add_to_x)
      (Implication
         (Premises
            (Provable (add $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddZero_extends_Zero)
      (Implication
         (Premises
            (Provable (AddZero $x))
         )
         (Conclusions
            (Provable (Zero $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddZero_extends_Add)
      (Implication
         (Premises
            (Provable (AddZero $x))
         )
         (Conclusions
            (Provable (Add $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse MulOne_extends_One)
      (Implication
         (Premises
            (Provable (MulOne $x))
         )
         (Conclusions
            (Provable (One $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse MulOne_extends_Mul)
      (Implication
         (Premises
            (Provable (MulOne $x))
         )
         (Conclusions
            (Provable (Mul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddZero.ext_iff_to_x_to_add)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (add $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddZero.ext_iff_to_add_to_x)
      (Implication
         (Premises
            (Provable (add $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse MulOne.ext_iff_to_x_to_mul)
      (Implication
         (Premises
            (Provable (x $x))
         )
         (Conclusions
            (Provable (mul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse MulOne.ext_iff_to_mul_to_x)
      (Implication
         (Premises
            (Provable (mul $x))
         )
         (Conclusions
            (Provable (x $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse mul_eq_one_comm_to_a_to_b)
      (Implication
         (Premises
            (Provable (a $x))
         )
         (Conclusions
            (Provable (b $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse mul_eq_one_comm_to_b_to_a)
      (Implication
         (Premises
            (Provable (b $x))
         )
         (Conclusions
            (Provable (a $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse add_eq_zero_comm_to_a_to_b)
      (Implication
         (Premises
            (Provable (a $x))
         )
         (Conclusions
            (Provable (b $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse add_eq_zero_comm_to_b_to_a)
      (Implication
         (Premises
            (Provable (b $x))
         )
         (Conclusions
            (Provable (a $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddZeroClass_extends_AddZero)
      (Implication
         (Premises
            (Provable (AddZeroClass $x))
         )
         (Conclusions
            (Provable (AddZero $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse MulOneClass_extends_MulOne)
      (Implication
         (Premises
            (Provable (MulOneClass $x))
         )
         (Conclusions
            (Provable (MulOne $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddMonoid_extends_AddSemigroup)
      (Implication
         (Premises
            (Provable (AddMonoid $x))
         )
         (Conclusions
            (Provable (AddSemigroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddMonoid_extends_AddZeroClass)
      (Implication
         (Premises
            (Provable (AddMonoid $x))
         )
         (Conclusions
            (Provable (AddZeroClass $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Monoid_extends_Semigroup)
      (Implication
         (Premises
            (Provable (Monoid $x))
         )
         (Conclusions
            (Provable (Semigroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Monoid_extends_MulOneClass)
      (Implication
         (Premises
            (Provable (Monoid $x))
         )
         (Conclusions
            (Provable (MulOneClass $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommMonoid_extends_AddMonoid)
      (Implication
         (Premises
            (Provable (AddCommMonoid $x))
         )
         (Conclusions
            (Provable (AddMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommMonoid_extends_AddCommSemigroup)
      (Implication
         (Premises
            (Provable (AddCommMonoid $x))
         )
         (Conclusions
            (Provable (AddCommSemigroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommMonoid_extends_Monoid)
      (Implication
         (Premises
            (Provable (CommMonoid $x))
         )
         (Conclusions
            (Provable (Monoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommMonoid_extends_CommSemigroup)
      (Implication
         (Premises
            (Provable (CommMonoid $x))
         )
         (Conclusions
            (Provable (CommSemigroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddLeftCancelMonoid_extends_AddMonoid)
      (Implication
         (Premises
            (Provable (AddLeftCancelMonoid $x))
         )
         (Conclusions
            (Provable (AddMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddLeftCancelMonoid_extends_AddLeftCancelSemigroup)
      (Implication
         (Premises
            (Provable (AddLeftCancelMonoid $x))
         )
         (Conclusions
            (Provable (AddLeftCancelSemigroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse LeftCancelMonoid_extends_Monoid)
      (Implication
         (Premises
            (Provable (LeftCancelMonoid $x))
         )
         (Conclusions
            (Provable (Monoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse LeftCancelMonoid_extends_LeftCancelSemigroup)
      (Implication
         (Premises
            (Provable (LeftCancelMonoid $x))
         )
         (Conclusions
            (Provable (LeftCancelSemigroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddRightCancelMonoid_extends_AddMonoid)
      (Implication
         (Premises
            (Provable (AddRightCancelMonoid $x))
         )
         (Conclusions
            (Provable (AddMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddRightCancelMonoid_extends_AddRightCancelSemigroup)
      (Implication
         (Premises
            (Provable (AddRightCancelMonoid $x))
         )
         (Conclusions
            (Provable (AddRightCancelSemigroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse RightCancelMonoid_extends_Monoid)
      (Implication
         (Premises
            (Provable (RightCancelMonoid $x))
         )
         (Conclusions
            (Provable (Monoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse RightCancelMonoid_extends_RightCancelSemigroup)
      (Implication
         (Premises
            (Provable (RightCancelMonoid $x))
         )
         (Conclusions
            (Provable (RightCancelSemigroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCancelMonoid_extends_AddLeftCancelMonoid)
      (Implication
         (Premises
            (Provable (AddCancelMonoid $x))
         )
         (Conclusions
            (Provable (AddLeftCancelMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCancelMonoid_extends_AddRightCancelMonoid)
      (Implication
         (Premises
            (Provable (AddCancelMonoid $x))
         )
         (Conclusions
            (Provable (AddRightCancelMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CancelMonoid_extends_LeftCancelMonoid)
      (Implication
         (Premises
            (Provable (CancelMonoid $x))
         )
         (Conclusions
            (Provable (LeftCancelMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CancelMonoid_extends_RightCancelMonoid)
      (Implication
         (Premises
            (Provable (CancelMonoid $x))
         )
         (Conclusions
            (Provable (RightCancelMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCancelCommMonoid_extends_AddCommMonoid)
      (Implication
         (Premises
            (Provable (AddCancelCommMonoid $x))
         )
         (Conclusions
            (Provable (AddCommMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCancelCommMonoid_extends_AddLeftCancelMonoid)
      (Implication
         (Premises
            (Provable (AddCancelCommMonoid $x))
         )
         (Conclusions
            (Provable (AddLeftCancelMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CancelCommMonoid_extends_CommMonoid)
      (Implication
         (Premises
            (Provable (CancelCommMonoid $x))
         )
         (Conclusions
            (Provable (CommMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CancelCommMonoid_extends_LeftCancelMonoid)
      (Implication
         (Premises
            (Provable (CancelCommMonoid $x))
         )
         (Conclusions
            (Provable (LeftCancelMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse InvolutiveNeg_extends_Neg)
      (Implication
         (Premises
            (Provable (InvolutiveNeg $x))
         )
         (Conclusions
            (Provable (Neg $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse InvolutiveInv_extends_Inv)
      (Implication
         (Premises
            (Provable (InvolutiveInv $x))
         )
         (Conclusions
            (Provable (Inv $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivInvMonoid_extends_Monoid)
      (Implication
         (Premises
            (Provable (DivInvMonoid $x))
         )
         (Conclusions
            (Provable (Monoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivInvMonoid_extends_Inv)
      (Implication
         (Premises
            (Provable (DivInvMonoid $x))
         )
         (Conclusions
            (Provable (Inv $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivInvMonoid_extends_Div)
      (Implication
         (Premises
            (Provable (DivInvMonoid $x))
         )
         (Conclusions
            (Provable (Div $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SubNegMonoid_extends_AddMonoid)
      (Implication
         (Premises
            (Provable (SubNegMonoid $x))
         )
         (Conclusions
            (Provable (AddMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SubNegMonoid_extends_Neg)
      (Implication
         (Premises
            (Provable (SubNegMonoid $x))
         )
         (Conclusions
            (Provable (Neg $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SubNegMonoid_extends_Sub)
      (Implication
         (Premises
            (Provable (SubNegMonoid $x))
         )
         (Conclusions
            (Provable (Sub $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NegZeroClass_extends_Zero)
      (Implication
         (Premises
            (Provable (NegZeroClass $x))
         )
         (Conclusions
            (Provable (Zero $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NegZeroClass_extends_Neg)
      (Implication
         (Premises
            (Provable (NegZeroClass $x))
         )
         (Conclusions
            (Provable (Neg $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SubNegZeroMonoid_extends_SubNegMonoid)
      (Implication
         (Premises
            (Provable (SubNegZeroMonoid $x))
         )
         (Conclusions
            (Provable (SubNegMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SubNegZeroMonoid_extends_NegZeroClass)
      (Implication
         (Premises
            (Provable (SubNegZeroMonoid $x))
         )
         (Conclusions
            (Provable (NegZeroClass $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse InvOneClass_extends_One)
      (Implication
         (Premises
            (Provable (InvOneClass $x))
         )
         (Conclusions
            (Provable (One $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse InvOneClass_extends_Inv)
      (Implication
         (Premises
            (Provable (InvOneClass $x))
         )
         (Conclusions
            (Provable (Inv $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivInvOneMonoid_extends_DivInvMonoid)
      (Implication
         (Premises
            (Provable (DivInvOneMonoid $x))
         )
         (Conclusions
            (Provable (DivInvMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivInvOneMonoid_extends_InvOneClass)
      (Implication
         (Premises
            (Provable (DivInvOneMonoid $x))
         )
         (Conclusions
            (Provable (InvOneClass $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SubtractionMonoid_extends_SubNegMonoid)
      (Implication
         (Premises
            (Provable (SubtractionMonoid $x))
         )
         (Conclusions
            (Provable (SubNegMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SubtractionMonoid_extends_InvolutiveNeg)
      (Implication
         (Premises
            (Provable (SubtractionMonoid $x))
         )
         (Conclusions
            (Provable (InvolutiveNeg $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivisionMonoid_extends_DivInvMonoid)
      (Implication
         (Premises
            (Provable (DivisionMonoid $x))
         )
         (Conclusions
            (Provable (DivInvMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivisionMonoid_extends_InvolutiveInv)
      (Implication
         (Premises
            (Provable (DivisionMonoid $x))
         )
         (Conclusions
            (Provable (InvolutiveInv $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SubtractionCommMonoid_extends_SubtractionMonoid)
      (Implication
         (Premises
            (Provable (SubtractionCommMonoid $x))
         )
         (Conclusions
            (Provable (SubtractionMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse SubtractionCommMonoid_extends_AddCommMonoid)
      (Implication
         (Premises
            (Provable (SubtractionCommMonoid $x))
         )
         (Conclusions
            (Provable (AddCommMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivisionCommMonoid_extends_DivisionMonoid)
      (Implication
         (Premises
            (Provable (DivisionCommMonoid $x))
         )
         (Conclusions
            (Provable (DivisionMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse DivisionCommMonoid_extends_CommMonoid)
      (Implication
         (Premises
            (Provable (DivisionCommMonoid $x))
         )
         (Conclusions
            (Provable (CommMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Group_extends_DivInvMonoid)
      (Implication
         (Premises
            (Provable (Group $x))
         )
         (Conclusions
            (Provable (DivInvMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddGroup_extends_SubNegMonoid)
      (Implication
         (Premises
            (Provable (AddGroup $x))
         )
         (Conclusions
            (Provable (SubNegMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommGroup_extends_AddGroup)
      (Implication
         (Premises
            (Provable (AddCommGroup $x))
         )
         (Conclusions
            (Provable (AddGroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse AddCommGroup_extends_AddCommMonoid)
      (Implication
         (Premises
            (Provable (AddCommGroup $x))
         )
         (Conclusions
            (Provable (AddCommMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommGroup_extends_Group)
      (Implication
         (Premises
            (Provable (CommGroup $x))
         )
         (Conclusions
            (Provable (Group $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommGroup_extends_CommMonoid)
      (Implication
         (Premises
            (Provable (CommGroup $x))
         )
         (Conclusions
            (Provable (CommMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Distrib_extends_Mul)
      (Implication
         (Premises
            (Provable (Distrib $x))
         )
         (Conclusions
            (Provable (Mul $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Distrib_extends_Add)
      (Implication
         (Premises
            (Provable (Distrib $x))
         )
         (Conclusions
            (Provable (Add $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalNonAssocSemiring_extends_AddCommMonoid)
      (Implication
         (Premises
            (Provable (NonUnitalNonAssocSemiring $x))
         )
         (Conclusions
            (Provable (AddCommMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalNonAssocSemiring_extends_Distrib)
      (Implication
         (Premises
            (Provable (NonUnitalNonAssocSemiring $x))
         )
         (Conclusions
            (Provable (Distrib $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalNonAssocSemiring_extends_MulZeroClass)
      (Implication
         (Premises
            (Provable (NonUnitalNonAssocSemiring $x))
         )
         (Conclusions
            (Provable (MulZeroClass $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSemiring_extends_NonUnitalNonAssocSemiring)
      (Implication
         (Premises
            (Provable (NonUnitalSemiring $x))
         )
         (Conclusions
            (Provable (NonUnitalNonAssocSemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalSemiring_extends_SemigroupWithZero)
      (Implication
         (Premises
            (Provable (NonUnitalSemiring $x))
         )
         (Conclusions
            (Provable (SemigroupWithZero $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonAssocSemiring_extends_NonUnitalNonAssocSemiring)
      (Implication
         (Premises
            (Provable (NonAssocSemiring $x))
         )
         (Conclusions
            (Provable (NonUnitalNonAssocSemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonAssocSemiring_extends_MulZeroOneClass)
      (Implication
         (Premises
            (Provable (NonAssocSemiring $x))
         )
         (Conclusions
            (Provable (MulZeroOneClass $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonAssocSemiring_extends_AddCommMonoidWithOne)
      (Implication
         (Premises
            (Provable (NonAssocSemiring $x))
         )
         (Conclusions
            (Provable (AddCommMonoidWithOne $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalNonAssocRing_extends_AddCommGroup)
      (Implication
         (Premises
            (Provable (NonUnitalNonAssocRing $x))
         )
         (Conclusions
            (Provable (AddCommGroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalNonAssocRing_extends_NonUnitalNonAssocSemiring)
      (Implication
         (Premises
            (Provable (NonUnitalNonAssocRing $x))
         )
         (Conclusions
            (Provable (NonUnitalNonAssocSemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalRing_extends_NonUnitalNonAssocRing)
      (Implication
         (Premises
            (Provable (NonUnitalRing $x))
         )
         (Conclusions
            (Provable (NonUnitalNonAssocRing $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalRing_extends_NonUnitalSemiring)
      (Implication
         (Premises
            (Provable (NonUnitalRing $x))
         )
         (Conclusions
            (Provable (NonUnitalSemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonAssocRing_extends_NonUnitalNonAssocRing)
      (Implication
         (Premises
            (Provable (NonAssocRing $x))
         )
         (Conclusions
            (Provable (NonUnitalNonAssocRing $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonAssocRing_extends_NonAssocSemiring)
      (Implication
         (Premises
            (Provable (NonAssocRing $x))
         )
         (Conclusions
            (Provable (NonAssocSemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonAssocRing_extends_AddCommGroupWithOne)
      (Implication
         (Premises
            (Provable (NonAssocRing $x))
         )
         (Conclusions
            (Provable (AddCommGroupWithOne $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Semiring_extends_AddCommMonoid)
      (Implication
         (Premises
            (Provable (Semiring $x))
         )
         (Conclusions
            (Provable (AddCommMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Semiring_extends_MonoidWithZero)
      (Implication
         (Premises
            (Provable (Semiring $x))
         )
         (Conclusions
            (Provable (MonoidWithZero $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Semiring_extends_NonUnitalSemiring)
      (Implication
         (Premises
            (Provable (Semiring $x))
         )
         (Conclusions
            (Provable (NonUnitalSemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Semiring_extends_NonAssocSemiring)
      (Implication
         (Premises
            (Provable (Semiring $x))
         )
         (Conclusions
            (Provable (NonAssocSemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Ring_extends_Semiring)
      (Implication
         (Premises
            (Provable (Ring $x))
         )
         (Conclusions
            (Provable (Semiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Ring_extends_AddCommGroup)
      (Implication
         (Premises
            (Provable (Ring $x))
         )
         (Conclusions
            (Provable (AddCommGroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse Ring_extends_AddGroupWithOne)
      (Implication
         (Premises
            (Provable (Ring $x))
         )
         (Conclusions
            (Provable (AddGroupWithOne $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalNonAssocCommSemiring_extends_NonUnitalNonAssocSemiring)
      (Implication
         (Premises
            (Provable (NonUnitalNonAssocCommSemiring $x))
         )
         (Conclusions
            (Provable (NonUnitalNonAssocSemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalNonAssocCommSemiring_extends_CommMagma)
      (Implication
         (Premises
            (Provable (NonUnitalNonAssocCommSemiring $x))
         )
         (Conclusions
            (Provable (CommMagma $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalCommSemiring_extends_NonUnitalSemiring)
      (Implication
         (Premises
            (Provable (NonUnitalCommSemiring $x))
         )
         (Conclusions
            (Provable (NonUnitalSemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalCommSemiring_extends_CommSemigroup)
      (Implication
         (Premises
            (Provable (NonUnitalCommSemiring $x))
         )
         (Conclusions
            (Provable (CommSemigroup $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonAssocCommSemiring_extends_NonAssocSemiring)
      (Implication
         (Premises
            (Provable (NonAssocCommSemiring $x))
         )
         (Conclusions
            (Provable (NonAssocSemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonAssocCommSemiring_extends_NonUnitalNonAssocCommSemiring)
      (Implication
         (Premises
            (Provable (NonAssocCommSemiring $x))
         )
         (Conclusions
            (Provable (NonUnitalNonAssocCommSemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommSemiring_extends_Semiring)
      (Implication
         (Premises
            (Provable (CommSemiring $x))
         )
         (Conclusions
            (Provable (Semiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommSemiring_extends_CommMonoid)
      (Implication
         (Premises
            (Provable (CommSemiring $x))
         )
         (Conclusions
            (Provable (CommMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse HasDistribNeg_extends_InvolutiveNeg)
      (Implication
         (Premises
            (Provable (HasDistribNeg $x))
         )
         (Conclusions
            (Provable (InvolutiveNeg $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalNonAssocCommRing_extends_NonUnitalNonAssocRing)
      (Implication
         (Premises
            (Provable (NonUnitalNonAssocCommRing $x))
         )
         (Conclusions
            (Provable (NonUnitalNonAssocRing $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalNonAssocCommRing_extends_NonUnitalNonAssocCommSemiring)
      (Implication
         (Premises
            (Provable (NonUnitalNonAssocCommRing $x))
         )
         (Conclusions
            (Provable (NonUnitalNonAssocCommSemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalCommRing_extends_NonUnitalRing)
      (Implication
         (Premises
            (Provable (NonUnitalCommRing $x))
         )
         (Conclusions
            (Provable (NonUnitalRing $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonUnitalCommRing_extends_NonUnitalNonAssocCommRing)
      (Implication
         (Premises
            (Provable (NonUnitalCommRing $x))
         )
         (Conclusions
            (Provable (NonUnitalNonAssocCommRing $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonAssocCommRing_extends_NonAssocRing)
      (Implication
         (Premises
            (Provable (NonAssocCommRing $x))
         )
         (Conclusions
            (Provable (NonAssocRing $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonAssocCommRing_extends_NonUnitalNonAssocCommRing)
      (Implication
         (Premises
            (Provable (NonAssocCommRing $x))
         )
         (Conclusions
            (Provable (NonUnitalNonAssocCommRing $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse NonAssocCommRing_extends_NonAssocCommSemiring)
      (Implication
         (Premises
            (Provable (NonAssocCommRing $x))
         )
         (Conclusions
            (Provable (NonAssocCommSemiring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommRing_extends_Ring)
      (Implication
         (Premises
            (Provable (CommRing $x))
         )
         (Conclusions
            (Provable (Ring $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse CommRing_extends_CommMonoid)
      (Implication
         (Premises
            (Provable (CommRing $x))
         )
         (Conclusions
            (Provable (CommMonoid $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse IsDomain_extends_IsCancelMulZero)
      (Implication
         (Premises
            (Provable (IsDomain $x))
         )
         (Conclusions
            (Provable (IsCancelMulZero $x))
         )
      )
      (STV 1.0 1.0)
   )
)

!(compileadd kb
   (: (no_inverse IsDomain_extends_Nontrivial)
      (Implication
         (Premises
            (Provable (IsDomain $x))
         )
         (Conclusions
            (Provable (Nontrivial $x))
         )
      )
      (STV 1.0 1.0)
   )
)
