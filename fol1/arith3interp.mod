/* ========================================================================= */
/* Interpetation of first order logic in the language of arith3.             */
/* ========================================================================= */

module arith3interp.

accumulate fol, arith3model.

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

termval _ zero 0.
termval _ one 1.
termval _ two 2.
termval V (add X Y) P :- termval V X M, termval V Y N, add3 M N P.

/* ------------------------------------------------------------------------- */
/* Interpretation of predicates.                                             */
/* ------------------------------------------------------------------------- */

holds V (eq X Y) :- termval V X M, termval V Y N, M = N.

end
