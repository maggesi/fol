module boolmodel.

member Name [Name|Tail].
member Name [Head|Tail]:- member Name Tail.

domainb N :- member N (0 :: 1 :: nil).


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