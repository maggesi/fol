module intro2.

simplify1 (add (const M) (const N)) (const P) :- P is M + N, !.
simplify1 (mul (const M) (const N)) (const P) :- P is M * N, !.
simplify1 (add (const 0) X) X:- !.
simplify1 (add X (const 0)) X:- !.
simplify1 (mul (const 0) _) (const 0):- !.
simplify1 (mul _ (const 0)) (const 0):- !.
simplify1 (mul (const 1) X) X:- !.
simplify1 (mul X (const 1)) X:- !.

simplify (add E1 E2) E3 :- simplify E1 E1', simplify E2 E2', simplify1(add E1' E2') E3.
simplify (mul E1 E2) E3 :- simplify E1 E1', simplify E2 E2', simplify1(mul E1' E2') E3.
simplify E E.

example (add (mul (add (mul (const 0) (var "x")) (const 1)) (const 3))
             (const 12)).

main X :- example A, simplify A X.

end
