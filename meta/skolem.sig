sig skolem.


accum_sig simplify, psimplify, fol, pullquants, nnf, prenex.

type freesTm term -> list term -> o.
type freesTms list term -> list term -> o.
type freesFm form -> list term -> o.

type skolem form -> list string -> form -> list string -> o.

type askolemize form -> form -> o.

type specialize form -> form -> o.

type skolemize form -> form -> o.

type test int -> form -> form -> o.

type test1, test2, test3, test4, test5, test6, test7, test8, list A -> o.
