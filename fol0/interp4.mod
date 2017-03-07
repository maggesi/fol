/* ========================================================================= */
/* Interpretation of fol in arith4 (domain, fol, arith4).                    */
/* ========================================================================= */

module interp4.

accumulate fol, arith4.

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

termval zero 0.
termval one 1.
termval two 2.
termval three 3.
termval (add X Y) P :- termval X M, termval Y N, add4 M N P.
termval (mul X Y) P :- termval X M, termval Y N, mul4 M N P.

/* ------------------------------------------------------------------------- */
/* Interpretation of predicates.                                             */
/* ------------------------------------------------------------------------- */

holds (eq X Y) :- termval X M, termval Y N, M = N.
/* ------------------------------------------------------------------------- */
/* Inverse.                                                                  */
/* ------------------------------------------------------------------------- */


inv4 :- holds (forall N \  (exists X \ eq (mul N X) one)),
     	holds (eq (mul zero N) X),
	holds (eq (mul N zero) X).

%inv4 :- holds (forall N \  (exists X \ ( (eq (mul N X) one),
%     	(eq (mul zero N) X)),
%	(eq (mul N zero) X))).

end
