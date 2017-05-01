
module modn.

accumulate fol, lib.

listdomain 0 (0 :: nil).
listdomain N (N1 :: Tail) :- N > 0, N1 is N - 1, listdomain N1 Tail.

domainN N Q:- listdomain N L, member Q L.

mulNN N X Y P:- domainN N X, domainN N Y, P1 is X * Y, P1 > (N - 1), P is P1 mod N, !.
mulNN N X Y P:- domainN N X, domainN N Y, P is X * Y.
eqN N Q Q :- domainN N Q.

/*--------Interpretation--------*/
funcN "*" [N, X, Y] P :- mulNN N X Y P.
funcN "one" [] 1.
funcN "zero" [] 0.


predN "=" [N, X, Y] :- eqN N X Y.
/*
inv N :-
     (forall X \
        (neg (atom "=" [N, X, fn "zero" []])) imp
            (exists Y \ atom "=" [fn "*" [N, X, Y], fn "one" []])).
*/
end