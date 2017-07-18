/* ========================================================================= */
/* Model: addition on integers modulo 3.                                     */
/* ========================================================================= */

module arith3model.


/* ------------------------------------------------------------------------- */
/* Domain3.                                                                   */
/* ------------------------------------------------------------------------- */
%QUale delle due è meglio? (funzionano entrambe)

listdomain 0 (0 :: nil).
listdomain N (N1 :: Tail) :- N > 0, N1 is N - 1, listdomain N1 Tail.

domain3 N :- listdomain 2 L, member N L.
%domain3 N :- member N [0, 1, 2].

/* ------------------------------------------------------------------------- */
/* Addition on integers modulo 3.                                            */
/* ------------------------------------------------------------------------- */

add3 0 N N :- domain3 N.
add3 N 0 N :- domain3 N.
add3 1 1 2.
add3 1 2 0.
add3 2 1 0.
add3 2 2 1.

/* ------------------------------------------------------------------------- */
/* Multiplication on integers modulo 3.                                            */
/* ------------------------------------------------------------------------- */

mul3 0 N 0 :- domain3 N.
mul3 N 0 0 :- domain3 N.
mul3 1 N N :- domain3 N.
mul3 N 1 N :- domain3 N.
mul3 2 2 1.

/* ------------------------------------------------------------------------- */
/* Equality.                                                                 */
/* ------------------------------------------------------------------------- */

eq3 N N :- domain3 N.

end
