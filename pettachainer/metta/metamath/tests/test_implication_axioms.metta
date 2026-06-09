!(import! &self ../../petta_chainer)
!(import! &self ../axioms/metamath_axioms)

;; TEST: 2a1  
!(compileadd kb (: fact-2a1Phi (2a1Phi) (STV 1.0 1.0)))  
!(test  
   (collapse (query 100 kb  
      (: $prf  
         (Implication  
            (Premises (2a1Psi))  
            (Conclusions  
               (Implication  
                  (Premises (2a1Chi))  
                  (Conclusions (2a1Phi)))))  
         $tv)))  
   ((: (rule-proof (no_inverse mpcom) (rule-proof conjunction (rule-proof (no_inverse pm2.18) (ctx proof 172)) (ctx proof 44)))  
       (Implication (Premises (2a1Psi)) (Conclusions (Implication (Premises (2a1Chi)) (Conclusions (2a1Phi)))))  
       (STV 1.0 0.81))))

;; TEST: sylcom  
!(compileadd kb (: fact-sylcom-1  
   (Implication  
      (Premises (SylcomPhi))  
      (Conclusions (Implication  
            (Premises (SylcomPsi))  
            (Conclusions (SylcomChi)))))  
   (STV 1.0 1.0)))  
!(compileadd kb (: fact-sylcom-2  
   (Implication  
      (Premises (SylcomPsi))  
      (Conclusions (Implication  
            (Premises (SylcomChi))  
            (Conclusions (SylcomTheta)))))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 100 kb  
      (: $prf  
         (Implication  
            (Premises (SylcomPhi))  
            (Conclusions  
               (Implication  
                  (Premises (SylcomPsi))  
                  (Conclusions (SylcomTheta)))))  
         $tv)))  
   ((: (rule-proof (no_inverse mpcom) (rule-proof conjunction (rule-proof (no_inverse pm2.18) (ctx proof 172)) (ctx proof 44)))  
       (Implication (Premises (SylcomPhi)) (Conclusions (Implication (Premises (SylcomPsi)) (Conclusions (SylcomTheta)))))  
       (STV 1.0 0.81))))

;; TEST: syl5com  
!(compileadd kb (: fact-syl5com-1  
   (Implication  
      (Premises (Syl5comPhi))  
      (Conclusions (Syl5comPsi)))  
   (STV 1.0 1.0)))  
!(compileadd kb (: fact-syl5com-2  
   (Implication  
      (Premises (Syl5comChi))  
      (Conclusions (Implication  
            (Premises (Syl5comPsi))  
            (Conclusions (Syl5comTheta)))))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 100 kb  
      (: $prf  
         (Implication  
            (Premises (Syl5comPhi))  
            (Conclusions  
               (Implication  
                  (Premises (Syl5comChi))  
                  (Conclusions (Syl5comTheta)))))  
         $tv)))  
   ((: (rule-proof (no_inverse mpcom) (rule-proof conjunction (rule-proof (no_inverse pm2.18) (ctx proof 172)) (ctx proof 44)))  
       (Implication (Premises (Syl5comPhi)) (Conclusions (Implication (Premises (Syl5comChi)) (Conclusions (Syl5comTheta)))))  
       (STV 1.0 0.81))))

;; TEST: com12  
!(compileadd kb (: fact-com12-premise  
   (Implication  
      (Premises (Com12Phi))  
      (Conclusions (Implication  
            (Premises (Com12Psi))  
            (Conclusions (Com12Chi)))))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 100 kb  
      (: $prf  
         (Implication  
            (Premises (Com12Psi))  
            (Conclusions  
               (Implication  
                  (Premises (Com12Phi))  
                  (Conclusions (Com12Chi)))))  
         $tv)))  
   ((: (rule-proof (no_inverse mpcom) (rule-proof conjunction (rule-proof (no_inverse pm2.18) (ctx proof 172)) (ctx proof 44)))  
       (Implication (Premises (Com12Psi)) (Conclusions (Implication (Premises (Com12Phi)) (Conclusions (Com12Chi)))))  
       (STV 1.0 0.81))))

