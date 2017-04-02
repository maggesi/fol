module boolinterp.

funcb "ff" [] 0.
funcb "vv" [] 1.
funcb "+" [M, N] P :- addb M N P.
funcb "++" [M, N] P :- addexb M N P.
funcb "*" [M, N] P :- mulb M N P.

predb "=" [M, N] :- eqb M N.

use_model "bool" (model domainb funcb predb).

/*
boolinterp N P :-
  listdomain N D,
  holds (model D funcb predb).
*/

end
