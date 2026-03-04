!(import! &self (library lib_roman))
!(import! &self (library lib_spaces))
!(import! &self (library lib_he))

(= (nextctx)
   (let $mn (catch (get-state ctxid))
      (let $n (if-error $mn 0 $mn) (progn (change-state! ctxid (+ $n 1)) $n))))

(= (extract-vars $expr)
   (if (is-var $expr) ($expr)
      (if (is-expr $expr)
         (let $collect-vars (|-> ($accum $arg) (if (is-var $arg) (cons $arg $accum) $accum))
            (fold-nested $collect-vars () $expr))
         ())))

(= (skolemize $rule $expra $exprb)
   (if (or (is-var $exprb) (is-var $expra)) $exprb
      (let*
         (($avars (list_to_set (extract-vars $expra)))
           ($bvars (list_to_set (extract-vars $exprb)))
           ($onlyb (\== $bvars $avars))
           ($substitute (|-> (($idx $atom) $elem) (let $elem (exists $rule $idx $avars) ((+ 1 $idx) $atom))))
           (($_ $res) (sealed $onlyb (fold-flat $substitute (0 $exprb) $onlyb))))
         $res)))

(= (addidx (cons $head $tail) $idx) (cons ($head $idx) (addidx $tail (+ $idx 1))))
(= (addidx () $idx) ())

; Translate a sequence into the conjunction form used by existing compilation logic.
(= (seq2expr (cons $head $tail)) (if (== $tail ()) $head (cons And (cons $head $tail))))

(= (compile-outputs ((@ $type (cons $head $tail)) $kb $NNprf $NNtv))
   (if (and (not (is-var $head)) (is-member $head (And Or LikelierThan)))
      (let $to-proj
         (|-> (($elem $idx))
            ((($type $kb $prf $tvin) (CPU (atom_concat $head Projection) ($tvin) -> $tvout)) |-
               (($elem $kb (proj $idx $prf) $tvout))))
         (let $cmp-out (|-> (($elem $_)) (compile-outputs ($elem $kb $prfn $tvn)))
            (let $idtail (addidx $tail 0) (&^& $to-proj $cmp-out (superpose $idtail)))))
      (empty)))

(= (compile-foldall-query $kb $pattern) (collapse (mm2compileQuery $kb (: $prf $pattern $tvin))))

(= (inline-premise $kb $premise)
   (if (= $premise (Compute $f $args -> $res)) (CPU $f $args -> $res)
      (if (= $premise (Map2Dist $fun $a $b -> $out)) (CPU Map2DistRuntimeFormula ($kb $fun $a $b) -> $out)
         (if (= $premise (AverageDist $pattern -> $out)) (CPU DistAverageFormula ($kb $pattern) -> $out)
            (if (= $premise (FoldAllValue $pattern $value $init $fun -> $out))
               (CPU FoldAllTVRuntimeFormula ($kb $pattern $init $fun) -> $out)
               (if (= $premise (FoldAll $pattern $value $init $fun -> $out))
                  (let $qplan (compile-foldall-query $kb $pattern)
                     (CPU FoldAllFormulaCompiled ($qplan $pattern $value $init $fun) -> $out))
                  $premise))))))

(= (inline-premises $kb ()) ())
(= (inline-premises $kb (cons $h $t)) (cons (inline-premise $kb $h) (inline-premises $kb $t)))

(= (cpu-premise-tv-formula $f)
   (is-member $f
      (() NotFormula
         DistGreaterThanFormula
         DistGreaterThanDistFormula
         DistMapFormula
         DistMap2Formula
         DistAverageFormula
         Map2DistRuntimeFormula
         FoldAllTVFormulaCompiled
         FoldAllTVPatternFormula
         FoldAllTVRuntimeFormula
         FoldAllValueFormulaCompiled)))

(= (cpu-premise-tv $f $args $res) (if (cpu-premise-tv-formula $f) $res (STV 1.0 1.0)))

(= (in_map $kb $elem)
   (if (= $elem (CPU $f $args -> $res))
      (prem ((CPU $f $args -> $res) $kb $prf (cpu-premise-tv $f $args $res))
         (CPU $f $args -> $res)
         (cpu-premise-tv $f $args $res)
         cpu)
      (prem ($elem $kb $prf $tv) $elem $tv $prf)))

