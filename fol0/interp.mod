/* ========================================================================= */
/* Interpretation of fol in arith3 (domain, fol, arith3).                    */
/* ========================================================================= */

module interp.

accumulate fol, arith3.

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

termval zero 0.
termval one 1.
termval two 2.
termval (add X Y) P :- termval X M, termval Y N, add3 M N P.
termval (mul X Y) P :- termval X M, termval Y N, mul3 M N P.


/* ------------------------------------------------------------------------- */
/* Interpretation of predicates.                                             */
/* ------------------------------------------------------------------------- */

holds (eq X Y) :- termval X M, termval Y N, M = N.

/* ------------------------------------------------------------------------- */
/* Test for inverse.                                                         */
/* ------------------------------------------------------------------------- */


% inv3 :- holds (forall N \ exists X \ eq (mul N X) one);
%      	holds (eq (mul zero N) X);
%	holds (eq (mul N zero) X).

inv3bis :- holds (exists X \ eq (mul one X) one),
	   holds (exists X \ eq (mul two X) one).

end