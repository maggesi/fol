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



type skolemtest1, skolemtest2, skolemtest3, skolemtest4, skolemtest5, skolemtest6,
skolemtest7, skolemtest8, skolemtest9, skolemtest10, skolemtest11,
skolemtest12, skolemtest13, skolemtest14, skolemtest15, skolemtest16, skolemtest17 form -> o.

%type countQtest form -> int -> o.