;Helper to match only on the tv of a statement
(= (tv $tv) ($elem $kb $prf $tv))
(= (tv $tv) (CPU $formula $args -> $tv))

(=
   (in_fold $formula
      ((@ $premises (head (tv $tv))) ($ccltype $kb $cclprf $ccltv))
      (prem $goal $elem $tve $prfelem))
   ((cons (CPU $formula ($tv $tve) -> $ntv) (cons $goal $premises))
      ((cons $elem $ccltype) $kb (cons $prfelem $cclprf) $ntv)))

(= (inTemplate $kb $formula $head $tail)
   (let*
      (((cons (@ $fst (prem $fstgoal $fstelem $fsttv $fstprf)) $rst) (map-flat (in_map $kb) $tail))
        ($init (($fstgoal) (($fstelem) $kb ($fstprf) $fsttv)))
        (($resNNprms ($ccltype $kb $cclprf $ccltv)) (fold-flat (in_fold $formula) $init $rst))
        (($rcclprf $rccltype) ((reverse $cclprf) (reverse $ccltype))))
      ((reverse $resNNprms) |- (((cons $head $rccltype) $kb (cons conjunction $rcclprf) $ccltv)))))

;(= (inTemplate $kb $formula $head $tail)
; (let* (((cons (@ $fst (: $kb $fstprf $fstelem $fsttv)) $rst) (map-flat (in_map $kb) $tail))
;        ($init (($fst) (: $kb ($fstprf) ($fstelem) $fsttv)))
;        (($resNNprms (: $kb $cclprf $ccltype $ccltv)) (fold-flat (in_fold $formula) $init $rst))
;        (($rcclprf $rccltype) ((reverse $cclprf) (reverse $ccltype)))
;       )
;     ((reverse $resNNprms) |- ((: $kb (cons conjunction $rcclprf) (cons $head $rccltype) $ccltv)))))
(= (compile-inputs ((CPU $f $args -> $res) $kb $prf $tv))
   ((cons (CPU $f $args -> $res) ()) |-
      (((CPU $f $args -> $res) $kb cpu (cpu-premise-tv $f $args $res)))))
(= (compile-inputs ((cons $head $tail) $kb $prf $tv))
   (if (and (not (is-var $head)) (is-member $head (And Or LikelierThan)))
      (superpose ((inTemplate $kb (atom_concat $head Formula) $head $tail)
                  (compile-inputs ((superpose $tail) $kb $prf $tv))))
      (empty)))

(= (uPmapf2 $elem $accum)
   (if (= $elem ($type ($kbid $ctx $vars) $prfa $tv))
      (case $type (
           ((Not $a) (cons ($a ($kbid $ctx $vars) $prfa $tv_a) (cons (CPU NotFormula ($tv_a) -> $tv) $accum)))
           ((MapDist $fun $a -> $out)
              (cons ($a ($kbid $ctx $vars) $prfa $tv_a)
                 (cons (CPU DistMapFormula ($fun $tv_a) -> $out) $accum)))
           ((Map2Dist $fun $a $b -> $out)
              (cons ($b ($kbid $ctx $vars) $prfb $tv_b)
                 (cons ($a ($kbid $ctx $vars) $prfa $tv_a)
                    (cons (CPU DistMap2Formula ($fun $tv_a $tv_b) -> $out) $accum))))
           ((AverageDist $pattern -> $out)
              (cons (CPU DistAverageFormula (($kbid $ctx $vars) $pattern) -> $out) $accum))
           (($rel $a $b)
              (if (is-member $rel (GreaterThan >))
                 (if (is-expr $b)
                    (cons ($b ($kbid $ctx $vars) $prfb $tv_b)
                       (cons ($a ($kbid $ctx $vars) $prfa $tv_a)
                          (cons (CPU DistGreaterThanDistFormula ($tv_a $tv_b) -> $tv) $accum)))
                    (cons ($a ($kbid $ctx $vars) $prfa $tv_a)
                       (cons (CPU DistGreaterThanFormula ($tv_a $b) -> $tv) $accum)))
                 (cons $elem $accum)))
           ($other (cons $elem $accum))))
      (cons $elem $accum)))

(= (updatePremises $premises) (foldr-flat uPmapf2 () $premises))

