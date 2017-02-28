% Logica dei predicati.

sig pred.

accum_sig term.

kind form type -> type.

type false form A.
type truth form A.
type atom A -> form A.
% type atom string -> list A -> form A.
type and form A -> form A -> form A.
type nt form A -> form A.
type or form A -> form A -> form A.
type imp form A -> form A -> form A.
type iff form A -> form A -> form A.

type form form A -> o.
type occurs string -> form term -> o.


% Capitolo logica dei predicati.

type frees form term -> list string -> o.

type forall (term -> form term) -> form term.
type exists (term -> form term) -> form term.

type subst (string -> term -> o) -> form term -> form term -> o.



type fsub string -> term -> o.