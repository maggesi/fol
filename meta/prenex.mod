module prenex.

accumulate simplify, psimplify, fol, pullquants, nnf.

pnx (forall X \ P X) (forall X \ P1 X)  :- pnx (forall X \ P X) (forall X \ P1 X).
pnx (exists X \ P X) (forall X \ P1 X)  :- pnx (exists X \ P X) (exists X \ P1 X).

pnx (and P Q) Y:- pnx P P1, pnx Q Q1, pullquants (and P1 Q1) Y.
pnx (or P Q) Y:- pnx P P1, pnx Q Q1, pullquants (or P1 Q1) Y.

pnx truth truth.
pnx false false.

pnf X Y :- simplify X X1, nnf X1 X2, pnx X2 Y.