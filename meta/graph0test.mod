/* ========================================================================= */
/* Directed graph: tests and examples.                                       */
/* ========================================================================= */

module graph0test.

accumulate fol, graphmodel, graphtests, graph0interp, tests.

/*
unit "link01" ok.
unit "link10" ok.
unit "graph_tot_conn" ko.
unit "graph_sym" ok.
unit "graph_no_isol" ok.
unit "graph_conn" ok.
*/

test1 :- 
  holds (model domain func0 pred0) undefined
        (atom "edge" (fn "n0" nil :: fn "n1" nil :: nil)).

test2 :- 
  holds (model domain func0 pred0) undefined
        (atom "edge" (fn "n1" nil :: fn "n0" nil :: nil)).

% Grafo totalmente connesso.
test3 :-
  holds (model domain func0 pred0) undefined
        (forall X \ forall Y \ atom "edge" (X :: Y :: nil)).

% Grafo simmetrico.
test4 :-
  holds (model domain func0 pred0) undefined
        (forall X \ forall Y \
           imp (atom "edge" (X :: Y :: nil)) (atom "edge" (Y :: X :: nil))).

/* ------------------------------------------------------------------------- */
/* Non esistono nodi isolati.                                                */
/* ------------------------------------------------------------------------- */

test5 :-
  holds (model domain func0 pred0) undefined
        (forall X \ exists Y \
           or (atom "edge" (X :: Y :: nil)) (atom "edge" (Y :: X :: nil))).

/* ------------------------------------------------------------------------- */
/* Grafo connesso.                                                           */
/* ------------------------------------------------------------------------- */

/* Sbagliato, aggiustare come in fol1. */
/*
test "graph_conn"
     (imp (and (forall X \ atom "path" (X :: X :: nil))
               (forall X \ forall Y \
                  imp (exists Z \
                         and (atom "edge" (X :: Z :: nil))
                             (atom "path" (Z :: Y :: nil)))
                      (atom "path" (X :: Y :: nil))))
          (forall X \ forall Y \ atom "path" (X :: Y :: nil))).
*/

end
