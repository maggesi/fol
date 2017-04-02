/*----------------Negation normal form----------------*/

module nnf.
accumulate fol, psimplify.

nnf truth truth.
nnf false false.
nnf (and P Q) (and P1 Q1) :- nnf P P1, nnf Q Q1.
nnf (or P Q) (or P1 Q1) :- nnf P P1, nnf Q Q1.
nnf (imp P Q) (or P1 Q1) :- nnf (neg P) P1, nnf Q Q1.
nnf (iff P Q) (or (and P1  Q1) (and P2 Q2)) :- nnf P P1, nnf Q Q1, nnf (neg P) P2, nnf (neg Q) Q2.
nnf (neg truth) (neg truth).
nnf (neg false) (neg false).
nnf (neg (neg P)) Y:- nnf P Y.
nnf (neg (and P Q)) (or P1 Q1) :- nnf (neg P) P1, nnf (neg Q) Q1.
nnf (neg (or P Q)) (and P1 Q1) :- nnf (neg P)P1, nnf (neg Q) Q1.
nnf (neg (imp P Q)) (and P1 Q1) :- nnf P P1, nnf (neg Q) Q1.
nnf (neg (iff P Q)) (or (and P1 Q1) (and P2 Q2)) :- nnf P P1, nnf (neg Q) Q1, nnf (neg P) P2, nnf Q Q2.

nnfrec P Y:- psimplify P P1, nnf P1 Y. 

example Y:- nnf (neg (neg truth)) Y.
example1 Y:- nnf (and truth false) Y.
example2 Y:- nnf (or false truth) Y.
example3 Y:- nnf (imp false truth) Y.
example4 Y:- nnf (or (imp truth false) truth) Y.

example5 Y:- nnfrec (or (imp truth false) truth) Y.

end