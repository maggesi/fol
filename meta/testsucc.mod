module testsucc.

accumulate prenex.


/*-------- Test for psimplify --------*/

psimplifytest1 Q :- psimplify ((neg false) or truth and truth) Q.
psimplifytest2 Q :- psimplify (false or truth and truth) Q.
psimplifytest3 Q :- psimplify (false imp truth imp truth) Q.
psimplifytest4 Q :- psimplify ((truth imp false) iff ((neg truth) imp truth)) Q.
psimplifytest5 Q :- psimplify (((neg truth) or (neg truth)) iff ((neg truth) imp truth)) Q.

/*-------- Test for NNF --------*/
nnf1test1 Y:- nnf1 (neg (neg truth)) Y.
nnf1test2 Y:- nnf1 (truth and false) Y.
nnf1test3 Y:- nnf1 (false or truth) Y.
nnf1test4 Y:- nnf1 (false imp truth) Y.
nnf1test5 Y:- nnf1 ((truth imp false) or truth) Y.
nnf1test6 Y:- nnf1 (Y imp truth) (truth or truth).
nnf1test7 Y:-  nnf1 (forall X \ exists A \ (atom "P" (fn "F" (A :: nil) :: nil)) and truth) Y.
%problema con nnf1test8
nnf1test8 Y:- nnf1 (forall X \ exists A \ (atom "P" (fn "F" (A :: nil) :: nil)) imp truth) Y.
nnftest1 Y:- nnf ((truth imp false) or truth) Y.
nnftest2 Y:- nnf (((neg truth) imp false) iff ((neg false) imp truth)) Y.
%problema con nnftest3
nnftest3 Y:- nnf (forall X \ exists A \ (atom "P" (fn "F" (A :: nil) :: nil)) imp truth) Y.

/*-------- Test for simplify --------*/
simplifytest1 A:- simplify (forall X \ truth) A.
simplifytest2 A:- simplify false A.
simplifytest3 A:- simplify (false and (forall X \ truth)) A.
simplifytest4 A:- simplify (truth and(forall X \ truth)) A.
simplifytest5 A:- simplify (((neg truth) and (forall X \ truth)) iff (truth imp false)) A.
simplifytest6 A:- simplify (((forall X \ false) and (forall X \ truth)) iff (truth imp false)) A.
simplifytest7 A:- simplify ((truth and (exists Y \ truth)) iff (truth imp false)) A.
simplifytest8 A:- simplify ((false and (exists Y \ truth)) and (truth imp false)) A.
simplifytest9 A:- simplify ((((exists Y \ false) iff (forall X \ false)) and truth) and (truth imp false)) A.
simplifytest10 A:- simplify ((forall X \ false) or truth) A.


/*-------- Test for pullquant --------*/
pullquanttest1 R :- pullquant ((forall X \ (atom "P" [fn "F" [X]])) and (forall Y \ (atom "Q" [fn "G" [Y]]))) R.
pullquanttest2 R :- pullquant truth R.
pullquanttest3 R :- pullquant ((forall X \ (atom "P" [fn "F" [X]])) and truth) R.
pullquanttest4 R :- pullquant (truth and (forall Y \ (atom "P" [fn "F" [X]]))) R.
pullquanttest5 R :- pullquant (truth or (forall Y \ (atom "P" [fn "F" [X]]))) R.
pullquanttest6 R :- pullquant ((forall X \ (atom "P" [fn "F" [X]])) or truth) R.
pullquanttest7 R :- pullquant ((forall X \ (atom "P" [fn "F" [X]])) or (forall Y \ (atom "Q" [fn "G" [Y]]))) R.
pullquanttest8 R :- pullquant ((exists X \ (atom "P" [fn "F" [X]])) and (exists Y \ (atom "Q" [fn "G" [Y]]))) R.
pullquanttest9 R :- pullquant ((exists X \ (atom "P" [fn "F" [X]])) and truth) R.
pullquanttest10 R :- pullquant (R and truth) (exists X \ ((atom "P" [fn "F" [X]]) and truth)).

pqtest0 R :- pullquants truth R.
pqtest01 R :- pullquants (forall X \ truth) R.
pqtest02 R :- pullquants ((exists Y \ false) and forall X \ truth) R.
pqtest1 R :- pullquants ((forall X \ truth and (atom "P" [fn "F" [X]])) and (forall Y \ false or (atom "Q" [fn "G" [Y]]))) R.
pqtest2 R :- pullquants ((forall X \ truth and (atom "P" [fn "F" [X]])) or (forall Y \ false or (atom "Q" [fn "G" [Y]]))) R.
pqtest3 R :- pullquants ((exists X \ truth and (atom "P" [fn "F" [X]])) or (exists Y \ false or (atom "Q" [fn "G" [Y]]))) R.
pqtest4 R :- pullquants (((forall X \ truth and (atom "P" [fn "F" [X]])) and (forall Y \ false or (atom "Q" [fn "G" [Y]]))) and false) R.

pqtest5 R :- pullquants ((forall X \ truth and (atom "P" [fn "F" [X]])) and (false or truth)) R.
pqtest6 R :- pullquants ((exists X \ truth and (atom "P" [fn "F" [X]])) or (false or truth)) R.
pqtest7 R :- pullquants ((exists X \ (atom "P" [fn "F" [X]])) and truth) R.
pqtest8 R :- pullquants (R and truth) (exists X \((atom "P" [fn "F" [X]]) and truth)).
/*-------- Test for prenex --------*/


pnxtest1 A :- pnx (forall X \ truth) A.
pnxtest2 A :- pnx (forall X \ exists Y \ atom "=" (X :: Y :: nil)) A.
pnxtest3 A :- pnx (forall X \ truth and (exists Y \ atom "=" (X :: Y :: nil))) A.

/*-------- Test for PNF --------*/

pnftest1 A:- pnf ((forall X \ truth) imp (forall Y \ false)) A.
pnftest2 A:- pnf (((forall X \ truth) imp truth) and (forall Y \ truth)) A.
pnftest3 A:- pnf ((forall X \ truth and (exists Y \ atom "=" (X :: Y :: nil))) imp false) A.

end