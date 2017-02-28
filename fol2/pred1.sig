% Logica dei predicati.

sig pred1.

accum_sig term1.

kind form type -> type.

type false form A.
type truth form A.
%type atom A -> form A.
type atom form A -> list A -> form A.
type and form A -> form A -> form A.
type nt form A -> form A.
type or form A -> form A -> form A.
type imp form A -> form A -> form A.
type iff form A -> form A -> form A.

type form form A -> o.
type occurs string -> form A -> o.

% Capitolo logica dei predicati.
type forall (term -> form term) -> form term.
type exists (term -> form term) -> form term.

type fv form term -> list A -> o.
type subst (string -> term -> o) -> form term -> form term -> o.

type fsub string -> term -> o.

% termval Func V Tm W.
type termval (string -> list A -> A -> o) -> (string -> A -> o) ->  term -> A -> o.