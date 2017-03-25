module psimplify.

psimplify1 (neg truth) false.
psimplify1 (neg false) truth.
psimplify1 (neg (neg P)) P.
psimplify1 (and P false) false. %truth-false false-false
psimplify1 (and false P) false. %false-truth
psimplify1 (and truth truth) truth. %truth-truth
psimplify1 (or P false) P. %false-false truth-false
psimplify1 (or false P) P. %false-truth
psimplify1 (or truth truth) truth. %truth-truth
psimplify1 (imp truth false) false. %truth-false
psimplify1 (imp false P) truth. %false-truth false-false
psimplify1 (imp truth truth) truth. %truth-truth
psimplify1 (iff false false) truth.
psimplify1 (iff truth truth) truth.
psimplify1 (iff truth false) false.
psimplify1 (iff false truth) false.
psimplify1 truth Q:- Q = truth.
psimplify1 false Q:- Q = false.

psimplify (neg P) Y:- psimplify P P1, psimplify1 (neg P1) Y.
psimplify (and P Q) Y:- psimplify P P1, psimplify Q Q1, psimplify1 (and P1 Q1) Y.
psimplify (or P Q) Y:- psimplify P P1, psimplify Q Q1, psimplify1 (or P1 Q1) Y.
psimplify (imp P Q) Y:- psimplify P P1, psimplify Q Q1, psimplify1 (imp P1 Q1) Y.
psimplify (iff P Q) Y:- psimplify P P1, psimplify Q Q1, psimplify1 (iff P1 Q1) Y.
psimplify P Y:- psimplify1 P Y.




example Q :- psimplify (and (or (neg false) truth) truth) Q.