/* ========================================================================= */
/* Interpretation of the language of graphs in the model graph1.             */
/* ========================================================================= */

module graph1interp.

accumulate fol, graph1model.

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

termval node0 0.
termval node1 1.
termval node2 2.
termval node3 3.

/* ------------------------------------------------------------------------- */
/* Interpretation of predicates.                                             */
/* ------------------------------------------------------------------------- */

holds (edge X Y) :-
  termval X A,
  termval Y B,
  (link A B; link B A).

end
