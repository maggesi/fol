/* ========================================================================= */
/* Interpretation of the language in the model as directed graph.            */
/* ========================================================================= */

module graph0interp.

accumulate fol, graphmodel.

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

termval _ node0 0.
termval _ node1 1.
termval _ node2 2.
termval _ node3 3.

/* ------------------------------------------------------------------------- */
/* Interpretation of predicates.                                             */
/* ------------------------------------------------------------------------- */

holds V (edge X Y) :- termval V X A, termval V Y B, link A B.

end
