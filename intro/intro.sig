sig intro.

kind expr type.
type var string -> expr.
type const int -> expr.
type add, mul expr -> expr -> expr.

type simplify1, simplify expr -> expr -> o.
type simplify1, simplify expr -> expr -> o.
type gensimplify (A -> A -> o) -> expr -> expr -> o.
type closure A -> o.

type main, example o -> o.

type binop (expr -> expr -> expr) -> o.

type reflc  (A -> A -> o) -> A -> A -> o.
type rc (A -> A -> o) -> A -> A -> o.

end
