/* ========================================================================= */
/* Interpretation of the language in the model as undirected graph.          */
/* ========================================================================= */

module graph1interp.

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

func1 "n0" [] 0.
func1 "n1" [] 1.
func1 "n2" [] 2.
func1 "n3" [] 3.

/* ------------------------------------------------------------------------- */
/* Interpretation of predicates.                                             */
/* ------------------------------------------------------------------------- */

pred1 "edge" [A, B] :- (link A B; link B A).

/* ------------------------------------------------------------------------- */
/* Validity.                                                                 */
/* ------------------------------------------------------------------------- */

use_model "graph1" (model node func1 pred1).

end
