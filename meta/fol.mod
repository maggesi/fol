/* ========================================================================= */
/* Semantics for first order logic.                                          */
/* ========================================================================= */

module fol.

/* ------------------------------------------------------------------------- */
/* Library.                                                                  */
/* ------------------------------------------------------------------------- */

map F nil nil.
map F (X :: Xs) (Y :: Ys) :- F X Y, map F Xs Ys.

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

termval _M V (var S) A :- V S A.
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
holds M V (and P Q) :- holds M V P, holds M V Q.
holds M V (or P Q) :- holds M V P; holds M V Q.
holds M V (imp P Q) :- holds M V Q; not (holds M V P).
holds M V (iff P Q) :- holds M V P, holds M V Q.
holds M V (iff P Q) :- not (holds M V P), not (holds M V Q).
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