;; TEST: syl11  
!(compileadd kb (: fact-syl11-1  
   (Implication  
      (Premises (Syl11Phi))  
      (Conclusions (Implication  
            (Premises (Syl11Psi))  
            (Conclusions (Syl11Chi)))))  
   (STV 1.0 1.0)))  
!(compileadd kb (: fact-syl11-2  
   (Implication  
      (Premises (Syl11Theta))  
      (Conclusions (Syl11Phi)))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 100 kb  
      (: $prf  
         (Implication  
            (Premises (Syl11Psi))  
            (Conclusions  
               (Implication  
                  (Premises (Syl11Theta))  
                  (Conclusions (Syl11Chi)))))  
         $tv)))  
   ((: (rule-proof (no_inverse mpcom) (rule-proof conjunction (rule-proof (no_inverse pm2.18) (ctx proof 172)) (ctx proof 44)))  
       (Implication (Premises (Syl11Psi)) (Conclusions (Implication (Premises (Syl11Theta)) (Conclusions (Syl11Chi)))))  
       (STV 1.0 0.81))))

;; TEST: syl5  
!(compileadd kb (: fact-syl5-1  
   (Implication  
      (Premises (Syl5Phi))  
      (Conclusions (Syl5Psi)))  
   (STV 1.0 1.0)))  
!(compileadd kb (: fact-syl5-2  
   (Implication  
      (Premises (Syl5Chi))  
      (Conclusions (Implication  
            (Premises (Syl5Psi))  
            (Conclusions (Syl5Theta)))))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 100 kb  
      (: $prf  
         (Implication  
            (Premises (Syl5Chi))  
            (Conclusions  
               (Implication  
                  (Premises (Syl5Phi))  
                  (Conclusions (Syl5Theta)))))  
         $tv)))  
   ((: (rule-proof (no_inverse mpcom) (rule-proof conjunction (rule-proof (no_inverse pm2.18) (ctx proof 172)) (ctx proof 44)))  
       (Implication (Premises (Syl5Chi)) (Conclusions (Implication (Premises (Syl5Phi)) (Conclusions (Syl5Theta)))))  
       (STV 1.0 0.81))))

;; TEST: syl6  
!(compileadd kb (: fact-syl6-1  
   (Implication  
      (Premises (Syl6Phi))  
      (Conclusions (Implication  
            (Premises (Syl6Psi))  
            (Conclusions (Syl6Chi)))))  
   (STV 1.0 1.0)))  
!(compileadd kb (: fact-syl6-2  
   (Implication  
      (Premises (Syl6Chi))  
      (Conclusions (Syl6Theta)))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 200 kb  
      (: $prf  
         (Implication  
            (Premises (Syl6Phi))  
            (Conclusions  
               (Implication  
                  (Premises (Syl6Psi))  
                  (Conclusions (Syl6Theta)))))  
         $tv)))  
   ((: (rule-proof (no_inverse mpcom) (rule-proof conjunction (rule-proof (no_inverse pm2.18) (ctx proof 172)) (ctx proof 44)))  
       (Implication (Premises (Syl6Phi)) (Conclusions (Implication (Premises (Syl6Psi)) (Conclusions (Syl6Theta)))))  
       (STV 1.0 0.81))))

;; TEST: syl56  
!(compileadd kb (: fact-syl56-1  
   (Implication  
      (Premises (Syl56Phi))  
      (Conclusions (Syl56Psi)))  
   (STV 1.0 1.0)))  
!(compileadd kb (: fact-syl56-2  
   (Implication  
      (Premises (Syl56Chi))  
      (Conclusions (Implication  
            (Premises (Syl56Psi))  
            (Conclusions (Syl56Theta)))))  
   (STV 1.0 1.0)))  
