sig intro.

type reflc  (A -> A -> o) -> A -> A -> o.
type rc (A -> A -> o) -> A -> A -> o.

kind expr type.
type var string -> expr.
type const int -> expr.

type add, mul expr -> expr -> expr.

type binop (expr -> expr -> expr) -> o.

type simplify1, simplifynaive, simplify, simplify' expr -> expr -> o.
type gensimplify ((A -> A -> o) -> A -> A -> o) -> expr -> expr -> o.

type test int -> string -> expr -> expr -> o.

end
