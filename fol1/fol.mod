/* ========================================================================= */
/* Semantics for first order logic.                                          */
/* ========================================================================= */

/* ------------------------------------------------------------------------- */
/* This module assumes that the evaluation for terms (predicates termval     */
/* and domain) are defined elsewhere.                                        */
/* ------------------------------------------------------------------------- */

module fol.

holds truth.
holds (neg P) :- not (holds P).
holds (and P Q) :- holds P, holds Q.
holds (or P Q) :- holds P; holds Q.
holds (imp P Q) :- holds Q; not (holds P).
holds (iff P Q) :- holds P, holds Q.
holds (iff P Q) :- not(holds P), not (holds Q).
holds (exists x \ P x) :-
  domain N,
  pi x \ (termval x N => holds (P x)).
holds (forall x \ P x) :-
  domain N,
  (pi x \ (termval x N => not (holds (P x)))),
  !, fail.
holds (forall x \ P x).

end
