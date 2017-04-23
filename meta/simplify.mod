module simplify.

accumulate fol, lib, psimplify.

/*
In Harrison:
let simplify1 fm =
match fm with
  Forall(x,p) -> if mem x (fv p) then fm else p
| Exists(x,p) -> if mem x (fv p) then fm else p
| _ -> psimplify1 fm;;

let rec simplify fm =
match fm with
Not p -> simplify1 (Not(simplify p))
| And(p,q) -> simplify1 (And(simplify p,simplify q))
| Or(p,q) -> simplify1 (Or(simplify p,simplify q))
| Imp(p,q) -> simplify1 (Imp(simplify p,simplify q))
| Iff(p,q) -> simplify1 (Iff(simplify p,simplify q))
| Forall(x,p) -> simplify1(Forall(x,simplify p))
| Exists(x,p) -> simplify1(Exists(x,simplify p))
| _ -> fm;;
*/

/*-------------------simplify1------------------*/
%IDEA: if X is not a free variable, then forall x\ px is logically equivalent to p x.
simplify1 (Quant X \ P) P :- (Quant = forall; Quant = exists), !.
simplify1 (Quant X \ P X) (Quant X \ P X) :- (Quant = forall; Quant = exists), !.
simplify1 P X:- psimplify P X.

/*-------------------simplify-------------------*/

simplify (neg P) Y:- simplify P P1, simplify1 (neg P1) Y.
simplify (P and Q) Y:- simplify P P1, simplify Q Q1, simplify1 (P1 and Q1) Y.
simplify (P or Q) Y:- simplify P P1, simplify Q Q1, simplify1 (P1 or Q1) Y.
simplify (P imp Q) Y:- simplify P P1, simplify Q Q1, simplify1 (P1 imp Q1) Y.
simplify (P iff Q) Y:- simplify P P1, simplify Q Q1, simplify1 (P1 iff Q1) Y.
simplify (forall X\ P X) Y:- (pi X \ simplify (P X) (P1 X)), simplify1 (forall X\ P1 X) Y.
simplify (exists X\ P X) Y:- (pi X \ simplify (P X) (P1 X)), simplify1 (exists X\ P1 X) Y.
simplify truth truth.
simplify false false.

end