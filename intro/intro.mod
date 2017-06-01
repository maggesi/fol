module intro.

rc R X Y :- R X Y.
rc R X X.

reflc R X Y :- R X Y, !.
reflc R X X.

binop add.
binop mul.

simplify1 (add (const M) (const N)) (const P) :- P is M + N.
simplify1 (mul (const M) (const N)) (const P) :- P is M * N.
simplify1 (add (const 0) X) X.
simplify1 (add X (const 0)) X.
simplify1 (mul (const 0) _) (const 0).
simplify1 (mul _ (const 0)) (const 0).
simplify1 (mul (const 1) X) X.
simplify1 (mul X (const 1)) X.


simplify (var X) (var X).
simplify (const X) (const X).
simplify (Op X Y) Z :- binop Op, simplify X X', simplify Y Y',
                       reflc simplify1 (Op X' Y') Z.


gensimplify Closure (var X) (var X):- closure Closure.
gensimplify Closure (const X) (const X):- closure Closure.
gensimplify Closure (Op X Y) Z :-closure Closure, binop Op, gensimplify X X', gensimplify Y Y',
                            Closure simplify1 (Op X' Y') Z.

closure Closure rc.
closure Closure reflc.

/*
simplify (add E1 E2) E3 :-
  simplify E1 E1', simplify E2 E2', simplify1 (add E1' E2') E3.
simplify (mul E1 E2) E3 :-
  simplify E1 E1', simplify E2 E2', simplify1 (mul E1' E2') E3.
simplify E E.
*/
example (simplify1 (mul (const 0) (const 1)) X).
example (simplify (add (mul (add (mul (const 0) (var "x")) (const 1)) (const 3))
             (const 12)) X).

main G :- example G, G.


end