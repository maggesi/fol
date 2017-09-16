/* ========================================================================= */
/* Directed graph: tests and examples.                                       */
/* ========================================================================= */

module graph0test.

accumulate graph0interp.

test 0 :- topholds (edge node0 node1).

test 1 :- topholds (edge node1 node0).

/* ------------------------------------------------------------------------- */
/* Grafo totalmente connesso.                                                */
/* ------------------------------------------------------------------------- */

test 2 :- topholds (forall X \ forall Y \ edge X Y).

/* ------------------------------------------------------------------------- */
/* Grafo simmetrico.                                                         */
/* ------------------------------------------------------------------------- */

test 3 :- topholds (forall X \ forall Y \ imp (edge X Y) (edge Y X)).

/* ------------------------------------------------------------------------- */
/* Non esistono nodi isolati.                                                */
/* ------------------------------------------------------------------------- */

test 4 :- topholds (forall X \ exists Y \ or (edge X Y) (edge Y X)).

test 5 :-
  pi p \
    ((pi A \ domain A => p A A),
     (pi A \ pi B \ (sigma C \ domain C, link A C, p C B) => p A B),
     (pi V \ pi X \ pi Y \ (sigma A \ sigma B \ termval V X A, termval V Y B, p A B) => holds V (path X Y)))
    => topholds (path node0 node0).

test 6 :-
  pi p \
    ((pi A \ domain A => p A A),
     (pi A \ pi B \ (sigma C \ domain C, link A C, p C B) => p A B),
     (pi V \ pi X \ pi Y \ (sigma A \ sigma B \ termval V X A, termval V Y B, p A B) => holds V (path X Y)))
    => topholds (path node0 node1).

test 7 :-
  pi p \
    ((pi A \ domain A => p A A),
     (pi A \ pi B \ (sigma C \ domain C, link A C, p C B) => p A B),
     (pi V \ pi X \ pi Y \ (sigma A \ sigma B \ termval V X A, termval V Y B, p A B) => holds V (path X Y)))
    => topholds (path node0 node2).

test 8 :-
  pi p \
    ((pi A \ domain A => p A A),
     (pi A \ pi B \ (sigma C \ domain C, link A C, p C B) => p A B),
     (pi V \ pi X \ pi Y \ (sigma A \ sigma B \ termval V X A, termval V Y B, p A B) => holds V (path X Y)))
    => topholds (path node0 node3).

test 9 :-
  pi p \
    ((pi A \ domain A => p A A),
     (pi A \ pi B \ (sigma C \ domain C, link A C, p C B) => p A B),
     (pi V \ pi X \ pi Y \ (sigma A \ sigma B \ termval V X A, termval V Y B, p A B) => holds V (path X Y)))
    => topholds (path node3 node0).

test 10 :-
  pi p \
    ((pi A \ domain A => p A A),
     (pi A \ pi B \ (sigma C \ domain C, link A C, p C B) => p A B),
     (pi V \ pi X \ pi Y \ (sigma A \ sigma B \ termval V X A, termval V Y B, p A B) => holds V (path X Y)))
    => topholds (exists X \ path node0 X).

test 11 :-
  pi p \
    ((pi A \ pi B \ link A B),
     (pi A \ domain A => p A A),
     (pi A \ pi B \ (sigma C \ domain C, (link A C; link C A), p C B) => p A B),
     (pi V \ pi X \ pi Y \ (sigma A \ sigma B \ termval V X A, termval V Y B, p A B) => holds V (path X Y)))
    => topholds (forall Y \ path node0 node2).

/* ------------------------------------------------------------------------- */
/* Grafo connesso.                                                           */
/* ------------------------------------------------------------------------- */

test 12 :-
  pi p \
    ((pi A \ domain A => p A A),
     (pi A \ pi B \ (sigma C \ domain C, link A C, p C B) => p A B),
     (pi V \ pi X \ pi Y \ (sigma A \ sigma B \ termval V X A, termval V Y B, p A B) => holds V (path X Y)))
    => topholds (forall X \ forall Y \ path X Y).

test 13 :-
  pi p \
    ((pi A \ pi B \ link A B),
     (pi A \ domain A => p A A),
     (pi A \ pi B \ (sigma C \ domain C, (link A C; link C A), p C B) => p A B),
     (pi V \ pi X \ pi Y \ (sigma A \ sigma B \ termval V X A, termval V Y B, p A B) => holds V (path X Y)))
    => topholds (forall Y \ path node0 Y).

end
