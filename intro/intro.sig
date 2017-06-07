sig intro.

kind expr type.
type var string -> expr.
type const int -> expr.
type add, mul expr -> expr -> expr.

type simplify1, simplify, simplify' expr -> expr -> o.
type simplifynaive expr -> expr -> o.

type gensimplify ((A -> A -> o) -> A -> A -> o) -> expr -> expr -> o.
type closure A -> o.

type example int -> string -> expr -> expr -> o.

type binop (expr -> expr -> expr) -> o.

type reflc  (A -> A -> o) -> A -> A -> o.
type rc (A -> A -> o) -> A -> A -> o.

end
