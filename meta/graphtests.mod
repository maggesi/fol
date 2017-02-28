/* ========================================================================= */
/* Examples and tests in the language of graphs.                             */
/* ========================================================================= */

module graphtests.

test "link01" (atom "edge" (fn "n0" nil :: fn "n1" nil :: nil)).

test "link10" (atom "edge" (fn "n1" nil :: fn "n0" nil :: nil)).

/* ------------------------------------------------------------------------- */
/* Grafo totalmente connesso.                                                */
/* ------------------------------------------------------------------------- */

test "graph_tot_conn" (forall X \ forall Y \ atom "edge" (X :: Y :: nil)).

/* ------------------------------------------------------------------------- */
/* Grafo simmetrico.                                                         */
/* ------------------------------------------------------------------------- */

test "graph_sym"
     (forall X \ forall Y \
        imp (atom "edge" (X :: Y :: nil)) (atom "edge" (Y :: X :: nil))).

/* ------------------------------------------------------------------------- */
/* Non esistono nodi isolati.                                                */
/* ------------------------------------------------------------------------- */

test "graph_no_isol"
     (forall X \ exists Y \
        or (atom "edge" (X :: Y :: nil)) (atom "edge" (Y :: X :: nil))).

/* ------------------------------------------------------------------------- */
/* Grafo connesso.                                                           */
/* ------------------------------------------------------------------------- */

test "graph_conn"
     (imp (and (forall X \ atom "path" (X :: X :: nil))
               (forall X \ forall Y \
                  imp (exists Z \
                         and (atom "edge" (X :: Z :: nil))
                             (atom "path" (Z :: Y :: nil)))
                      (atom "path" (X :: Y :: nil))))
          (forall X \ forall Y \ atom "path" (X :: Y :: nil))).

end
