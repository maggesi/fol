/* ========================================================================= */
/* Semantics for first order logic.                                          */
/* ========================================================================= */

module fol.

holds truth.
holds (and P Q) :- holds P, holds Q.
holds (exists x \ P x) :-
  domain N,
  pi x \ (termval x N => holds (P x)).
holds (forall x \ P x) :-
  domain N,
  (pi x \ (termval x N => not (holds (P x)))),
  !, fail.
holds (forall x \ P x).

end
