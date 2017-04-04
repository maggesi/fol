
module modn.

accumulate fol, lib.

listdomain 0 (0 :: nil).
listdomain N (N1 :: Tail) :- N > 0, N1 is N - 1, listdomain N1 Tail.

domainN N Q:- listdomain N L, member Q L.
/*mulN N X Y Z :-
domainN N X, domainN N Y, Z1 is X * Y, A is Z1 / N, A1 is A * N, Z is A1 - Z1, domainN N Z.   (sbagliata, per elementi del dominio)

div1 0 0 0.
div1 N 1 N.
/*----------------SBAGLIATO----------------*/
div1 X Y Z:- Z = 1, mul Z Y X1, F is X1 + Y, F > X, Z = X1.
div1 X Y Z:- Z1 = 1, mul Z Y X1, F is X1 + Y, F < X, Z is Z1 + 1, mul Z Y X1. 


mul 0 0 0.
mul N 1 N.
mul 1 N N.
mul X Y Z:- Z is X * Y.



mulN N X Y W1:- domainN N X, domainN N Y, W1 is X * Y, mulNN N W1 P.
mulNN N W1 W1:- domainN N W1.
mulNN N W1 P:- div1 W1 N Z, A is Z * N, P is W1 - A, mulNN N P P1.
*/

%mulN N X Y W:-domainN N X, domainN N Y, W is X * Y, mulNN N W1 P.
%mulNN N W W:- domainN N W.
mulNN N W P :- mod W N P.

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