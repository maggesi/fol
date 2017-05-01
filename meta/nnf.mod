/*----------------Negation normal form----------------*/

module nnf.
accumulate fol, psimplify.

nnf1 truth truth.
nnf1 false false.
nnf1 (P and Q) (P1 and Q1) :- nnf1 P P1, nnf1 Q Q1.
nnf1 (P or Q) (P1 or Q1) :- nnf1 P P1, nnf1 Q Q1.
nnf1 (P imp Q) (P1 or Q1) :- nnf1 (neg P) P1, nnf1 Q Q1.
nnf1 (P iff Q) ((P1 and Q1) or (P2 and Q2)) :- nnf1 P P1, nnf1 Q Q1, nnf1 (neg P) P2, nnf1 (neg Q) Q2.
nnf1 (neg truth) (neg truth).
nnf1 (neg false) (neg false).
nnf1 (neg (neg P)) Y:- nnf1 P Y.
nnf1 (neg (P and Q)) (P1 or Q1) :- nnf1 (neg P) P1, nnf1 (neg Q) Q1.
nnf1 (neg (P or Q)) (P1 and Q1) :- nnf1 (neg P)P1, nnf1 (neg Q) Q1.
nnf1 (neg (P imp Q)) (P1 and Q1) :- nnf1 P P1, nnf1 (neg Q) Q1.
nnf1 (neg (P iff Q)) ((P1 and Q1) or (P2 and Q2)) :- nnf1 P P1, nnf1 (neg Q) Q1, nnf1 (neg P) P2, nnf1 Q Q2.
nnf1 (forall P) (forall P).
nnf1 (exists P) (exists P).

nnf P Y:- psimplify P P1, nnf1 P1 Y. 







end