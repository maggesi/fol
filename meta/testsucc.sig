sig testsucc.
accum_sig fol, psimplify, nnf, simplify, pullquants, prenex.
/*
type psimplifytest1, psimplifytest2, psimplifytest3, psimplifytest4, psimplifytest5, psimplifytest6, psimplifytest7, psimplifytest8, psimplifytest9, psimplifytest10, psimplifytest11, psimplifytest12,
     nnftest1, nnftest2, nnftest3, nnftest4, nnftest5, nnftest6, nnftest7, nnftest8, nnftest9, nnftest10, nnftest11, nnftest12, nnftest13, nnftest14, nnftest15, nnftest16, nnftest17, nnftest18, nnftest19, nnftest20, nnftest21, nnftest22,
     simplifytest1, simplifytest2, simplifytest3, simplifytest4, simplifytest5, simplifytest6, simplifytest7, simplifytest8, simplifytest9, simplifytest10, simplifytest11, simplifytest12, simplifytest13, simplifytest14, simplifytest15, simplifytest16, simplifytest17,
     pullquanttest1, pullquanttest2, pullquanttest3, pullquanttest4, pullquanttest5, pullquanttest6, pullquanttest7, pullquanttest8, pullquanttest9, pullquanttest10, pullquanttest11, pullquanttest12, pullquanttest13,
     pqtest0, pqtest01, pqtest02, pqtest03,
     pqtest1, pqtest2, pqtest3, pqtest4, pqtest5, pqtest6, pqtest7, pqtest8, pqtest9, pqtest10, pqtest11, pqtest12, pqtest13, pqtest14,
     pnxtest1, pnxtest2, pnxtest3, pnxtest4, pnxtest5, pnxtest6, pnxtest7, pnxtest8, pnxtest9, pnxtest10, pnxtest11, pnxtest12,
     pnftest1, pnftest2, pnftest3, pnftest4, pnftest5, pnftest6, pnftest7, pnftest8, pnftest9, pnftest10, pnftest11, pnftest12, pnftest13, pnftest14, pnftest15, pnftest16
     form -> o.
*/
type psimplifytest int -> string -> form -> form -> o.
type nnftest int -> string -> form -> form -> o.
type simplifytest int -> string -> form -> form -> o.
type pullquanttest int -> string -> form -> form -> o.
type pqtest int -> string -> form -> form -> o.
type pnxtest int -> string -> form -> form -> o.
type pnftest int -> string -> form -> form -> o.



/*---------------------------------------------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------------------------------------------*/
type simple_string int -> string -> o.
type leq int -> int -> o.
type split int -> int -> int -> o.
type term int -> term -> o.
type terms int -> list term -> o.
type form int -> form -> o.

% type subterm term -> term -> o.
type subform, psubform form -> form -> o.

type notsimpl, notsimpl1 form -> o.
type testsimpl int -> form -> o.
type testnotsimpl int -> form -> o.


end