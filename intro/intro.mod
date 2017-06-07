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

/*
simplify (var X) (var X).
simplify (const X) (const X).
simplify (Op X Y) Z :- binop Op, simplify X X', simplify Y Y',
                       reflc simplify1 (Op X' Y') Z.

simplify' (var X) (var X).
simplify' (const X) (const X).
simplify' (Op X Y) Z :- binop Op, simplify' X X', simplify' Y Y',
                        rc simplify1 (Op X' Y') Z.

*/

simplifynaive (add E1 E2) E3 :- simplifynaive E1 E1', simplifynaive E2 E2', simplify1 (add E1' E2') E3.
simplifynaive (mul E1 E2) E3 :- simplifynaive E1 E1', simplifynaive E2 E2', simplify1 (mul E1' E2') E3.
simplifynaive E E.

gensimplify C (var X) (var X).
gensimplify C (const X) (const X).
gensimplify C (Op X Y) Z :- binop Op, gensimplify C X X', gensimplify C Y Y',
                            C simplify1 (Op X' Y') Z.

simplify X Y:- reflc simplify X Y.
simplify' X Y:- rc simplify' X Y.




example 0 "simplify1" A X:- A = (mul (const 0) (const 1)), simplify1 A X.

example 1 "naive" A X:- A = (add (mul (add (mul (const 0) (var "x")) (const 1)) (const 3)) (const 12)), simplifynaive A X.
example 2 "simplify with reflexive closure and cut" A X:- A = (add (mul (add (mul (const 0) (var "x")) (const 1)) (const 3)) (const 12)), simplify A X.
example 3 "simplify'  with reflexive closure" A X:- A = (add (mul (add (mul (const 0) (var "x")) (const 1)) (const 3)) (const 12)), simplify' A X.

example 4 "simplify with reflexive closure and cut" A X:- A = (mul (const 0) (const 1)), simplify A X.
example 5 "simplify' with reflexive closure" A X:- A = (mul (const 0) (const 1)), simplify' A X.
example 6 "simplify' with reflexive closure" A X:- A = (add (mul (mul  (const 1)  (const 0)) (const 3)) (const 12)), simplify' A X.

example 7 "gensimplify  with reflexive closure" A X:- A = (add (mul (add (mul (const 0) (var "x")) (const 1)) (const 3)) (const 12)), gensimplify rc A X.
example 8 "gensimplify - reflexive closure" A X:- A = (add (mul (add (mul (const 0) (const 2)) (const 1)) (const 3)) (const 12)), gensimplify rc A X.
example 9 "gensimplify - reflexive closure" A X:- A = (add (mul (mul  (const 1)  (const 0)) (const 3)) (const 12)), gensimplify rc A X.
example 10 "gensimplify -  with reflexive closure and cut" A X:- A = (add (mul (add (mul (const 0) (const 2)) (const 1)) (const 3)) (const 12)), gensimplify reflc A X.

example 11 "gensimplify -  with reflexive closure" A X:- A = (mul (const 0) (const 1)), gensimplify rc A X.
example 12 "gensimplify -  with reflexive closure and cut" A X:- A = (mul (const 0) (const 1)), gensimplify reflc A X.



end