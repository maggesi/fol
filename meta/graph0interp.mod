/* ========================================================================= */
/* Interpretation of the language in the model as directed graph.            */
/* ========================================================================= */

module graph0interp.

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

func0 "n0" [] 0.
func0 "n1" [] 1.
func0 "n2" [] 2.
func0 "n3" [] 3.

/* ------------------------------------------------------------------------- */
/* Interpretation of predicates.                                             */
/* ------------------------------------------------------------------------- */

pred0 "edge" (A :: B :: nil) :- link A B.

/* ------------------------------------------------------------------------- */
/* Validity.                                                                 */
/* ------------------------------------------------------------------------- */

use_model "graph0" (model node func0 pred0).

end
