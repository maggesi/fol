/* ========================================================================= */
/* Interpetation of first order logic in the language of arith3.             */
/* ========================================================================= */

module arith3interp.

import fol, arith3model.

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

func3 "zero" [] 0.
func3 "one" [] 1.
func3 "two" [] 2.
func3 "+" [M, N] P :- add3 M N P.
func3 "*" [M, N] P :- mul3 M N P.

/* ------------------------------------------------------------------------- */
/* Interpretation of predicates.                                             */
/* ------------------------------------------------------------------------- */

pred3 "=" [M, N] :- eq3 M N.

/* ------------------------------------------------------------------------- */
/* Validity.                                                                 */
/* ------------------------------------------------------------------------- */

use_model "arith3" (model domain3 func3 pred3).
% arith3 V Tm :- holds (model domain3 func3 pred3) V Tm.


%inv3 :- holds ("arith3" domain3 (exists X \ mul3 1 X 1)),
%     	holds ("arith3" domain3 (exists X \ mul3 2 X 1)).
     	% exists X \ mul3 1 X 1,
	% exists X \ mul3 2 X 1.

end
