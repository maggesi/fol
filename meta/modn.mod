
module modn.

%accumulate fol, lib.

listdomain 0 (0 :: nil).
listdomain N (N1 :: Tail) :- N > 0, N1 is N - 1, listdomain N1 Tail.

domainN N Q:- listdomain N L, member Q L.

/*--------Interpretation--------*/
% funcN N "+" [X, Y] P :- P is (X + Y) mod N.
funcN N "*" [X, Y] P :- P is (X * Y) mod N.
funcN N "zero" [] 0.
funcN N "one" [] M :- M is 1 mod N.
funcN N "two" [] M :- M is 2 mod N.
funcN N "three" [] M :- M is 3 mod N.

predN N "=" [X,Y] :- D is X-Y mod N, D = 0.

/*
inv N :-
     (forall X \
        (neg (atom "=" [N, X, fn "zero" []])) imp
            (exists Y \ atom "=" [fn "*" [N, X, Y], fn "one" []])).
*/
end