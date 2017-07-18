module prenex.

local pnx0 form -> form -> o.
pnx0 (P and Q) Y:- pnx P P1, pnx Q Q1, pullquants (P1 and Q1) Y.
pnx0 (P or Q) Y:- pnx P P1, pnx Q Q1, pullquants (P1 or Q1) Y.
pnx0 (Quant X \ P X) (Quant X \ Q X) :-
  quant Quant, !,
  pi X \ pnx (P X) (Q X).

pnx P Q:- reflc pnx0 P Q.

pnf X Y :- simplify X X1, nnf X1 X2, pnx X2 Y.


end
