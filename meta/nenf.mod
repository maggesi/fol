module nenf.
accumulate fol, psimplify.
/*
let rec nenf fm =
match fm with
Not(Not p) -> nenf p
| Not(And(p,q)) -> Or(nenf(Not p),nenf(Not q))
| Not(Or(p,q)) -> And(nenf(Not p),nenf(Not q))
| Not(Imp(p,q)) -> And(nenf p,nenf(Not q))
| Not(Iff(p,q)) -> Iff(nenf p,nenf(Not q))
| And(p,q) -> And(nenf p,nenf q)
| Or(p,q) -> Or(nenf p,nenf q)
| Imp(p,q) -> Or(nenf(Not p),nenf q)
| Iff(p,q) -> Iff(nenf p,nenf q)
| _ -> fm;;

let nenf fm = nenf(psimplify fm);;
*/
nenf truth truth.
nenf false false.
nenf (neg (and P Q)) (or P1 Q1):- nenf (neg P) P1, nenf (neg Q) Q1. 
nenf (neg (or P Q)) (and P1 Q1):- nenf (neg P) P1, nenf (neg Q) Q1.
nenf (neg (imp P Q)) (and P1 Q1):- nenf P P1, nenf (neg Q) Q1.
nenf (neg (iff P Q)) (iff P1 Q1):- nenf P P1, nenf (neg Q) Q1.
nenf (and P Q) (and P1 Q1):- nenf P P1, nenf Q Q1.
nenf (or P Q) (or P1 Q1):- nenf P P1, nenf Q Q1.
nenf (imp P Q) (or P1 Q1) :- nenf (neg P) P1, nenf Q Q1.
nenf (iff P Q) (iff P1 Q1):- nenf P P1, nenf Q Q1.
nenf (neg false) (neg false).
nenf (neg truth) (neg truth).

%let nenf fm = nenf(psimplify fm);;
nenfrec P Y:- psimplify P P1, nenf P1 Y. 