!(compileadd kb (: fact-syl56-3  
   (Implication  
      (Premises (Syl56Theta))  
      (Conclusions (Syl56Tau)))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 200 kb  
      (: $prf  
         (Implication  
            (Premises (Syl56Chi))  
            (Conclusions  
               (Implication  
                  (Premises (Syl56Phi))  
                  (Conclusions (Syl56Tau)))))  
         $tv)))  
   ((: (rule-proof (no_inverse mpcom) (rule-proof conjunction (rule-proof (no_inverse pm2.18) (ctx proof 172)) (ctx proof 44)))  
       (Implication (Premises (Syl56Chi)) (Conclusions (Implication (Premises (Syl56Phi)) (Conclusions (Syl56Tau)))))  
       (STV 1.0 0.81))))

;; TEST: syl6com  
!(compileadd kb (: fact-syl6com-1  
   (Implication  
      (Premises (Syl6comPhi))  
      (Conclusions (Implication  
            (Premises (Syl6comPsi))  
            (Conclusions (Syl6comChi)))))  
   (STV 1.0 1.0)))  
!(compileadd kb (: fact-syl6com-2  
   (Implication  
      (Premises (Syl6comChi))  
      (Conclusions (Syl6comTheta)))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 200 kb  
      (: $prf  
         (Implication  
            (Premises (Syl6comPsi))  
            (Conclusions  
               (Implication  
                  (Premises (Syl6comPhi))  
                  (Conclusions (Syl6comTheta)))))  
         $tv)))  
   ((: (rule-proof (no_inverse mpcom) (rule-proof conjunction (rule-proof (no_inverse pm2.18) (ctx proof 172)) (ctx proof 44)))  
       (Implication (Premises (Syl6comPsi)) (Conclusions (Implication (Premises (Syl6comPhi)) (Conclusions (Syl6comTheta)))))  
       (STV 1.0 0.81))))

;; TEST: mpid  
!(compileadd kb (: fact-mpid-1  
   (Implication  
      (Premises (MpidPhi))  
      (Conclusions (MpidChi)))  
   (STV 1.0 1.0)))  
!(compileadd kb (: fact-mpid-2  
   (Implication  
      (Premises (MpidPhi))  
      (Conclusions (Implication  
            (Premises (MpidPsi))  
            (Conclusions (Implication  
                  (Premises (MpidChi))  
                  (Conclusions (MpidTheta)))))))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 100 kb  
      (: $prf  
         (Implication  
            (Premises (MpidPhi))  
            (Conclusions  
               (Implication  
                  (Premises (MpidPsi))  
                  (Conclusions (MpidTheta)))))  
         $tv)))  
   ((: (rule-proof (no_inverse mpcom) (rule-proof conjunction (rule-proof (no_inverse pm2.18) (ctx proof 172)) (ctx proof 44)))  
       (Implication (Premises (MpidPhi)) (Conclusions (Implication (Premises (MpidPsi)) (Conclusions (MpidTheta)))))  
       (STV 1.0 0.81))))

;; TEST: mpdi  
!(compileadd kb (: fact-mpdi-1  
   (Implication  
      (Premises (MpdiPsi))  
      (Conclusions (MpdiChi)))  
   (STV 1.0 1.0)))  
!(compileadd kb (: fact-mpdi-2  
   (Implication  
      (Premises (MpdiPhi))  
      (Conclusions (Implication  
            (Premises (MpdiPsi))  
            (Conclusions (Implication  
                  (Premises (MpdiChi))  
                  (Conclusions (MpdiTheta)))))))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 100 kb  
      (: $prf  
         (Implication  
            (Premises (MpdiPhi))  
            (Conclusions  
               (Implication  
                  (Premises (MpdiPsi))  
                  (Conclusions (MpdiTheta)))))  
         $tv)))  
   ((: (rule-proof (no_inverse mpcom) (rule-proof conjunction (rule-proof (no_inverse pm2.18) (ctx proof 172)) (ctx proof 44)))  
       (Implication (Premises (MpdiPhi)) (Conclusions (Implication (Premises (MpdiPsi)) (Conclusions (MpdiTheta)))))  
       (STV 1.0 0.81))))

;; TEST: mpii  
!(compileadd kb (: fact-mpii-1  
   (MpiiChi)  
   (STV 1.0 1.0)))  
