
module modn.

accumulate fol, lib.

listdomain 0 (0 :: nil).
listdomain N (N1 :: Tail) :- N > 0, N1 is N - 1, listdomain N1 Tail.

domainN N Q:- listdomain N L, member Q L.
mulN N X Y Z :-
     domainN N X, domainN N Y, Z1 is X * Y, A is Z1 / N, A1 is A * N, Z is A1 - Z1, domainN N Z.

eqN N Q Q :- domainN N Q.

/*--------Interpretation--------*/
funcN "*" [N, X, Y] P :- mulN N X Y P.
funcN "one" [] 1.
funcN "zero" [] 0.


predN "=" [N, X, Y] :- eqN N X Y.


modn N X Y P:- listdomain N L, mulN N X Y P.
/*
inv N :-
     (forall X \
        imp (neg (atom "=" [N, X, fn "zero" []])) 
            (exists Y \ atom "=" [fn "*" [N, X, Y], fn "one" []])).
*/
end