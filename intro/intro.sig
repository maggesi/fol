sig intro.

kind expr type.
type var string -> expr.
type const int -> expr.

type add, mul expr -> expr -> expr.

type simplify1, simplifynaive, simplify, simplify' expr -> expr -> o.

type test int -> string -> expr -> expr -> o.

end
