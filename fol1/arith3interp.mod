/* ========================================================================= */
/* Interpetation of first order logic in the language of arith3.             */
/* ========================================================================= */

module arith3interp.

accumulate fol, arith3model.

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

termval zero 0.
termval one 1.
termval two 2.
termval (add X Y) P :- termval X M, termval Y N, add3 M N P.

/* ------------------------------------------------------------------------- */
/* Interpretation of predicates.                                             */
/* ------------------------------------------------------------------------- */

holds (eq X Y) :- termval X M, termval Y N, M = N.

end
