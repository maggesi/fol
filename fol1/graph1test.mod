/* ========================================================================= */
/* Undirected graph: tests and examples.                                     */
/* ========================================================================= */

module graph1test.

accumulate graph1interp.

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
/* Non esistono nodi isolato.                                                */
/* ------------------------------------------------------------------------- */

test4 :- holds (forall X \ exists Y \ or (edge X Y) (edge Y X)).

/* ------------------------------------------------------------------------- */
/* Grafo connesso.                                                           */
/* Sbagliato!  I quantificatori devono essere "meta" per dare la semantica a */
/* path.                                                                     */
/* ------------------------------------------------------------------------- */

/*
test5 :-
  holds
    (imp (and (forall X \ path X X)
              (forall X \ forall Y \
                 imp (exists Z \ (and (edge X Z) (path Z Y))) (path X Y)))
         (forall X \ forall Y \ path X Y)).
*/

/* ------------------------------------------------------------------------- */
/* Test 6.                                                                   */
/* Aumento le clausole nel programma a livello globale.                      */
/* ------------------------------------------------------------------------- */

/*
holds (path X X).
holds (path X Y) :- holds (edge X Z), holds (path Z Y).
test6 :- holds (forall X \ forall Y \ path X Y).
*/

/* ------------------------------------------------------------------------- */
/* Test 7.                                                                   */
/* Aumento le clausole (e aggiungo un predicato p) solo durante l'esecuzione */
/* di test7.                                                                 */
/* ------------------------------------------------------------------------- */

test7 :-
  pi p \
    ((pi X \ holds (p X X)),
     (pi X \ pi Y \
        (sigma Z \ holds (edge X Z), holds (p Z Y)) => holds (p X Y)))
    =>
    holds (forall X \ forall Y \ p X Y).

end
