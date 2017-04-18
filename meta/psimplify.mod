module psimplify.

psimplify1 (neg truth) false.
psimplify1 (neg false) truth.
psimplify1 (neg (neg P)) P.
psimplify1 (P and false) false.
psimplify1 (false and P) false.
psimplify1 (truth and P) P.
psimplify1 (P and truth) P.
psimplify1 (P or false) P.
psimplify1 (false or P) P.
psimplify1 (truth or P) truth. 
psimplify1 (P or truth) truth. 
psimplify1 (truth imp false) false.
psimplify1 (false imp P) truth. 
psimplify1 (truth imp truth) truth.
psimplify1 (false iff false) truth.
psimplify1 (truth iff truth) truth.
psimplify1 (truth iff false) false.
psimplify1 (false iff truth) false.
psimplify1 truth truth.
psimplify1 false false.

psimplify (neg P) Y:- psimplify P P1, psimplify1 (neg P1) Y.
psimplify (P and Q) Y:- psimplify P P1, psimplify Q Q1, psimplify1 (P1 and Q1) Y.
psimplify (P or Q) Y:- psimplify P P1, psimplify Q Q1, psimplify1 (P1 or Q1) Y.
psimplify (P imp Q) Y:- psimplify P P1, psimplify Q Q1, psimplify1 (P1 imp Q1) Y.
psimplify (P iff Q) Y:- psimplify P P1, psimplify Q Q1, psimplify1 (P1 iff Q1) Y.
psimplify truth truth.
psimplify false false.

%example Q :- psimplify (and (or (neg false) truth) truth) Q.
example Q :- psimplify ((neg false) or truth and truth) Q.
