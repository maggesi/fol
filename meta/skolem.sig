sig skolem.

accum_sig fol.

type freesTm term -> list A -> o.
type freesTms list term -> list A -> o.

type freesFm form -> list A -> o.

type mkVar string -> term -> o. 




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
%type countQtest form -> int -> o.