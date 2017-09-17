/* ========================================================================= */
/* Interpretation of fol in arith4 (domain, fol, arith4).                    */
/* ========================================================================= */

module interp4.

accumulate fol, arith4.

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

termval _ zero 0.
termval _ one 1.
termval _ two 2.
termval _ three 3.
termval V (add X Y) P :- termval V X M, termval V Y N, add4 M N P.
termval V (mul X Y) P :- termval V X M, termval V Y N, mul4 M N P.

/* ------------------------------------------------------------------------- */
/* Interpretation of predicates.                                             */
/* ------------------------------------------------------------------------- */

holds V (eq X Y) :- termval V X M, termval V Y N, M = N.

end
