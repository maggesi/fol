sig intro.

kind expr type.
type var string -> expr.
type const int -> expr.
type add, mul expr -> expr -> expr.
type simplify1, simplify expr -> expr -> o.
type main, example expr -> o.

type simplify0 expr -> expr -> o.
type rc, tc, rtc, nf (A -> A -> o) -> A -> A -> o.

type determ, reduct  (A -> A -> o) -> A -> A -> o.

type reflc (A -> A -> o) -> A -> A -> o.

end
