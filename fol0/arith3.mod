/* ========================================================================= */
/* Model: addition on integers modulo 3.                                     */
/* ========================================================================= */

module arith3.

/* ------------------------------------------------------------------------- */
/* Addition on integers modulo 3.                                            */
/* ------------------------------------------------------------------------- */

domain 0.
domain 1.
domain 2.

add3 0 N N :- domain N.
add3 N 0 N :- domain N.
add3 1 1 2.
add3 1 2 0.
add3 2 1 0.
add3 2 2 1.


mul3 0 N 0 :- domain N.
mul3 N 0 0 :- domain N.
mul3 1 N N :- domain N.
mul3 N 1 N :- domain N.
mul3 2 2 1.


end
