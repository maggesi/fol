sig testsucc.
accum_sig fol, psimplify, nnf, simplify, pullquants, prenex, skolem.

type psimplifytest int -> string -> form -> form -> o.
type nnftest int -> string -> form -> form -> o.
type simplifytest int -> string -> form -> form -> o.
type pullquanttest int -> string -> form -> form -> o.
type pqtest int -> string -> form -> form -> o.
type pnxtest int -> string -> form -> form -> o.
type pnftest int -> string -> form -> form -> o.
type skolemtest int -> string -> form -> form -> list string -> o.
type askolemizetest int -> string -> form -> form -> o.


end