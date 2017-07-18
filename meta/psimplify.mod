module psimplify.


local psimplify2 form -> form -> o.
psimplify2 (neg truth) false.
psimplify2 (neg false) truth.
psimplify2 (neg (neg P)) P.
psimplify2 (P and false) false.
psimplify2 (false and P) false.
psimplify2 (truth and P) P.
psimplify2 (P and truth) P.
psimplify2 (P or false) P.
psimplify2 (false or P) P.
psimplify2 (truth or P) truth. 
psimplify2 (P or truth) truth. 
psimplify2 (truth imp P) P.
psimplify2 (false imp P) truth. 
psimplify2 (P imp false) (neg P).
psimplify2 (P imp truth) P.
psimplify2 (P iff truth) P.
psimplify2 (truth iff P) P.
psimplify2 (false iff false) truth.
psimplify2 (P iff false) (neg P).
psimplify2 (false iff P) (neg P).

local psimplify1 form -> form -> o.
psimplify1 P Q:- reflc psimplify2 P Q.

local psimplify0 form -> form -> o.
psimplify0 (neg P) Y:- psimplify P P1, psimplify1 (neg P1) Y.
psimplify0 (P and Q) Y:- psimplify P P1, psimplify Q Q1, psimplify1 (P1 and Q1) Y.
psimplify0 (P or Q) Y:- psimplify P P1, psimplify Q Q1, psimplify1 (P1 or Q1) Y.
psimplify0 (P imp Q) Y:- psimplify P P1, psimplify Q Q1, psimplify1 (P1 imp Q1) Y.
psimplify0 (P iff Q) Y:- psimplify P P1, psimplify Q Q1, psimplify1 (P1 iff Q1) Y.

psimplify P Q:- reflc psimplify0 P Q.


