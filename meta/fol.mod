/* ========================================================================= */
/* Semantics for first order logic.                                          */
/* ========================================================================= */

module fol.

accumulate lib.

/* ------------------------------------------------------------------------- */
/* Domain.                                                                   */
/* ------------------------------------------------------------------------- */

domain (model D _ _) A :- D A.
domex M P :- sigma A \ (domain M A, P A, !).
domall M P :- not (domex M (A \ not(P A))).

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

extend X A _ X A.
extend _ _ V X A :- V X A.

functor (model _ F _) S As A :- F S As A.

/*
termval _ V X A :- V X A.
termval M V (fn S Tms) A :- map (termval M V) Tms As, functor M S As A.
*/

local termvals model A -> (term -> A -> o) -> list term -> list A -> o.
termvals _ _ [] [].
termvals M V (X :: Xs) (A :: As) :- termval M V X A, termvals M V Xs As.
termval _ V X A :- V X A.
termval M V (fn S Tms) A :- termvals M V Tms As, functor M S As A.

/* ------------------------------------------------------------------------- */
/* Interpretation of atoms.                                                  */
/* ------------------------------------------------------------------------- */

relation (model _ _ W) S As :- W S As.

/* ------------------------------------------------------------------------- */
/* Interpretation of formulas.                                               */
/* ------------------------------------------------------------------------- */

holds _ _ truth.
%holds M V (atom S Tms) :- map (termval M V) Tms As, relation M S As.
holds M V (atom S Tms) :- termvals M V Tms As, relation M S As.
holds M V (neg P) :- not (holds M V P).
holds M V (P and Q) :- holds M V P, holds M V Q.
holds M V (P or Q) :- holds M V P; holds M V Q.
holds M V (P imp Q) :- holds M V Q; not (holds M V P).
holds M V (P iff Q) :- holds M V P, holds M V Q.
holds M V (P iff Q) :- not (holds M V P), not (holds M V Q).
holds M V (exists P) :- pi x \ domex  M (A \ holds M (extend x A V) (P x)).
holds M V (forall P) :- pi x \ domall M (A \ holds M (extend x A V) (P x)).

end
