module nnf.

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