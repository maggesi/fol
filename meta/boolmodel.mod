module boolmodel.


listdomain 0 (0 :: nil).
listdomain N (N :: Tail) :- N > 0, N1 is N - 1, listdomain N1 Tail.

domainb M :- listdomain 1 L, member M L.

/*----------------disjunction----------------*/
addb 1 1 1.
addb 1 0 1.
addb 0 1 1.
addb 0 0 0.


/*----------------exclusive or----------------*/

addexb 1 1 0.
addexb 1 0 1.
addexb 0 1 1.
addexb 0 0 0.

/*----------------conjunction----------------*/
mulb 1 1 1.
mulb 1 0 0.
mulb 0 1 0.
mulb 0 0 0.


eqb N N :- domainb N.


end