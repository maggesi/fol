/* ========================================================================= */
/* Semantics for first order logic.                                          */
/* ========================================================================= */

module fol.


/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

termval M V (var S) A :- V S A.
termval M V (fn S Tms) A :-
  M = model _ Func _,
  map (termval M V) Tms As,
  Func S As A.

holds M V (atom S Tms) :-
  map (termval M V) Tms As,
  M = model _ _ Pred,
  Pred S As.
holds _ _ truth.
holds M V (neg P) :- not (holds M V P).
holds M V (P and Q) :- holds M V P, holds M V Q.
holds M V (P or Q) :- holds M V P; holds M V Q.
holds M V (P imp Q) :- holds M V Q; not (holds M V P).
holds M V (P iff Q) :- holds M V P, holds M V Q.
holds M V (P iff Q) :- not (holds M V P), not (holds M V Q).

holds M V (exists x \ P x) :-
  M = model Domain _ _,
  Domain A,
  pi x \ termval M V x A => holds M V (P x).
holds M V (forall x \ P x) :-
  M = model Domain _ _,
  Domain A,
  (pi x \ termval M V x A => not (holds M V (P x))),
  !, fail.
holds _M _V (forall x \ _P x).


end
