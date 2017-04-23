/*----------------Negation normal form----------------*/

module nnf.
accumulate fol, psimplify.

nnf truth truth.
nnf false false.
nnf (P and Q) (P1 and Q1) :- nnf P P1, nnf Q Q1.
nnf (P or Q) (P1 or Q1) :- nnf P P1, nnf Q Q1.
nnf (P imp Q) (P1 or Q1) :- nnf (neg P) P1, nnf Q Q1.
nnf (P iff Q) ((P1 and Q1) or (P2 and Q2)) :- nnf P P1, nnf Q Q1, nnf (neg P) P2, nnf (neg Q) Q2.
nnf (neg truth) (neg truth).
nnf (neg false) (neg false).
nnf (neg (neg P)) Y:- nnf P Y.
nnf (neg (P and Q)) (P1 or Q1) :- nnf (neg P) P1, nnf (neg Q) Q1.
nnf (neg (P or Q)) (P1 and Q1) :- nnf (neg P)P1, nnf (neg Q) Q1.
nnf (neg (P imp Q)) (P1 and Q1) :- nnf P P1, nnf (neg Q) Q1.
nnf (neg (P iff Q)) ((P1 and Q1) or (P2 and Q2)) :- nnf P P1, nnf (neg Q) Q1, nnf (neg P) P2, nnf Q Q2.
nnf (forall P) (forall P).
nnf (exists P) (exists P).

nnfrec P Y:- psimplify P P1, nnf P1 Y. 







end