/*----------------Negation normal form----------------*/

module nnf.
accumulate fol.

/* In Harrison:
let rec nnf fm =
match fm with
| And(p,q) -> And(nnf p, nnf q)
| Or(p,q) -> Or(nnf p,nnf q)
| Imp(p,q) -> Or(nnf(Not p),nnf q)
| Iff(p,q) -> Or(And(nnf p,nnf q),And(nnf(Not p),nnf(Not q)))
| Not(Not p) -> nnf p
| Not(And(p,q)) -> Or(nnf(Not p),nnf(Not q))
| Not(Or(p,q)) -> And(nnf(Not p),nnf(Not q))
| Not(Imp(p,q)) -> And(nnf p,nnf(Not q))
| Not(Iff(p,q)) -> Or(And(nnf p,nnf(Not q)),And(nnf(Not p),nnf q))
| _ -> fm;;
with simplification:
let nnf fm = nnf(psimplify fm);;
*/

%nnf truth truth.
%nnf false false :- !.
nnf (neg P) (neg P).
nnf (neg (neg P)) Y:- nnf P Y.
nnf (and P Q) Y:- nnf P P1, nnf Q Q1,
    	Y = (and P1 Q1).
nnf (or P Q) Y:- nnf P P1, nnf Q Q1,
    	Y = (or P1 Q1).
nnf (imp P Q) Y:- nnf (neg P) P1, nnf Q Q1,
    	Y = (imp P1 Q1).
nnf (iff P Q) Y:- nnf P P1, nnf Q Q1, nnf (neg P) P2, nnf (neg Q) Q2,
    	Y = (or (and P1  Q1) (and P2 Q2)).
nnf (neg (and P Q)) Y:- nnf (neg P) P1, nnf (neg Q) Q1,
    	Y = (or P1 Q1). 
nnf (neg (or P Q)) Y:- nnf (neg P)P1, nnf (neg Q) Q1,
    	Y = (and P1 Q1).
nnf (neg (imp P Q)) Y:- nnf P P1, nnf (neg Q) Q1,
    	Y = (and P1 Q1).
nnf (neg (iff P Q)) Y:- nnf P P1, nnf (neg Q) Q1, nnf (neg P) P2, nnf Q Q2,
    	Y = (or (and P1 Q1) (and P2 Q2)).

example Y:- nnf (neg (neg P)) Y.
example1 Y:- nnf (and P Q) Y.
example2 Y:- nnf (or P Q) Y.
example3 Y:- nnf (imp P Q) Y.
example4 Y:- nnf (or (imp P Q) R) Y.



end