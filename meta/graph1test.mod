/* ========================================================================= */
/* Undirected graph: tests and examples.                                     */
/* ========================================================================= */

module graph1test.

accumulate fol, graphmodel, graphtests, graph1interp, tests.

unit "link01" ok.
unit "link10" ok.
unit "graph_tot_conn" ko.
unit "graph_sym" ok.
unit "graph_no_isol" ok.
unit "graph_conn" ok.

end
