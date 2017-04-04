/* ========================================================================= */
/* Model: addition on integers modulo 3.                                     */
/* ========================================================================= */

sig arith3model.
accum_sig lib.

type listdomain int -> list int -> o.
type domain3 int -> o.
type add3 int -> int -> int -> o.
type mul3 int -> int -> int -> o.
type eq3 int -> int -> o.

end
