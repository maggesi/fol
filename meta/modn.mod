
module modn.

accumulate fol, lib.

listdomain 0 (0 :: nil).
listdomain N (N1 :: Tail) :- N > 0, N1 is N - 1, listdomain N1 Tail.

domainN N Q:- listdomain N L, member Q L.

%mulN N X Y W:-domainN N X, domainN N Y, W is X * Y, mulNN N W1 P.
%mulNN N W W:- domainN N W.
%mulNN N W P :- mod W N P.
mulNN N X Y P:- domainN N X, domainN N Y, P1 is X * Y, P1 > (N - 1), mod P1 N P;
      	    	domainN N X, domainN N Y, P is X * Y.
eqN N Q Q :- domainN N Q.

/*--------Interpretation--------*/
funcN "*" [N, X, Y] P :- mulNN N X Y P.
funcN "one" [] 1.
funcN "zero" [] 0.


predN "=" [N, X, Y] :- eqN N X Y.


modn N X Y P:- listdomain N L, mulNN N X Y P.
/*
inv N :-
     (forall X \
        imp (neg (atom "=" [N, X, fn "zero" []])) 
            (exists Y \ atom "=" [fn "*" [N, X, Y], fn "one" []])).
*/
end