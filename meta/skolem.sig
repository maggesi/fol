sig skolem.

accum_sig fol.


% -------------------------------------------------------------------------

type variant string -> list string -> string -> o.
% type is_conn form -> (form -> form -> form) -> form -> form -> o.
% type is_binop (form -> form -> form) -> o.
type myskolem0 form -> list string -> form -> list string -> o.
type myskolem form -> list string -> form -> list string -> o.
% type skolem2 (form -> form -> form) -> form -> form -> list string -> form -> list string -> o.
type test int -> form -> form -> list string -> o.
type reflcSkolem (A -> B -> A -> B -> o) -> A -> B -> A -> B -> o.
type askolemizetest int -> form -> form -> o.
% -------------------------------------------------------------------------

type freesTm term -> list term -> o.
type freesTms list term -> list term -> o.
type freesFm form -> list term -> o.

% type is_term term -> o.
% type is_atom form -> o.
type is_var term -> o.
% type mkVar string -> term -> o. 




type skolem form -> form -> o.
type skolem0 form -> form -> o.
type skolem1 form -> form -> o.
type const string -> term.

type askolemize form -> form -> o.

type skolemtest1, skolemtest2, skolemtest3, skolemtest4, skolemtest5, skolemtest6,
skolemtest7, skolemtest8, skolemtest9, skolemtest10, skolemtest11,
skolemtest12, skolemtest13, skolemtest14, skolemtest15, skolemtest16,
skolemtest17, skolemtest18, skolemtest19, skolemtest20, skolemtest21,
skolemtest22, skolemtest23,skolemtest24, skolemtest25 form -> o.

type test1, test2, test3, test4, test1a, test2a, test3a, test4a list A -> o.
type test4b term -> o.
type test5, test6, test7, test8, test9, test10 list A -> o.
