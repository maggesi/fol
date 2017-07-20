module simplify.


local simplify2 form -> form -> o.
simplify2 (Quant X \ P) P :- (Quant = forall; Quant = exists).
simplify2 P X:- psimplify P X.

local simplify1 form -> form -> o.
simplify1 P Q:- reflc simplify2 P Q.

local simplify0 form -> form -> o.
simplify0 (neg P) Y:- simplify P P1, simplify1 (neg P1) Y.
simplify0 (P and Q) Y:- simplify P P1, simplify Q Q1, simplify1 (P1 and Q1) Y.
simplify0 (P or Q) Y:- simplify P P1, simplify Q Q1, simplify1 (P1 or Q1) Y.
simplify0 (P imp Q) Y:- simplify P P1, simplify Q Q1, simplify1 (P1 imp Q1) Y.
simplify0 (P iff Q) Y:- simplify P P1, simplify Q Q1, simplify1 (P1 iff Q1) Y.
simplify0 (forall X\ P X) Y:- (pi X \ simplify (P X) (P1 X)), simplify1 (forall X\ P1 X) Y.
simplify0 (exists X\ P X) Y:- (pi X \ simplify (P X) (P1 X)), simplify1 (exists X\ P1 X) Y.


simplify P Q:- reflc simplify0 P Q.

end