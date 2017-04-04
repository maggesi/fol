module prenex.

accumulate simplify, psimplify, fol, pullquants, nnf.

pnx (Quant X \ P X) (Quant X \ Q X) :-
  (Quant = forall; Quant = exists), !,
  pi X \ pnx (P X) (Q X).
pnx (Op P Q) Y:-
  (Op = and; Op = or), !,
  pnx P P1, pnx Q Q1, pullquants (Op P1 Q1) Y.
pnx P P.

pnf X Y :- simplify X X1, nnf X1 X2, pnx X2 Y.

pnxtest A :- pnx (forall X \ truth) A.
pnxtest A :- pnx (forall X \ exists Y \ atom "=" (X :: Y :: nil)) A.
pnxtest A :- pnx (forall X \ and truth (exists Y \ atom "=" (X :: Y :: nil))) A.
