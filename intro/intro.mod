module intro.

/* Definitions of two relations: reflexive closure (rc) and reflexive closure with cut (reflc) */ 
rc R X Y :- R X Y.
rc R X X.

reflc R X Y :- R X Y, !.
reflc R X X.

/* Predicate that call addition with add and multiplication with mul */
binop add.
binop mul.

/* Definitions of a first predicate to simplify, which makes a first semplification */
simplify1 (add (const M) (const N)) (const P) :- P is M + N.
simplify1 (mul (const M) (const N)) (const P) :- P is M * N.
simplify1 (add (const 0) X) X.
simplify1 (add X (const 0)) X.
simplify1 (mul (const 0) _) (const 0).
simplify1 (mul _ (const 0)) (const 0).
simplify1 (mul (const 1) X) X.
simplify1 (mul X (const 1)) X.

/* an immediate translation of Harrison's simplify, that is not correct */
simplifynaive (add E1 E2) E3 :- simplifynaive E1 E1', simplifynaive E2 E2', simplify1 (add E1' E2') E3.
simplifynaive (mul E1 E2) E3 :- simplifynaive E1 E1', simplifynaive E2 E2', simplify1 (mul E1' E2') E3.
simplifynaive E E.

/* A predicate gensimplify which can be a loyal translation of Harrison's code with simplify or a less near translation without cut that is simplify' */
gensimplify C (var X) (var X).
gensimplify C (const X) (const X).
gensimplify C (Op X Y) Z :- binop Op, gensimplify C X X', gensimplify C Y Y',
                            C simplify1 (Op X' Y') Z.

simplify X Y:- gensimplify reflc X Y.
simplify' X Y:- gensimplify rc X Y.


/* test of how the differents predicates to simplify work */

test 0 "simplify1" A X:- A = (mul (const 0) (const 1)), simplify1 A X.

test 1 "naive" A X:- A = (add (mul (add (mul (const 0) (var "x")) (const 1)) (const 3)) (const 12)), simplifynaive A X.
test 2 "simplify'  with reflexive closure" A X:- A = (add (mul (add (mul (const 0) (var "x")) (const 1)) (const 3)) (const 12)), simplify' A X.
test 3 "simplify with reflexive closure and cut" A X:- A = (add (mul (add (mul (const 0) (var "x")) (const 1)) (const 3)) (const 12)), simplify A X.

test 4 "naive" A X:- A = (mul (const 0) (const 1)), simplifynaive A X.
test 5 "simplify' with reflexive closure" A X:- A = (mul (const 0) (const 1)), simplify' A X.
test 6 "simplify with reflexive closure and cut" A X:- A = (mul (const 0) (const 1)), simplify A X.

test 7 "naive" A X:- A = (add (mul (mul  (const 1)  (const 0)) (const 3)) (const 12)), simplifynaive A X.
test 8 "simplify' with reflexive closure" A X:- A = (add (mul (mul  (const 1)  (const 0)) (const 3)) (const 12)), simplify' A X.
test 9 "simplify with reflexive closure and cut" A X:- A = (add (mul (mul  (const 1)  (const 0)) (const 3)) (const 12)), simplify A X.

end