(= (postCore ($premises |- $conclusions) $actionB $actionA)
   (let $npremises (updatePremises $premises)
      (if (and (= $conclusions (($type ($kbid $ctx $vars) $prf $tv))) (not (is-var $type)))
         (if (= $type (Implication (cons Premises $apremises) (cons Conclusions $bconclusions)))
            (let $a (seq2expr $apremises)
               (let $b (seq2expr $bconclusions)
                  (superpose (
                       (post
                          ((union-atom $npremises
                                (($a ($kbid $ctx $vars) $prfa $atv) (CPU MpFormula ($atv $tv) -> $btv)))
                             |-
                             (($b ($kbid $ctx $vars) ($prf $prfa) $btv)))
                          ($actionB $b)
                          ($actionA $a)))))
               (if (and (= $type ($relation $a) (== $relation Not)))
                  (post
                     ((union-atom $npremises ((CPU NotFormula ($tv) -> $ntv))) |-
                        (($a ($kbid $ctx $vars) $prf $ntv))))
                  ($npremises |- $conclusions)))
            ($npremises |- $conclusions)))))

(= (post $stmt) (postCore $stmt compile-outputs compile-inputs))

(= (postQuery $stmt) (postCore $stmt compile-inputs compile-outputs))


(= (compile) (.: post compile_))

(= (kbctx $kb) (if (is-expr $kb) $kb ($kb MAIN Nil)))

(= (implication $kb $prf $a $b $itv)
   ((($a ($kb $ctx $vars) $prfa $atv) (CPU MpFormula ($itv $atv) -> $btv)) |-
      (($b ($kb $ctx $vars) ($prf $prfa) $btv))))

(= (map-nested2 $f ()) ())
(= (map-nested2 $f (cons $x $xs))
   (if (is-expr $x) ($f (cons (map-nested2 $f $x) (map-nested2 $f $xs)))
      ($f (cons ($f $x) (map-nested2 $f $xs)))))

