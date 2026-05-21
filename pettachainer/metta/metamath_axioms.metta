;; metamath axioms
!(compileadd kb 
   (: (no_inverse rule-abduction) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($chi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         )
      ) 
      (STV 0.5 0.4)
   )
)

!(compileadd kb 
   (: (no_inverse rule-induction) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($chi)) 
               (Conclusions ($phi))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         )
      ) 
      (STV 0.5 0.4)
   )
)

!(compileadd kb 
   (: (no_inverse idi) 
      (Implication 
         (Premises 
            ($phi)
         ) 
         (Conclusions 
            ($phi)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse a1ii) 
      (Implication 
         (Premises 
            ($phi)
            ($psi)
         ) 
         (Conclusions 
            ($phi)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse ax-mp) 
      (Implication 
         (Premises 
            ($phi)
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            ($psi)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse ax-1) 
      (Implication 
         (Premises ($phi)) 
         (Conclusions (Implication 
               (Premises ($psi)) 
               (Conclusions ($phi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse ax-2) 
      (Implication 
         (Premises (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )) 
         (Conclusions (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($chi))
                  ))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse ax-3) 
      (Implication 
         (Premises (Implication 
               (Premises (Not ($phi))) 
               (Conclusions (Not ($psi)))
            )) 
         (Conclusions (Implication 
               (Premises ($psi)) 
               (Conclusions ($phi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mp2) 
      (Implication 
         (Premises 
            ($phi)
            ($psi)
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            ($chi)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mp2b) 
      (Implication 
         (Premises 
            ($phi)
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($chi))
            )
         ) 
         (Conclusions 
            ($chi)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse a1i) 
      (Implication 
         (Premises 
            ($phi)
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($phi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse 2a1i) 
      (Implication 
         (Premises 
            ($phi)
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($phi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mp1i) 
      (Implication 
         (Premises 
            ($phi)
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($chi)) 
               (Conclusions ($psi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse a2i) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($chi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mpd) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse imim2i) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($phi))
                  )) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($psi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($chi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse 3syl) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($chi))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions ($theta))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($theta))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse 4syl) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($chi))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions ($theta))
            )
            (Implication 
               (Premises ($theta)) 
               (Conclusions ($tau))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($tau))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mpi) 
      (Implication 
         (Premises 
            ($psi)
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mpisyl) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            ($chi)
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($theta))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($theta))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse id) 
      (Implication 
         (Premises ($phi)) 
         (Conclusions ($phi))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse idALT) 
      (Implication 
         (Premises ($phi)) 
         (Conclusions ($phi))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse idd) 
      (Implication 
         (Premises ($phi)) 
         (Conclusions (Implication 
               (Premises ($psi)) 
               (Conclusions ($psi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse a1d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($psi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse 2a1d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions (Implication 
                           (Premises ($theta)) 
                           (Conclusions ($psi))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse a1i13) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($theta))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse 2a1) 
      (Implication 
         (Premises ($phi)) 
         (Conclusions (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($phi))
                  ))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse a2d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($chi))
                        )) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse sylcom) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($theta))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($theta))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl5com) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($theta))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($theta))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com12) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($chi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl11) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($theta)) 
               (Conclusions ($phi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions ($chi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl5) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($theta))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($theta))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl6) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions ($theta))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($theta))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl56) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($theta))
                  ))
            )
            (Implication 
               (Premises ($theta)) 
               (Conclusions ($tau))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($tau))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl6com) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions ($theta))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($theta))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mpcom) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($phi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syli) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($theta))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($theta))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl2im) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions ($theta))
            )
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions ($tau))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($tau))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl2imc) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions ($theta))
            )
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions ($tau))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($tau))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.27) 
      (Implication 
         (Premises ($phi)) 
         (Conclusions (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions ($psi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mpdd) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($theta))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mpid) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($theta))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mpdi) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($chi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($theta))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mpii) 
      (Implication 
         (Premises 
            ($chi)
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($theta))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syld) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($theta))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($theta))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syldc) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($theta))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($theta))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mp2d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($theta))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse a1dd) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($theta)) 
                           (Conclusions ($chi))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse 2a1dd) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($theta)) 
                           (Conclusions (Implication 
                                 (Premises ($tau)) 
                                 (Conclusions ($chi))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.43i) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.43d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($chi))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.43a) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($chi))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($chi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.43b) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($chi))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.43) 
      (Implication 
         (Premises (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  ))
            )) 
         (Conclusions (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse imim2d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Implication 
                           (Premises ($theta)) 
                           (Conclusions ($psi))
                        )) 
                     (Conclusions (Implication 
                           (Premises ($theta)) 
                           (Conclusions ($chi))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse imim2) 
      (Implication 
         (Premises (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )) 
         (Conclusions (Implication 
               (Premises (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($phi))
                  )) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($psi))
                  ))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse embantd) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($theta))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($chi))
                        )) 
                     (Conclusions ($theta))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse 3syld) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($theta))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions ($tau))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($tau))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse sylsyld) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($theta))
                  ))
            )
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions ($tau))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($tau))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse imim12i) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions ($theta))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  )) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($theta))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse imim1i) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  )) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($chi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse imim3i) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises (Implication 
                     (Premises ($theta)) 
                     (Conclusions ($phi))
                  )) 
               (Conclusions (Implication 
                     (Premises (Implication 
                           (Premises ($theta)) 
                           (Conclusions ($psi))
                        )) 
                     (Conclusions (Implication 
                           (Premises ($theta)) 
                           (Conclusions ($chi))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse sylc) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($theta))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($theta))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl3c) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($theta))
            )
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions (Implication 
                           (Premises ($theta)) 
                           (Conclusions ($tau))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($tau))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl6mpi) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            ($theta)
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions ($tau))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($tau))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mpsyl) 
      (Implication 
         (Premises 
            ($phi)
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($chi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($theta))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($theta))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mpsylsyld) 
      (Implication 
         (Premises 
            ($phi)
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($theta))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions ($tau))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($tau))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl6c) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($theta))
                  ))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions ($tau))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($tau))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl6ci) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($theta))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions ($tau))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($tau))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syldd) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($theta)) 
                           (Conclusions ($tau))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($tau))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl5d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($tau))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($tau))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl7) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($tau))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions (Implication 
                           (Premises ($phi)) 
                           (Conclusions ($tau))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl6d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions ($tau))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($tau))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl8) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
            (Implication 
               (Premises ($theta)) 
               (Conclusions ($tau))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($tau))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl9) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($theta)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($tau))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($tau))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl9r) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($theta)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($tau))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($theta)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($tau))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse syl10) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($theta)) 
                           (Conclusions ($tau))
                        ))
                  ))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($tau)) 
                     (Conclusions ($eta))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($theta)) 
                           (Conclusions ($eta))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse a1ddd) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($tau))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions ($tau))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse imim12d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions ($tau))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        )) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($tau))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse imim1d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        )) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse imim1) 
      (Implication 
         (Premises (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )) 
         (Conclusions (Implication 
               (Premises (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  )) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($chi))
                  ))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.83) 
      (Implication 
         (Premises (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )) 
         (Conclusions (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  )) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse peirceroll) 
      (Implication 
         (Premises (Implication 
               (Premises (Implication 
                     (Premises (Implication 
                           (Premises ($phi)) 
                           (Conclusions ($psi))
                        )) 
                     (Conclusions ($phi))
                  )) 
               (Conclusions ($phi))
            )) 
         (Conclusions (Implication 
               (Premises (Implication 
                     (Premises (Implication 
                           (Premises ($phi)) 
                           (Conclusions ($psi))
                        )) 
                     (Conclusions ($chi))
                  )) 
               (Conclusions (Implication 
                     (Premises (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($phi))
                        )) 
                     (Conclusions ($phi))
                  ))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com23) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com3r) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com13) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($phi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com3l) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions (Implication 
                           (Premises ($phi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.04) 
      (Implication 
         (Premises (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )) 
         (Conclusions (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($chi))
                  ))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com34) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions ($tau))
                              ))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($theta)) 
                           (Conclusions (Implication 
                                 (Premises ($chi)) 
                                 (Conclusions ($tau))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com4l) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions ($tau))
                              ))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions (Implication 
                           (Premises ($theta)) 
                           (Conclusions (Implication 
                                 (Premises ($phi)) 
                                 (Conclusions ($tau))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com4t) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions ($tau))
                              ))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions (Implication 
                           (Premises ($phi)) 
                           (Conclusions (Implication 
                                 (Premises ($psi)) 
                                 (Conclusions ($tau))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com4r) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions ($tau))
                              ))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($theta)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions (Implication 
                                 (Premises ($chi)) 
                                 (Conclusions ($tau))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com24) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions ($tau))
                              ))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($psi)) 
                                 (Conclusions ($tau))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com14) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions ($tau))
                              ))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($theta)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($phi)) 
                                 (Conclusions ($tau))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com45) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions (Implication 
                                       (Premises ($tau)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($tau)) 
                                 (Conclusions (Implication 
                                       (Premises ($theta)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com35) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions (Implication 
                                       (Premises ($tau)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($tau)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions (Implication 
                                       (Premises ($chi)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com25) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions (Implication 
                                       (Premises ($tau)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($tau)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions (Implication 
                                       (Premises ($psi)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com5l) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions (Implication 
                                       (Premises ($tau)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions (Implication 
                           (Premises ($theta)) 
                           (Conclusions (Implication 
                                 (Premises ($tau)) 
                                 (Conclusions (Implication 
                                       (Premises ($phi)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com15) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions (Implication 
                                       (Premises ($tau)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($tau)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions (Implication 
                                       (Premises ($phi)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com52l) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions (Implication 
                                       (Premises ($tau)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions (Implication 
                           (Premises ($tau)) 
                           (Conclusions (Implication 
                                 (Premises ($phi)) 
                                 (Conclusions (Implication 
                                       (Premises ($psi)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com52r) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions (Implication 
                                       (Premises ($tau)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($theta)) 
               (Conclusions (Implication 
                     (Premises ($tau)) 
                     (Conclusions (Implication 
                           (Premises ($phi)) 
                           (Conclusions (Implication 
                                 (Premises ($psi)) 
                                 (Conclusions (Implication 
                                       (Premises ($chi)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse com5r) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions (Implication 
                                 (Premises ($theta)) 
                                 (Conclusions (Implication 
                                       (Premises ($tau)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($tau)) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions (Implication 
                                 (Premises ($chi)) 
                                 (Conclusions (Implication 
                                       (Premises ($theta)) 
                                       (Conclusions ($eta))
                                    ))
                              ))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse imim12) 
      (Implication 
         (Premises (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )) 
         (Conclusions (Implication 
               (Premises (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($theta))
                  )) 
               (Conclusions (Implication 
                     (Premises (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($chi))
                        )) 
                     (Conclusions (Implication 
                           (Premises ($phi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse jarr) 
      (Implication 
         (Premises (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions ($chi))
            )) 
         (Conclusions (Implication 
               (Premises ($psi)) 
               (Conclusions ($chi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse jarri) 
      (Implication 
         (Premises 
            (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions ($chi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.86d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($chi))
                        )) 
                     (Conclusions (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Implication 
                           (Premises ($chi)) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.86) 
      (Implication 
         (Premises (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($chi))
                  ))
            )) 
         (Conclusions (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.86i) 
      (Implication 
         (Premises 
            (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse loolin) 
      (Implication 
         (Premises (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($phi))
                  ))
            )) 
         (Conclusions (Implication 
               (Premises ($psi)) 
               (Conclusions ($phi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse loowoz) 
      (Implication 
         (Premises (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($chi))
                  ))
            )) 
         (Conclusions (Implication 
               (Premises (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($phi))
                  )) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse con4) 
      (Implication 
         (Premises (Implication 
               (Premises (Not ($phi))) 
               (Conclusions (Not ($psi)))
            )) 
         (Conclusions (Implication 
               (Premises ($psi)) 
               (Conclusions ($phi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse con4i) 
      (Implication 
         (Premises 
            (Implication 
               (Premises (Not ($phi))) 
               (Conclusions (Not ($psi)))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($phi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse con4d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Not ($psi))) 
                     (Conclusions (Not ($chi)))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($psi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mt4) 
      (Implication 
         (Premises 
            ($phi)
            (Implication 
               (Premises (Not ($psi))) 
               (Conclusions (Not ($phi)))
            )
         ) 
         (Conclusions 
            ($psi)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mt4d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Not ($chi))) 
                     (Conclusions (Not ($psi)))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mt4i) 
      (Implication 
         (Premises 
            ($chi)
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Not ($psi))) 
                     (Conclusions (Not ($chi)))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.21i) 
      (Implication 
         (Premises 
            (Not ($phi))
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.24ii) 
      (Implication 
         (Premises 
            ($phi)
            (Not ($phi))
         ) 
         (Conclusions 
            ($psi)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.21d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.21ddALT) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.21) 
      (Implication 
         (Premises (Not ($phi))) 
         (Conclusions (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.24) 
      (Implication 
         (Premises ($phi)) 
         (Conclusions (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($psi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse jarl) 
      (Implication 
         (Premises (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions ($chi))
            )) 
         (Conclusions (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($chi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse jarli) 
      (Implication 
         (Premises 
            (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions ($chi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.18d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Not ($psi))) 
                     (Conclusions ($psi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.18) 
      (Implication 
         (Premises (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($phi))
            )) 
         (Conclusions ($phi))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.18i) 
      (Implication 
         (Premises 
            (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($phi))
            )
         ) 
         (Conclusions 
            ($phi)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse notnotr) 
      (Implication 
         (Premises (Not (Not ($phi)))) 
         (Conclusions ($phi))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse notnotri) 
      (Implication 
         (Premises 
            (Not (Not ($phi)))
         ) 
         (Conclusions 
            ($phi)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse notnotriALT) 
      (Implication 
         (Premises 
            (Not (Not ($phi)))
         ) 
         (Conclusions 
            ($phi)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse notnotrd) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not (Not ($psi))))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse con2d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Not ($chi)))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions (Not ($psi)))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse con2) 
      (Implication 
         (Premises (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )) 
         (Conclusions (Implication 
               (Premises ($psi)) 
               (Conclusions (Not ($phi)))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mt2d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Not ($chi)))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mt2i) 
      (Implication 
         (Premises 
            ($chi)
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Not ($chi)))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse nsyl3) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($chi)) 
               (Conclusions (Not ($phi)))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse con2i) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($psi)) 
               (Conclusions (Not ($phi)))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse nsyl) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($chi)))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse nsyl2) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )
            (Implication 
               (Premises (Not ($chi))) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse notnot) 
      (Implication 
         (Premises ($phi)) 
         (Conclusions (Not (Not ($phi))))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse notnoti) 
      (Implication 
         (Premises 
            ($phi)
         ) 
         (Conclusions 
            (Not (Not ($phi)))
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse notnotd) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not (Not ($psi))))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse con1d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Not ($psi))) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Not ($chi))) 
                     (Conclusions ($psi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse con1) 
      (Implication 
         (Premises (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($psi))
            )) 
         (Conclusions (Implication 
               (Premises (Not ($psi))) 
               (Conclusions ($phi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse con1i) 
      (Implication 
         (Premises 
            (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises (Not ($psi))) 
               (Conclusions ($phi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mt3d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($chi)))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Not ($psi))) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mt3i) 
      (Implication 
         (Premises 
            (Not ($chi))
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Not ($psi))) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.24i) 
      (Implication 
         (Premises 
            ($phi)
         ) 
         (Conclusions 
            (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($psi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.24d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Not ($psi))) 
                     (Conclusions ($chi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse con3d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Not ($chi))) 
                     (Conclusions (Not ($psi)))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse con3) 
      (Implication 
         (Premises (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )) 
         (Conclusions (Implication 
               (Premises (Not ($psi))) 
               (Conclusions (Not ($phi)))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse con3i) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises (Not ($psi))) 
               (Conclusions (Not ($phi)))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse con3rr3) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises (Not ($chi))) 
               (Conclusions (Implication 
                     (Premises ($phi)) 
                     (Conclusions (Not ($psi)))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse nsyld) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Not ($chi)))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($tau)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Not ($tau)))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse nsyli) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($theta)) 
               (Conclusions (Not ($chi)))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($theta)) 
                     (Conclusions (Not ($psi)))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse nsyl4) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($chi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises (Not ($chi))) 
               (Conclusions ($psi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse nsyl5) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($chi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises (Not ($psi))) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm3.2im) 
      (Implication 
         (Premises ($phi)) 
         (Conclusions (Implication 
               (Premises ($psi)) 
               (Conclusions (Not (Implication 
                     (Premises ($phi)) 
                     (Conclusions (Not ($psi)))
                  )))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse jc) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Not ($chi)))
                  )))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse jcn) 
      (Implication 
         (Premises ($phi)) 
         (Conclusions (Implication 
               (Premises (Not ($psi))) 
               (Conclusions (Not (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse jcnd) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($chi)))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  )))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse impi) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises (Not (Implication 
                     (Premises ($phi)) 
                     (Conclusions (Not ($psi)))
                  ))) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse expi) 
      (Implication 
         (Premises 
            (Implication 
               (Premises (Not (Implication 
                     (Premises ($phi)) 
                     (Conclusions (Not ($psi)))
                  ))) 
               (Conclusions ($chi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse simprim) 
      (Implication 
         (Premises (Not (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            ))) 
         (Conclusions ($psi))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse simplim) 
      (Implication 
         (Premises (Not (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            ))) 
         (Conclusions ($phi))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.5g) 
      (Implication 
         (Premises (Not (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            ))) 
         (Conclusions (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($chi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.5) 
      (Implication 
         (Premises (Not (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            ))) 
         (Conclusions (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($psi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse conax1) 
      (Implication 
         (Premises (Not (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            ))) 
         (Conclusions (Not ($psi)))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse conax1k) 
      (Implication 
         (Premises (Not (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            ))) 
         (Conclusions (Implication 
               (Premises ($chi)) 
               (Conclusions (Not ($psi)))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.51) 
      (Implication 
         (Premises (Not (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            ))) 
         (Conclusions (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.52) 
      (Implication 
         (Premises (Not (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            ))) 
         (Conclusions (Implication 
               (Premises (Not ($phi))) 
               (Conclusions (Not ($psi)))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.521g) 
      (Implication 
         (Premises (Not (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            ))) 
         (Conclusions (Implication 
               (Premises ($psi)) 
               (Conclusions ($chi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.521g2) 
      (Implication 
         (Premises (Not (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            ))) 
         (Conclusions (Implication 
               (Premises ($chi)) 
               (Conclusions ($phi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.521) 
      (Implication 
         (Premises (Not (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            ))) 
         (Conclusions (Implication 
               (Premises ($psi)) 
               (Conclusions ($phi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse expt) 
      (Implication 
         (Premises (Implication 
               (Premises (Not (Implication 
                     (Premises ($phi)) 
                     (Conclusions (Not ($psi)))
                  ))) 
               (Conclusions ($chi))
            )) 
         (Conclusions (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse impt) 
      (Implication 
         (Premises (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )) 
         (Conclusions (Implication 
               (Premises (Not (Implication 
                     (Premises ($phi)) 
                     (Conclusions (Not ($psi)))
                  ))) 
               (Conclusions ($chi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.61d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Not ($psi))) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.61d1) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises (Not ($psi))) 
               (Conclusions ($chi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.61d2) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Not ($psi))) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($chi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.61i) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            ($psi)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.61ii) 
      (Implication 
         (Premises 
            (Implication 
               (Premises (Not ($phi))) 
               (Conclusions (Implication 
                     (Premises (Not ($psi))) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($chi))
            )
         ) 
         (Conclusions 
            ($chi)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.61nii) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($chi))
            )
            (Implication 
               (Premises (Not ($psi))) 
               (Conclusions ($chi))
            )
         ) 
         (Conclusions 
            ($chi)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.61iii) 
      (Implication 
         (Premises 
            (Implication 
               (Premises (Not ($phi))) 
               (Conclusions (Implication 
                     (Premises (Not ($psi))) 
                     (Conclusions (Implication 
                           (Premises (Not ($chi))) 
                           (Conclusions ($theta))
                        ))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($theta))
            )
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($theta))
            )
            (Implication 
               (Premises ($chi)) 
               (Conclusions ($theta))
            )
         ) 
         (Conclusions 
            ($theta)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse ja) 
      (Implication 
         (Premises 
            (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($chi))
            )
            (Implication 
               (Premises ($psi)) 
               (Conclusions ($chi))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse jad) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Not ($psi))) 
                     (Conclusions ($theta))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($chi)) 
                     (Conclusions ($theta))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises (Implication 
                           (Premises ($psi)) 
                           (Conclusions ($chi))
                        )) 
                     (Conclusions ($theta))
                  ))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.01) 
      (Implication 
         (Premises (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($phi)))
            )) 
         (Conclusions (Not ($phi)))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.01i) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($phi)))
            )
         ) 
         (Conclusions 
            (Not ($phi))
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.01d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Not ($psi)))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.6) 
      (Implication 
         (Premises (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($psi))
            )) 
         (Conclusions (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions ($psi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.61) 
      (Implication 
         (Premises (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )) 
         (Conclusions (Implication 
               (Premises (Implication 
                     (Premises (Not ($phi))) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions ($psi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.65) 
      (Implication 
         (Premises (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )) 
         (Conclusions (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions (Not ($psi)))
                  )) 
               (Conclusions (Not ($phi)))
            ))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.65i) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )
         ) 
         (Conclusions 
            (Not ($phi))
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.21dd) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($chi))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse pm2.65d) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions (Not ($chi)))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mto) 
      (Implication 
         (Premises 
            (Not ($psi))
            (Implication 
               (Premises ($phi)) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            (Not ($phi))
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mtod) 
      (Implication 
         (Premises 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($chi)))
            )
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mtoi) 
      (Implication 
         (Premises 
            (Not ($chi))
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($chi))
                  ))
            )
         ) 
         (Conclusions 
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mt2) 
      (Implication 
         (Premises 
            ($psi)
            (Implication 
               (Premises ($phi)) 
               (Conclusions (Not ($psi)))
            )
         ) 
         (Conclusions 
            (Not ($phi))
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse mt3) 
      (Implication 
         (Premises 
            (Not ($psi))
            (Implication 
               (Premises (Not ($phi))) 
               (Conclusions ($psi))
            )
         ) 
         (Conclusions 
            ($phi)
         )
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse peirce) 
      (Implication 
         (Premises (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions ($phi))
            )) 
         (Conclusions ($phi))
      ) 
      (STV 1.0 1.0)
   )
)

!(compileadd kb 
   (: (no_inverse looinv) 
      (Implication 
         (Premises (Implication 
               (Premises (Implication 
                     (Premises ($phi)) 
                     (Conclusions ($psi))
                  )) 
               (Conclusions ($psi))
            )) 
         (Conclusions (Implication 
               (Premises (Implication 
                     (Premises ($psi)) 
                     (Conclusions ($phi))
                  )) 
               (Conclusions ($phi))
            ))
      ) 
      (STV 1.0 1.0)
   )
)