!(compileadd kb (: fact-mpii-2  
   (Implication  
      (Premises (MpiiPhi))  
      (Conclusions (Implication  
            (Premises (MpiiPsi))  
            (Conclusions (Implication  
                  (Premises (MpiiChi))  
                  (Conclusions (MpiiTheta)))))))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 100 kb  
      (: $prf  
         (Implication  
            (Premises (MpiiPhi))  
            (Conclusions  
               (Implication  
                  (Premises (MpiiPsi))  
                  (Conclusions (MpiiTheta)))))  
         $tv)))  
   ((: (rule-proof (no_inverse mpcom) (rule-proof conjunction (rule-proof (no_inverse pm2.18) (ctx proof 172)) (ctx proof 44)))  
       (Implication (Premises (MpiiPhi)) (Conclusions (Implication (Premises (MpiiPsi)) (Conclusions (MpiiTheta)))))  
       (STV 1.0 0.81))))

;; TEST: syld  
!(compileadd kb (: fact-syld-1  
   (Implication  
      (Premises (SyldPhi))  
      (Conclusions (Implication  
            (Premises (SyldPsi))  
            (Conclusions (SyldChi)))))  
   (STV 1.0 1.0)))  
!(compileadd kb (: fact-syld-2  
   (Implication  
      (Premises (SyldPhi))  
      (Conclusions (Implication  
            (Premises (SyldChi))  
            (Conclusions (SyldTheta)))))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 100 kb  
      (: $prf  
         (Implication  
            (Premises (SyldPhi))  
            (Conclusions  
               (Implication  
                  (Premises (SyldPsi))  
                  (Conclusions (SyldTheta)))))  
         $tv)))  
   ((: (rule-proof (no_inverse mpcom) (rule-proof conjunction (rule-proof (no_inverse pm2.18) (ctx proof 172)) (ctx proof 44)))  
       (Implication (Premises (SyldPhi)) (Conclusions (Implication (Premises (SyldPsi)) (Conclusions (SyldTheta)))))  
       (STV 1.0 0.81))))

;; TEST: syldc  
!(compileadd kb (: fact-syldc-1  
   (Implication  
      (Premises (SyldcPhi))  
      (Conclusions (Implication  
            (Premises (SyldcPsi))  
            (Conclusions (SyldcChi)))))  
   (STV 1.0 1.0)))  
!(compileadd kb (: fact-syldc-2  
   (Implication  
      (Premises (SyldcPhi))  
      (Conclusions (Implication  
            (Premises (SyldcChi))  
            (Conclusions (SyldcTheta)))))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 100 kb  
      (: $prf  
         (Implication  
            (Premises (SyldcPsi))  
            (Conclusions  
               (Implication  
                  (Premises (SyldcPhi))  
                  (Conclusions (SyldcTheta)))))  
         $tv)))  
   ((: (rule-proof (no_inverse mpcom) (rule-proof conjunction (rule-proof (no_inverse pm2.18) (ctx proof 172)) (ctx proof 44)))  
       (Implication (Premises (SyldcPsi)) (Conclusions (Implication (Premises (SyldcPhi)) (Conclusions (SyldcTheta)))))  
       (STV 1.0 0.81))))

;; TEST: com23  
!(compileadd kb (: fact-com23-premise  
   (Implication  
      (Premises (Com23Phi))  
      (Conclusions (Implication  
            (Premises (Com23Psi))  
            (Conclusions (Implication  
                  (Premises (Com23Chi))  
                  (Conclusions (Com23Theta)))))))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 100 kb  
      (: $prf  
         (Implication  
            (Premises (Com23Phi))  
            (Conclusions  
               (Implication  
                  (Premises (Com23Chi))  
                  (Conclusions  
                     (Implication  
                        (Premises (Com23Psi))  
                        (Conclusions (Com23Theta)))))))  
         $tv)))  
   ((: (merge/revision  
           (rule-proof (no_inverse syl11) (rule-proof conjunction (ctx proof 32) (rule-proof (no_inverse pm2.18) (ctx proof 172))))  
           (rule-proof (no_inverse syl11) (rule-proof conjunction (rule-proof (no_inverse biimp) (ctx proof 32)) (rule-proof (no_inverse pm2.18i) (ctx proof 173)))))  
       (Implication (Premises (Com23Phi)) (Conclusions (Implication (Premises (Com23Chi)) (Conclusions (Implication (Premises (Com23Psi)) (Conclusions (Com23Theta)))))))  
       (STV 1.0 0.8950276243093923))))

