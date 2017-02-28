/* ========================================================================= */
/* Directed graph: tests and examples.                                       */
/* ========================================================================= */

module graph0test.

accumulate fol, graphmodel, graphtests, graph0interp, tests.

unit "link01" ok.
unit "link10" ko.
unit "graph_tot_conn" ko.
unit "graph_sym" ko.
unit "graph_no_isol" ok.
unit "graph_conn" ok.

end
