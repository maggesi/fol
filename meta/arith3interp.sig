/* ========================================================================= */
/* Interpetation of first order logic in the language of arith3.             */
/* ========================================================================= */

sig arith3interp.

accum_sig fol, arith3model.

type func3 string -> list int -> int -> o.
type pred3 string -> list A -> o.
type inv3 o.

end
