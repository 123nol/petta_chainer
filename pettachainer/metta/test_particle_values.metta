!(import! &self petta_chainer)

!(test
    (DistGreaterThanFormula (ParticleFromPairs ((0 0.25) (2 0.75))) 1)
    (STV 0.75 1.0))

!(test
    (DistGreaterThanFormula (MpFormula (STV 0.4 1.0) (ParticleFromPairs ((0 0.25) (2 0.75)))) 1)
    (STV 0.30000000000000004 1.0))

!(test
    (let* (($pd0 (ParticleFromPairs ((0 1.0))))
           ($pd1 (ParticleAddBernoulliFromSTV $pd0 (STV 0.5 1.0)))
           ($pd2 (ParticleAddBernoulliFromSTV $pd1 (STV 0.5 1.0))))
      (DistGreaterThanFormula $pd2 1))
    (STV 0.25 1.0))

!(compileadd kb (: kidp1 (Kid kidp1) (STV 1.0 1.0)))
!(compileadd kb (: kidp2 (Kid kidp2) (STV 1.0 1.0)))
!(compileadd kb (: roomp1 (Room roomp1) (STV 1.0 1.0)))
!(compileadd kb (: roomp2 (Room roomp2) (STV 1.0 1.0)))
!(compileadd kb (: inp11 (In roomp1 kidp1) (STV 0.5 1.0)))
!(compileadd kb (: inp12 (In roomp1 kidp2) (STV 0.5 1.0)))
!(compileadd kb (: inp21 (In roomp2 kidp1) (STV 0.2 1.0)))
!(compileadd kb (: inp22 (In roomp2 kidp2) (STV 0.3 1.0)))

!(compileadd kb (: cntKidInParticleRule
    (Implication
        (Premises
            (Room $room)
            (FoldAllValue (In $room $kid) $tvin (ParticleFromPairs ((0 1.0))) ParticleAddBernoulliFromSTV -> $dist))
        (Conclusions
            (CntKidInParticle $room)))
    (STV 1.0 0.8)))

!(compileadd kb (: playTogetherParticleRule
    (Implication
        (Premises
            (Room $room)
            (GreaterThan (CntKidInParticle $room) 1))
        (Conclusions
            (PlayTogetherParticleIn $room)))
    (STV 1.0 0.75)))

!(test
    (let (: $prf (CntKidInParticle roomp1) $tv)
         (query 40 kb (: $prf (CntKidInParticle roomp1) $tv))
         (DistGreaterThanFormula $tv 1))
    (STV 0.2 1.0))

!(test
    (let (: $prf (CntKidInParticle roomp2) $tv)
         (query 40 kb (: $prf (CntKidInParticle roomp2) $tv))
         (DistGreaterThanFormula $tv 1))
    (STV 0.048 1.0))

!(test
    (let (: $prf (PlayTogetherParticleIn roomp1) $tv)
         (query 40 kb (: $prf (PlayTogetherParticleIn roomp1) $tv))
         $tv)
    (STV 0.2 0.8571428571428571))

!(test
    (let (: $prf (PlayTogetherParticleIn roomp2) $tv)
         (query 40 kb (: $prf (PlayTogetherParticleIn roomp2) $tv))
         $tv)
    (STV 0.048 0.8571428571428571))
