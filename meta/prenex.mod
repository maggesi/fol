module prenex.

accumulate simplify, psimplify, fol, pullquants, nnf.

/*
Prenex in Higher order Logic Programming by Nadathur and Miller
prenex false false.    --------> simplify: elimina quant (se x non è libera): x\Px <-> P
       	     	       		 nnf: forma normale negativa   ----> usa psimplify che semplifica
				 pnx --------> usa pullquants che porta Quant fuori.
prenex truth truth.
prenex B B :- atom B.
prenex (B and C) (U and V):- prenex B U, prenex C V. %(merge (and U V) D).
...
prenex (forall X \ P X)  (forall X \ D X):- pi x\ (term x) => (prenex (B x) (D x)).  
...
merge (and (all B) (all C)) all D:- pi x \ (term x) => merge (and (B x) C) (D x).
*/
pnx (Quant X \ P X) (Quant X \ Q X) :-
  (Quant = forall; Quant = exists), !,
  pi X \ pnx (P X) (Q X).
pnx (P and Q) Y:- !,
  pnx P P1, pnx Q Q1, pullquants (P1 and Q1) Y.
pnx (P or Q) Y:- !,
  pnx P P1, pnx Q Q1, pullquants (P1 or Q1) Y.
pnx P P.

/* secondo me bisogna aggiungere:

pnx truth truth.
pnx false false.

ed eliminare pnx P P */

pnf X Y :- simplify X X1, nnf X1 X2, pnx X2 Y.

end
