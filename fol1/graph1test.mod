/* ========================================================================= */
/* Graph: tests and examples.                                                */
/* ========================================================================= */

module graph1test.

accumulate graph1interp.

test0 :- holds (edge node0 node1).

test1 :- holds (edge node1 node0).

test2 :- holds (forall X \ forall Y \ edge X Y).

/* ------------------------------------------------------------------------- */
/* Grafo simmetrico.                                                         */
/* ------------------------------------------------------------------------- */

test3 :- holds (forall X \ exists Y \ imp (edge X Y) (edge Y X)).

/* ------------------------------------------------------------------------- */
/* Grafo connesso.                                                           */
/* ------------------------------------------------------------------------- */

test4 :-
  holds
    (imp (and (forall X \ path X X)
              (forall X \ forall Y \
                 imp (exists Z \ (and (edge X Z) (path Z Y))) (path X Y)))
         (forall X \ forall Y \ path X Y)).

end