;; TEST: com3r  
!(compileadd kb (: fact-com3r-premise  
   (Implication  
      (Premises (Com3rPhi))  
      (Conclusions (Implication  
            (Premises (Com3rPsi))  
            (Conclusions (Implication  
                  (Premises (Com3rChi))  
                  (Conclusions (Com3rTheta)))))))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 100 kb  
      (: $prf  
         (Implication  
            (Premises (Com3rChi))  
            (Conclusions  
               (Implication  
                  (Premises (Com3rPhi))  
                  (Conclusions  
                     (Implication  
                        (Premises (Com3rPsi))  
                        (Conclusions (Com3rTheta)))))))  
         $tv)))  
   ((: (merge/revision  
           (rule-proof (no_inverse syl11) (rule-proof conjunction (ctx proof 32) (rule-proof (no_inverse pm2.18) (ctx proof 172))))  
           (rule-proof (no_inverse syl11) (rule-proof conjunction (rule-proof (no_inverse biimp) (ctx proof 32)) (rule-proof (no_inverse pm2.18i) (ctx proof 173)))))  
       (Implication (Premises (Com3rChi)) (Conclusions (Implication (Premises (Com3rPhi)) (Conclusions (Implication (Premises (Com3rPsi)) (Conclusions (Com3rTheta)))))))  
       (STV 1.0 0.8950276243093923))))

;; TEST: com13  
!(compileadd kb (: fact-com13-premise  
   (Implication  
      (Premises (Com13Phi))  
      (Conclusions (Implication  
            (Premises (Com13Psi))  
            (Conclusions (Implication  
                  (Premises (Com13Chi))  
                  (Conclusions (Com13Theta)))))))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 100 kb  
      (: $prf  
         (Implication  
            (Premises (Com13Chi))  
            (Conclusions  
               (Implication  
                  (Premises (Com13Psi))  
                  (Conclusions  
                     (Implication  
                        (Premises (Com13Phi))  
                        (Conclusions (Com13Theta)))))))  
         $tv)))  
   ((: (merge/revision  
           (rule-proof (no_inverse syl11) (rule-proof conjunction (ctx proof 32) (rule-proof (no_inverse pm2.18) (ctx proof 172))))  
           (rule-proof (no_inverse syl11) (rule-proof conjunction (rule-proof (no_inverse biimp) (ctx proof 32)) (rule-proof (no_inverse pm2.18i) (ctx proof 173)))))  
       (Implication (Premises (Com13Chi)) (Conclusions (Implication (Premises (Com13Psi)) (Conclusions (Implication (Premises (Com13Phi)) (Conclusions (Com13Theta)))))))  
       (STV 1.0 0.8950276243093923))))

;; TEST: pm2.04  
!(compileadd kb (: fact-pm204-premise  
   (Implication  
      (Premises (Pm204Phi))  
      (Conclusions (Implication  
            (Premises (Pm204Psi))  
            (Conclusions (Pm204Chi)))))  
   (STV 1.0 1.0)))  
!(test  
   (collapse (query 100 kb  
      (: $prf  
         (Implication  
            (Premises (Pm204Psi))  
            (Conclusions  
               (Implication  
                  (Premises (Pm204Phi))  
                  (Conclusions (Pm204Chi)))))  
         $tv)))  
   ((: (rule-proof (no_inverse mpcom) (rule-proof conjunction (rule-proof (no_inverse pm2.18) (ctx proof 172)) (ctx proof 44)))  
       (Implication (Premises (Pm204Psi)) (Conclusions (Implication (Premises (Pm204Phi)) (Conclusions (Pm204Chi)))))  
       (STV 1.0 0.81))))



