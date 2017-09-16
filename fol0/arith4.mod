/* ========================================================================= */
/* Model: addition on integers modulo 4.                                     */
/* ========================================================================= */

module arith4.

/* ------------------------------------------------------------------------- */
/* Addition on integers modulo 4.                                            */
/* ------------------------------------------------------------------------- */

domain 0.
domain 1.
domain 2.
domain 3.

add4 0 N N :- domain N.
add4 N 0 N :- domain N.
add4 1 1 2.
add4 1 2 3.
add4 1 3 0.
add4 2 1 3.
add4 2 2 0.
add4 2 3 1.
add4 3 1 0.
add4 3 2 1.
add4 3 3 2.

mul4 0 N 0 :- domain N.
mul4 N 0 0 :- domain N.
mul4 1 N N :- domain N.
mul4 N 1 N :- domain N.
mul4 2 2 0.
mul4 2 3 2.
mul4 3 2 2.
mul4 3 3 1.

end
