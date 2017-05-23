/*----------------Negation normal form----------------*/

module nnf.
/* --------Harrison pag 141
let rec nnf fm =
match fm with
And(p,q) -> And(nnf p,nnf q)
| Or(p,q) -> Or(nnf p,nnf q)
| Imp(p,q) -> Or(nnf(Not p),nnf q)
| Iff(p,q) -> Or(And(nnf p,nnf q),And(nnf(Not p),nnf(Not q)))
| Not(Not p) -> nnf p
| Not(And(p,q)) -> Or(nnf(Not p),nnf(Not q))
| Not(Or(p,q)) -> And(nnf(Not p),nnf(Not q))
| Not(Imp(p,q)) -> And(nnf p,nnf(Not q))
| Not(Iff(p,q)) -> Or(And(nnf p,nnf(Not q)),And(nnf(Not p),nnf q))
| Forall(x,p) -> Forall(x,nnf p)
| Exists(x,p) -> Exists(x,nnf p)
| Not(Forall(x,p)) -> Exists(x,nnf(Not p))
| Not(Exists(x,p)) -> Forall(x,nnf(Not p))
| _ -> fm;;
*/

nnf truth truth.
nnf false false.
nnf (atom S Xs) (atom S Xs).
nnf (P and Q) (P1 and Q1) :- nnf P P1, nnf Q Q1.
nnf (P or Q) (P1 or Q1) :- nnf P P1, nnf Q Q1.
nnf (P imp Q) (P1 or Q1) :- nnf (neg P) P1, nnf Q Q1.
nnf (P iff Q) ((P1 and Q1) or (P2 and Q2)) :- nnf P P1, nnf Q Q1, nnf (neg P) P2, nnf (neg Q) Q2.
nnf (neg truth) (neg truth).
nnf (neg false) (neg false).
nnf (neg (atom S Xs)) (neg (atom S Xs)).
nnf (neg (neg P)) Y:- nnf P Y.
nnf (neg (P and Q)) (P1 or Q1) :- nnf (neg P) P1, nnf (neg Q) Q1.
nnf (neg (P or Q)) (P1 and Q1) :- nnf (neg P)P1, nnf (neg Q) Q1.
nnf (neg (P imp Q)) (P1 and Q1) :- nnf P P1, nnf (neg Q) Q1.
nnf (neg (P iff Q)) ((P1 and Q1) or (P2 and Q2)) :- nnf P P1, nnf (neg Q) Q1, nnf (neg P) P2, nnf Q Q2.
nnf (forall X\ P X) (forall X\ P1 X) :- pi X \ nnf (P X) (P1 X).
nnf (exists X\ P X) (exists X\ P1 X) :- pi X \ nnf (P X) (P1 X).
nnf (neg (forall X\ P X)) (exists X\ P1 X) :- pi X \ nnf (neg (P X)) (P1 X).
nnf (neg (exists X\ P X)) (forall X\ P1 X) :- pi X \ nnf (neg (P X)) (P1 X).







end