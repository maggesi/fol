accumulate smallcheck.

/* ------------------------------------------------------------------------- */
/* small_atom                                                                */
/* ------------------------------------------------------------------------- */

small_atom N (atom X) :- small_list [uu,vv,ww,xx,yy,zz] N X.

small_formula N P :- small_atom N P.
small_formula N (not P) :- M is N - 1, small_formula M P.
small_formula N (and P Q) :-
  M is N - 1, small_nat M K, L is M - K, small_atom K P, small_atom L Q.

check X :- onatoms testf (imp (atom x) (atom a)) X.

