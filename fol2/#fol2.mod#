/* ========================================================================= */
/* Predicate logic.                                                          */
/* ========================================================================= */

module fol2.

/* ------------------------------------------------------------------------- */
/* Library.                                                                  */
/* ------------------------------------------------------------------------- */

append [] Xs Xs.
append (X :: Xs) Ys (X :: Zs) :- append Xs Ys Zs.

map F [] [].
map F (X :: Xs) (Y :: Ys) :- F X Y, map F Xs Ys.

unions [] [].
unions (X :: Xs) Ys :- unions Xs Zs, append X Zs Ys.

/* ------------------------------------------------------------------------- */
/* Terms.                                                                    */
/* ------------------------------------------------------------------------- */

% termval (string -> list term -> A) -> term -> A -> o.
termval I (fn F Args) X :- map (termval I) Args Args', I F Args' X.

/* ------------------------------------------------------------------------- */
/* Formulas.                                                                 */
/* ------------------------------------------------------------------------- */

holds _ _ _ truth.
holds D M I (atom R Tm) :- termval I Tm X, M R X.
holds D M I (and P Q) :- holds D M I P, holds D M I Q.
holds D M I (forall x \ P x) :-
  pi a \ myd a => pi x \ termval I x a => holds D M I (P x).

/* ------------------------------------------------------------------------- */
/* My model.                                                                 */
/* ------------------------------------------------------------------------- */

myi "0" [] 0.
myi "suc" [M] N :- N is M + 1.
myi "+" [M,N] P :- P is M + N.
myi "-" [M,N] P :- P is M - N.
myi "*" [M,N] P :- P is M * N.

mym "iszero" 0.

myd 0.
myd 1.
myd 2.

myfol (forall x \ (atom "iszero" x)).
%myfol (and truth truth).

test :- myfol Fm, holds myd mym myi Fm.

end
