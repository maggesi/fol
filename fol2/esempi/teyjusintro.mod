module teyjusintro.

% a + b = c
%isAdd : int -> int -> int -> o.

% simplify (add X (mul A B)) (add (var "x") Y).

simplify1 (add (const M) (const N)) (const P) :- P is M + N.
simplify1 (mul (const M) (const N)) (const P) :- P is M * N.
simplify1 (add (const 0) X) X.
simplify1 (add X (const 0)) X.
simplify1 (mul (const 0) _) (const 0).
simplify1 (mul _ (const 0)) (const 0).
simplify1 (mul (const 1) X) X.
simplify1 (mul X (const 1)) X.

simplify (add E1 E2) E3 :-
  simplify E1 E1', simplify E2 E2', simplify1(add E1' E2') E3.
simplify (mul E1 E2) E3 :-
	 simplify E1 E1', simplify E2 E2', simplify1(mul E1' E2') E3.
simplify (const N) (const N).
simplify (var N) (var N).
					   
