/* ========================================================================= */
/* Interpretation of fol in arith3 (domain, fol, arith3).                    */
/* ========================================================================= */

module interp.

accumulate fol, arith3.

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

termval _ zero 0.
termval _ one 1.
termval _ two 2.
termval V (add X Y) P :- termval V X M, termval V Y N, add3 M N P.
termval V (mul X Y) P :- termval V X M, termval V Y N, mul3 M N P.

/* ------------------------------------------------------------------------- */
/* Interpretation of predicates.                                             */
/* ------------------------------------------------------------------------- */

holds V (eq X Y) :- termval V X M, termval V Y N, M = N.

end
