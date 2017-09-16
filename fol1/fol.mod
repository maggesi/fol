/* ========================================================================= */
/* Semantics for first order logic.                                          */
/* ========================================================================= */

/* ------------------------------------------------------------------------- */
/* This module assumes that the evaluation for terms (predicates termval     */
/* and domain) are defined elsewhere.                                        */
/* ------------------------------------------------------------------------- */

module fol.

/* ------------------------------------------------------------------------- */
/* Domain.                                                                   */
/* ------------------------------------------------------------------------- */

ex  P :- sigma A \ (domain A, P A, !).
all P :- not (ex (A \ not(P A))).

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

extend X A _ X A.
extend _ _ V X A :- V X A.

termval V X A :- V X A.

/* ------------------------------------------------------------------------- */
/* Interpretation of formulas.                                               */
/* ------------------------------------------------------------------------- */

holds _ truth.
holds V (neg P) :- not (holds V P).
holds V (and P Q) :- holds V P, holds V Q.
holds V (or P _) :- holds V P, !.
holds V (or _ Q) :- holds V Q.
holds V (imp _ Q) :- holds V Q, !.
holds V (imp P _) :- not (holds V P).
holds V (iff P Q) :- holds V P, !, holds V Q.
holds V (iff P Q) :- not(holds V P), not (holds V Q).
holds V (exists P) :- pi x \  ex (A \ holds (extend x A V) (P x)).
holds V (forall P) :- pi x \ all (A \ holds (extend x A V) (P x)).

topholds P :- holds (termval emptyenv) P.

end
