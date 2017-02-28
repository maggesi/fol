/* ========================================================================= */
/* Directed graph: tests and examples.                                       */
/* ========================================================================= */

module graph0test.

accumulate graph0interp.

test0 :- holds (edge node0 node1).

test1 :- holds (edge node1 node0).

/* ------------------------------------------------------------------------- */
/* Grafo totalmente connesso.                                                */
/* ------------------------------------------------------------------------- */

test2 :- holds (forall X \ forall Y \ edge X Y).

/* ------------------------------------------------------------------------- */
/* Grafo simmetrico.                                                         */
/* ------------------------------------------------------------------------- */

test3 :- holds (forall X \ forall Y \ imp (edge X Y) (edge Y X)).

/* ------------------------------------------------------------------------- */
/* Non esistono nodi isolati.                                                */
/* ------------------------------------------------------------------------- */

test4 :- holds (forall X \ exists Y \ or (edge X Y) (edge Y X)).

/* ------------------------------------------------------------------------- */
/* Grafo connesso.                                                           */
/* ------------------------------------------------------------------------- */

test5 :-
  holds
    (imp (and (forall X \ path X X)
              (forall X \ forall Y \
                 imp (exists Z \ (and (edge X Z) (path Z Y))) (path X Y)))
         (forall X \ forall Y \ path X Y)).

end
