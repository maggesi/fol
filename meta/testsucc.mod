module testsucc.

accumulate psimplify, nnf, simplify, pullquants, prenex.

/*-------- Test for psimplify --------*/
psimplifytest1 Q :- psimplify ((neg false) or truth and truth) Q.
psimplifytest2 Q :- psimplify (Q or truth and truth) truth.
psimplifytest3 Q :- psimplify (Q imp truth imp truth) false.
psimplifytest4 Q :- psimplify ((truth imp false) iff ((neg truth) imp truth)) Q.
psimplifytest5 Q :- psimplify (((neg Q) or (neg truth)) iff ((neg truth) imp truth)) Q.

/*-------- Test for NNF --------*/
nnftest1 Y:- nnf (neg (neg truth)) Y.
nnftest2 Y:- nnf (truth and false) Y.
nnftest3 Y:- nnf (false or truth) Y.
nnftest4 Y:- nnf (false imp truth) Y.
nnftest5 Y:- nnf ((truth imp false) or truth) Y.
nnftest6 Y:- nnf (Y imp truth) (truth or truth).
nnftest7 Y:-  nnf (forall X \ exists A \ (atom "P" (fn "F" (A :: nil) :: nil)) and truth) Y.
nnfrectest1 Y:- nnfrec ((truth imp false) or truth) Y.
nnfrectest2 Y:- nnfrec (((neg truth) imp false) iff ((neg false) imp truth)) Y.
nnfrectest3 Y:- nnfrec (forall X \ exists A \ (atom "P" (fn "F" (A :: nil) :: nil)) imp truth) Y.

/*-------- Test for simplify --------*/
simplifytest1 A:- %print "(forall X \ truth)",
	      	  simplify (forall X \ truth) A.
simplifytest2 A:- %print "false A",
	      	  simplify false A.
simplifytest3 A:- %print "(false and (forall X \ truth))",
	      	  simplify (false and (forall X \ truth)) A.
simplifytest4 A:-% print "(truth and(forall X \ truth))",
	      	  simplify (truth and(forall X \ truth)) A.
simplifytest5 A:-% print "(((neg truth) and (forall X \ truth)) iff (truth imp false))",
	      	  simplify (((neg truth) and (forall X \ truth)) iff (truth imp false)) A.
/* A := truth, sbagliato*/
simplifytest6 A:- %print "simplify (((forall X \ A) and (forall X \ truth)) iff (truth imp false)) A",
	      	  simplify (((forall X \ A) and (forall X \ truth)) iff (truth imp false)) A.
simplifytest7 A:- %print "simplify ((A and (exists Y \ truth)) iff (truth imp false)) truth",
	      	  simplify ((A and (exists Y \ truth)) iff (truth imp false)) truth.
simplifytest8 A:- %print "simplify ((A and (exists Y \ truth)) and (truth imp false)) truth",
	      	  simplify ((A and (exists Y \ truth)) and (truth imp false)) truth.
simplifytest9 A:- print "simplify ((A and truth) and (truth imp false)) truth",
	      	  simplify ((A and truth) and (truth imp false)) truth.
simplifytest10 A:- print "simplify A false", simplify A false.


/*-------- Test for pullquant --------*/

pqtest1 R :- pullquants ((forall X \ truth and (atom "P" [fn "F" [X]])) and (forall Y \ false or (atom "Q" [fn "G" [Y]]))) R.
pqtest2 R :- pullquants ((forall X \ truth and (atom "P" [fn "F" [X]])) or (forall Y \ false or (atom "Q" [fn "G" [Y]]))) R.
pqtest3 R :- pullquants ((exists X \ truth and (atom "P" [fn "F" [X]])) or (exists Y \ false or (atom "Q" [fn "G" [Y]]))) R.
pqtest4 R :- pullquants ((forall X \ truth and (atom "P" [fn "F" [X]])) and (exists Y \ false or (atom "Q" [fn "G" [Y]]))) R.

pqtest5 R :- pullquants ((forall X \ truth and (atom "P" [fn "F" [X]])) and (false or truth)) R.
pqtest6 R :- pullquants ((exists X \ truth and (atom "P" [fn "F" [X]])) or (false or truth)) R.

/*-------- Test for prenex --------*/


pnxtest1 A :- pnx (forall X \ truth) A.
pnxtest2 A :- pnx (forall X \ exists Y \ atom "=" (X :: Y :: nil)) A.
pnxtest3 A :- pnx (forall X \ truth and (exists Y \ atom "=" (X :: Y :: nil))) A.

/*-------- Test for PNF --------*/

pnftest1 A:- pnf ((forall X \ truth) imp (forall Y \ false)) A.
pnftest1 A:- pnf (((forall X \ truth) imp truth) and (forall Y \ false)) A.

end