(= (toQuery $elem) (if (is-var $elem) # (if (=? $elem (exists $_1 $_2 $_3)) $var $elem)))

(= (inverse-implication $kb $prf $a $b $itv)
   (let $a1 (map-nested2 toQuery $a)
      (let $b1 (map-nested2 toQuery $b)
         ((($a1 ($kb $ctx $vars) $prfa $atv) ($b1 ($kb $ctx $vars) $prfb $btv)
               (CPU InversionFormula ($atv $btv $itv) -> $iitv)
               ($b ($kb $ctx $vars) $prfb $btv)
               (CPU MpFormula ($iitv $btv) -> $atv))
            |-
            (($a ($kb $ctx $vars) ((inverted $prf with $prfxa $prfax $prfxb $prfbx) $prfb) $atv))))))


(= (compile_ $kb (@ $stmt (: $prf $Type $tv)))
   (if (is-var $Type) (empty)
      (if (= $Type (Implication (cons Premises $premises) (cons Conclusions $conclusions)))
         (let*
            (($a (seq2expr (inline-premises $kb $premises)))
              ($b (seq2expr $conclusions))
              ($nb (skolemize $prf $a $b))
              ($na (skolemize $prf $b $a)))
            (superpose ((implication $kb $prf $a $nb $tv)
                        (if (is-var $nb) (empty) (compile-outputs ($nb (kbctx $kb) ($prf $prfa) $btv)))
                        (if (is-var $a) (empty) (compile-inputs ($a (kbctx $kb) $prfa $atv)))
                        (if (not (= $prf (mined_implication $_ $_)))
                           (inverse-implication $kb
                              $prf
                              $na
                              $b
                              $tv)
                           (empty))
                        (if (is-var $na) (empty)
                           (compile-outputs ($na ((inverted $prf $pa $pb1) $pb2) $pb2 $natv)))
                        (if (is-var $b) (empty) (compile-inputs ($b $pb2 $pb2 $btv2))))))
         (superpose ((() |- (($Type ($kb MAIN Nil) $prf $tv)))
                     (compile-outputs ($Type ($kb MAIN Nil) $prf $tv)))))))


(= (compileQuery $kb (: $prf $Type $tv))
   (if (is-var $Type) ((() |- (($Type (kbctx $kb) $prf $tv))) ())
      (if (= $Type (Implication (cons Premises $premises) (cons Conclusions $conclusions)))
         (let*
            (($a (seq2expr (inline-premises $kb $premises)))
              ($b (seq2expr $conclusions)))
            ((postQuery ((($a (kbctx $kb) $prfa (STV 1.0 1.0))) |- (($b (kbctx $kb) $prfb $itv))))
               (collapse
                  (postQuery
                     (superpose ((compile-inputs ($b (kbctx $kb) $prfb $btv))
                                 (compile-outputs ($a (kbctx $kb) $prfa $atv))))))))
         ((postQuery (() |- (($Type (kbctx $kb) $prf $tv))))
            (collapse (postQuery (compile-inputs ($Type (kbctx $kb) $prf $tv))))))))


(= (mm2compile $kb $stmt)
   (progn (remove-all-atoms ctx) (superpose ((mm2stmt (compile $kb $stmt)) (get-atoms ctx)))))

(= (mm2stmt $stmt) (case $stmt (((() |- ($ccl)) $ccl) (($prms |- ($ccl)) (rules ($prms |- $ccl))))))


(= (mm2compileQuery $kb $stmt)
   (case (compileQuery $kb $stmt) (
        (((() |- ($ccl)) $adds)
           (let $tail (map-flat mm2stmt $adds) (let $lst (cons (goal $ccl) $tail) (superpose $lst))))
        ((((($type ($kbid $_ctx $_vars) $prf $tv)) |- (($type1 ($kbid $_ctx $_vars) $prf1 $tv1))) $adds)
           (let $vars (extract-vars $type)
              (let $mvars (if (== $vars ()) Nil $vars)
                 (let $ctx (nextctx)
                    (let $ctxatom ($type ($kbid $ctx $mvars) (ctx proof $ctx) $tv)
                       (let $goalatom (goal ($type1 ($kbid $ctx $mvars) $prf1 $tv1))
                          (let $tail (map-flat mm2stmt $adds)
                             (let $lst (union-atom ($goalatom $ctxatom) $tail) (superpose $lst)))))))))
        ($a (notsupported mm2compileQuery $kb $stmt $a)))))

(= (checkStmt $stmt)
   (and (= $stmt (: $prf $type $tv))
      (and (not (is-var $prf))
         (or (= $type (Implication (cons Premises $premises) (cons Conclusions $conclusions)))
            (== (extract-vars $type) ())))))

(= (checkQuery $query) (= $query (: $prf $type $tv)))

(= (mf $kb ($kb $t)) $t)

(= (pretty-prf-token $prf)
   (case $prf (
        ((mined_implication $premk $conck) (Implication (cons Premises ($premk)) (cons Conclusions ($conck))))
        ($other $other))))

(= (pretty-prf $prf) (if (is-expr $prf) (map-nested2 pretty-prf-token $prf) $prf))

(= (lookup-mined-tv $premk $conck $fallback-tv)
   (let $m
      (collapse (once (match (kbspace) ($itype ($kbid MAIN ()) (mined_implication $premk $conck) $itv) $itv)))
      (if (== $m ()) $fallback-tv (car-atom $m))))

(= (extract-mined-itv-from-args $args $fallback-tv)
   (if (= $args ($_prem (CPU MpFormula ($itv $_atv) -> $_btv))) $itv
      (if (= $args (cons $h $t))
         (if (= $h (CPU MpFormula ($itv $_atv2) -> $_btv2)) $itv
            (extract-mined-itv-from-args $t $fallback-tv))
         $fallback-tv)))

(= (pretty (: $prf $type $tv)) (: (pretty-prf $prf) $type $tv))
(= (pretty (rules ($args |- $goal)))
   (if (= $goal ($type $kb ((mined_implication $premk $conck) $p) $tv))
      (let*
         (($ptv
              (if (is-var $tv)
                 (let*
                    (($tv1 (extract-mined-itv-from-args $args $tv))
                      ($tv2 (lookup-mined-tv $premk $conck $tv1)))
                    $tv2)
                 $tv)))
         (: mined_implication ((pretty-prf-token (mined_implication $premk $conck)) $p) $type $ptv))
      (pretty $goal)))
(= (pretty ($type $kb $prf $tv))
   (if (is-expr $kb)
      (if (= $kb ($kbid MAIN Nil)) (: (pretty-prf $prf) $type $tv)
         (let ($_ $idx $vars) $kb
            (let $x (map-flat (mf $kb) (collapse (match (kbspace) ($t $kb $p $tv2) ($kb $t))))
               (: (pretty-prf $prf) (Implication (cons Premises $x) (cons Conclusions ($type))) $tv))))
      (: (pretty-prf $prf) $type $tv)))
