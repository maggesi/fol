module intro.

simplify0 (add (const M) (const N)) (const P) :- P is M + N.
simplify0 (mul (const M) (const N)) (const P) :- P is M * N.
simplify0 (add (const 0) X) X.
simplify0 (add X (const 0)) X.
simplify0 (mul (const 0) _) (const 0).
simplify0 (mul _ (const 0)) (const 0).
simplify0 (mul (const 1) X) X.
simplify0 (mul X (const 1)) X.

simplify1 A B :- reflc simplify0 A B.
%simplify1 A B :- rc simplify0 A B.

simplify (add E1 E2) E3 :-
  simplify E1 E1', simplify E2 E2', simplify1 (add E1' E2') E3.
simplify (mul E1 E2) E3 :-
  simplify E1 E1', simplify E2 E2', simplify1 (mul E1' E2') E3.
simplify E E.

example (add (mul (add (mul (const 0) (var "x")) (const 1)) (const 3))
             (const 12)).

main X :- example A, simplify A X.


/*--------lib--------*/
rc R X Y :- R X Y.
rc R X X.
%chiusura transitiva
tc R X Y :- R X Z, rtc R Z Y.

rtc R X X.
rtc R X Y :- R X Z, tc R Z Y.

nf R X Y :- rtc R X Y, not(R X Y).

%% Con taglio.

determ R X Y :- R X Y, !.

%maybe
reflc R X Y:- R X Y, !.
reflc R X X.

reduct R X Y :- R X Z, !, reduct R Z Y.
reduct R X X.

end