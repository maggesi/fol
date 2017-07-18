module testsucc.

accumulate skolem.


/*-------- Test for psimplify --------*/

psimplifytest 1 "simplify" P Q :- P = ((neg false) or truth and truth), psimplify P Q.
psimplifytest 2 "simplify" P Q :- P = (false or truth and truth), psimplify P Q.
psimplifytest 3 "simplify" P Q :- P = (false imp truth imp truth), psimplify P Q.
psimplifytest 4 "simplify" P Q :- P = ((truth imp false) iff ((neg truth) imp truth)), psimplify P Q.
psimplifytest 5 "simplify" P Q :- P = (((neg truth) or (neg truth)) iff ((neg truth) imp truth)), psimplify P Q.
psimplifytest 6 "simplify" P Q :- P = (((forall X \ truth) or (neg truth)) iff ((neg truth) imp truth)), psimplify P Q.
psimplifytest 7 "simplify" P Q :- P = (forall X \ truth), psimplify P Q.
psimplifytest 8 "simplify" P Q :- P = ((forall X \ (atom "P" (fn "F" (X :: nil) :: nil))) imp truth), psimplify P Q.
psimplifytest 9 "simplify" P Q :- P = ((forall X \ (atom "P" (fn "F" (X :: nil) :: nil))) imp false), psimplify P Q.
psimplifytest 10 "simplify" P Q :- P = (((forall X \ (atom "P" (fn "F" (X :: nil) :: nil))) imp truth) and ((forall X \ (atom "P" (fn "F" (X :: nil) :: nil))) imp truth)), psimplify P Q.
psimplifytest 11 "simplify" P Q:- P = (((neg truth) and truth) iff (truth imp false)), psimplify P Q.
psimplifytest 12 "simplify" P Q:- P = ((exists X \ (atom "P" (X :: nil)) and forall X\ truth) imp (exists W\ atom "P" [W])), psimplify P Q.

/*-------- Test for NNF --------*/
nnftest 1 "Negation normal form (imp and iff)" P Q :- P = (neg (neg truth)), nnf P Q.
nnftest 2 "Negation normal form (imp and iff)" P Q :- P = (truth and false), nnf P Q.
nnftest 3 "Negation normal form (imp and iff)" P Q :- P = (false or truth), nnf P Q.
nnftest 4 "Negation normal form (imp and iff)" P Q :- P = (false imp truth), nnf P Q.
nnftest 5 "Negation normal form (imp and iff)" P Q :- P = ((truth imp false) or truth), nnf P Q.
%nnftest 6 "Negation normal form (imp and iff)" P Q :- P = (Q imp truth) (truth or truth), nnf P Q.
nnftest 7 "Negation normal form (imp and iff)" P Q :-  P = ((forall X \ exists A \ (atom "P" (fn "F" (A :: nil) :: nil))) and truth), nnf P Q.
nnftest 8 "Negation normal form (imp and iff)" P Q :- P = (forall X \ (exists A \ (atom "P" (fn "F" (A :: nil) :: nil))) imp truth), nnf P Q.
nnftest 9 "Negation normal form (imp and iff)" P Q :- P = (neg (neg (truth imp false))), nnf P Q.
nnftest 10 "Negation normal form (imp and iff)" P Q :- P = ((forall X \ (exists A \ (atom "P" (fn "F" (A :: nil) :: nil)))) imp truth), nnf P Q.
nnftest 11 "Negation normal form (imp and iff)" P Q :- P = ((truth imp false) or truth), nnf P Q.
nnftest 12 "Negation normal form (imp and iff)" P Q :- P = (((neg truth) imp false) iff ((neg false) imp truth)), nnf P Q.
nnftest 13 "Negation normal form (imp and iff)" P Q :- P = (forall X \ exists A \ (atom "P" (fn "F" (A :: nil) :: nil)) imp truth), nnf P Q.
nnftest 14 "Negation normal form (imp and iff)" P Q :- P = (((forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp truth) imp (forall X \ (atom "P" (fn "F" (X :: nil) :: nil)))) imp truth), nnf P Q.
nnftest 15 "Negation normal form (imp and iff)" P Q :- P = (((forall X \ (atom "P" (fn "F" (X :: nil) :: nil))) or false) iff truth), nnf P Q.
nnftest 16 "Negation normal form (imp and iff)" P Q :- P = (forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) or false), nnf P Q.
nnftest 17 "Negation normal form (imp and iff)" P Q :- P = ((forall X \ (atom "P" (fn "F" (X :: nil) :: nil))) iff truth), nnf P Q.
nnftest 18 "Negation normal form (imp and iff)" P Q :- P = (forall (X\ exists (Y \ atom "=" (X :: Y :: nil))) imp false), nnf P Q.
nnftest 19 "Negation normal form (imp and iff)" P Q :- P = (exists (W1\ atom "P" (W1 :: nil) and forall (W2\ truth)) imp exists (W1\ atom "P" (W1 :: nil))), nnf P Q.


/*-------- Test for simplify --------*/
simplifytest 1 "it drops a quantifier with false and truth" P Q:- P = (forall X \ truth), simplify P Q.
simplifytest 2 "it drops a quantifier with false and truth" P Q:- P = false, simplify P Q.
simplifytest 3 "it drops a quantifier with false and truth" P Q:- P = (false and (forall X \ truth)), simplify P Q.
simplifytest 4 "it drops a quantifier with false and truth" P Q:- P = (truth and(forall X \ truth)), simplify P Q.
simplifytest 5 "it drops a quantifier with false and truth" P Q:- P = (((neg truth) and (forall X \ truth)) iff (truth imp false)), simplify P Q.
simplifytest 6 "it drops a quantifier with false and truth" P Q:- P = (((forall X \ false) and (forall X \ truth)) iff (truth imp false)), simplify P Q.
simplifytest 7 "it drops a quantifier with false and truth" P Q:- P = ((truth and (exists Y \ truth)) iff (truth imp false)), simplify P Q.
simplifytest 8 "it drops a quantifier with false and truth" P Q:- P = ((false and (exists Y \ truth)) and (truth imp false)), simplify P Q.
simplifytest 9 "it drops a quantifier with false and truth" P Q:- P = ((((exists Y \ false) iff (forall X \ false)) and truth) and (truth imp false)), simplify P Q.
simplifytest 10 "it drops a quantifier with false and truth" P Q:- P = ((forall X \ false) or truth), simplify P Q.
simplifytest 11 "it drops a quantifier with false and truth" P Q:- P = ((forall X \ truth and (exists Y \ atom "=" (X :: Y :: nil))) imp false), simplify P Q.

simplifytest 12 "it drops a quantifier with false and truth" P Q:- P = ((forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp truth) imp (forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp false)), simplify P Q.
simplifytest 13 "it drops a quantifier with false and truth" P Q:- P = (truth or (forall Y \ (atom "P" [fn "F" [X]]))), simplify P Q.
simplifytest 14 "it drops a quantifier with false and truth" P Q:- P = (truth imp (forall Y \ (atom "P" [fn "F" [X]]))), simplify P Q.


/*-------- Test for pullquant --------*/
pullquanttest 1 "it pulls out a quantifier" P Q :-  P = ((forall X \ (atom "P" [fn "F" [X]])) and (forall Y \ (atom "Q" [fn "G" [Y]]))), pullquant P Q.
pullquanttest 2 "it pulls out a quantifier" P Q :-  P = truth, pullquant P Q.
pullquanttest 3 "it pulls out a quantifier" P Q :-  P = ((forall X \ (atom "P" [fn "F" [X]])) and truth), pullquant P Q.
pullquanttest 4 "it pulls out a quantifier" P Q :-  P = (truth and (forall Y \ (atom "P" [fn "F" [X]]))), pullquant P Q.
pullquanttest 5 "it pulls out a quantifier" P Q :-  P = (truth or (forall Y \ (atom "P" [fn "F" [X]]))), pullquant P Q.
pullquanttest 6 "it pulls out a quantifier" P Q :-  P = ((forall X \ (atom "P" [fn "F" [X]])) or truth), pullquant P Q.
pullquanttest 7 "it pulls out a quantifier" P Q :-  P = ((forall X \ (atom "P" [fn "F" [X]])) or (forall Y \ (atom "Q" [fn "G" [Y]]))), pullquant P Q.
pullquanttest 8 "it pulls out a quantifier" P Q :-  P = ((exists X \ (atom "P" [fn "F" [X]])) and (exists Y \ (atom "Q" [fn "G" [Y]]))), pullquant P Q.
pullquanttest 9 "it pulls out a quantifier" P Q :-  P = ((exists X \ (atom "P" [fn "F" [X]])) and truth), pullquant P Q.


pqtest 0 "pullquant in a deeper level" P Q :- P = truth, pullquants P Q.
pqtest 01 "pullquant in a deeper level" P Q :- P = (forall X \ truth), pullquants P Q.
pqtest 1 "pullquant in a deeper level" P Q :- P = ((forall X \ truth and (atom "P" [fn "F" [X]])) and (forall Y \ false or (atom "Q" [fn "G" [Y]]))), pullquants P Q.
pqtest 2 "pullquant in a deeper level" P Q :- P = ((forall X \ truth and (atom "P" [fn "F" [X]])) or (forall Y \ false or (atom "Q" [fn "G" [Y]]))), pullquants P Q.
pqtest 3 "pullquant in a deeper level" P Q :- P = ((exists X \ truth and (atom "P" [fn "F" [X]])) or (exists Y \ false or (atom "Q" [fn "G" [Y]]))), pullquants P Q.
pqtest 4 "pullquant in a deeper level" P Q :- P = ((forall X \ truth and (atom "P" [fn "F" [X]])) and (forall Y \ false or (atom "Q" [fn "G" [Y]]))), pullquants P Q.
pqtest 5 "pullquant in a deeper level" P Q :- P = ((forall X \ truth and (atom "P" [fn "F" [X]])) and (false or truth)), pullquants P Q.
pqtest 6 "pullquant in a deeper level" P Q :- P = ((exists X \ truth and (atom "P" [fn "F" [X]])) or (false or truth)), pullquants P Q.
pqtest 7 "pullquant in a deeper level" P Q :- P = ((exists X \ (atom "P" [fn "F" [X]])) and truth), pullquants P Q.
pqtest 8 "pullquant in a deeper level" P Q :- P = (((forall X \ (atom "P" [fn "F" [X]])) or (forall Z \ (atom "Q" [fn "H" [Z]])))  and (exists Y \ (atom "R" [fn "G" [Y]]))), pullquants P Q.
pqtest 9 "pullquant in a deeper level" P Q :- P = ((exists Y \ false) and (forall X \ truth)), pullquants P Q.
pqtest 10 "pullquant in a deeper level" P Q :- P = ((forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp truth) imp (forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp false)), pullquants P Q.

/*-------- Test for prenex --------*/


pnxtest 1 "it pulls out all the quantifiers" P Q :- P = (forall X \ truth), pnx P Q.
pnxtest 2 "it pulls out all the quantifiers" P Q :- P = (forall X \ exists Y \ atom "=" (X :: Y :: nil)), pnx P Q.
pnxtest 3 "it pulls out all the quantifiers" P Q :- P = (forall X \ truth and (exists Y \ atom "=" (X :: Y :: nil))), pnx P Q.


/*-------- Test for PNF --------*/

pnftest 1 "it applies simplify, nnf and pnx" P Q:- P = ((forall X \ truth) imp (forall Y \ false)), pnf P Q.
pnftest 2 "it applies simplify, nnf and pnx" P Q:- P = (((forall X \ truth) imp truth) and (forall Y \ truth)), pnf P Q.
pnftest 3 "it applies simplify, nnf and pnx" P Q:- P = ((forall X \ truth and (exists Y \ atom "=" (X :: Y :: nil))) imp false), pnf P Q.
pnftest 4 "it applies simplify, nnf and pnx" P Q:- P = ((forall X \ (atom "P" [fn "F" [X]]) and forall Z \ (atom "Q" [fn "H" [Z]])) or (forall Y \ (atom "R" [fn "G" [Y]]))), pnf P Q.
pnftest 5 "it applies simplify, nnf and pnx" P Q:- P = (((forall X \ (atom "P" [fn "F" [X]]) and forall Z \ (atom "Q" [fn "H" [Z]])) or (forall Y \ (atom "R" [fn "G" [Y]]))) imp forall X \ false), pnf P Q.
pnftest 6 "it applies simplify, nnf and pnx" P Q:- P = (((forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp truth) imp (forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp false)) and (exists Y \ (atom "P" (fn "F" (Y :: nil) :: nil)))), pnf P Q.

/*--------Test for Skolem--------*/
skolemtest 1 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = truth, myskolem A [] B Fms.
skolemtest 2 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (exists x \ atom "F" [x]), myskolem A [] B Fms.
skolemtest 3 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (exists x \ atom "F" [x, var "X"]), myskolem A [] B Fms.
skolemtest 4 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (forall Y \ atom "P" [Y, X]), myskolem A [] B Fms.
skolemtest 5 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (forall Y \ exists X \ atom "P" [Y, X]), myskolem A [] B Fms.
skolemtest 6 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (exists X \ atom "P" [X, var "Y"]), myskolem A [] B Fms.
skolemtest 7 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = ((forall Y \ (exists X \ (atom "P" [Y, X]))) or (forall X \ truth and exists Y \ atom "P" [X , Y])), myskolem A [] B Fms.
skolemtest 8 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (forall X \ truth), myskolem A [] B Fms.
skolemtest 9 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (exists X \ truth), myskolem A [] B Fms.
skolemtest 10 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = ((exists Y \ (atom "F" [Y])) and truth), myskolem A [] B Fms.
skolemtest 11 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = ((exists X \ (atom "P" (X :: nil)) and forall X\ truth) or (exists W\ atom "P" [W])), myskolem A [] B Fms.              
skolemtest 12 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (exists Y \ (exists X \ (atom "P" ( X :: nil)))), myskolem A [] B Fms.
skolemtest 13 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (((forall X \ (atom "P" [fn "F" [X]])) or (forall Z \ (atom "Q" [fn "H" [Z]])))  and (exists Y \ (atom "R" [fn "G" [Y]]))), myskolem A [] B Fms.
skolemtest 14 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (exists Y \ (exists X \ (atom "P" ( Y :: X :: nil)))), myskolem A [] B Fms.
skolemtest 15 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (exists Y \ (exists Z \ (exists X \ atom "P" [Y, Z, X]))), myskolem A [] B Fms.
skolemtest 16 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (forall (W1\ neg (atom "P" (W1 :: nil)) or exists (W2\ neg truth)) or exists (W1\ atom "P" (W1 :: nil))), myskolem A [] B Fms.
skolemtest 17 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (forall (W1\ neg (atom "P" (W1 :: nil)) or exists (W2\ neg (atom "P" [W2]))) or exists (W1\ atom "P" (W1 :: nil))), myskolem A [] B Fms.
skolemtest 18 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (exists X \ neg (atom "P" [Y])), myskolem A [] B Fms.  	  	    	       	      	   	    	   	   
skolemtest 19 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (forall Y \ (exists Z \ (exists X \ neg (atom "P" [Y, Z, X])))), myskolem A [] B Fms.
skolemtest 20 "skolem substitute the existential quantifier with a function sko" A B Fms :- A = (forall X \ (exists Y \ neg (atom "P" [X, Y]))), myskolem A [] B Fms.

%------------------------------------test per askolemize--------------------------------%

askolemizetest 21 "askolemize applies simplify, nnf and skolem." A B :- A = truth, askolemize A B.
askolemizetest 22 "askolemize applies simplify, nnf and skolem." A B :- A = (exists x \ atom "F" [x]), askolemize A B.
askolemizetest 23 "askolemize applies simplify, nnf and skolem." A B :- A = (exists x \ atom "F" [x, var "X"]), askolemize A B.
askolemizetest 24 "askolemize applies simplify, nnf and skolem." A B :- A = (forall Y \ atom "P" [Y, X]), askolemize A B.
askolemizetest 25 "askolemize applies simplify, nnf and skolem." A B :- A = (forall Y \ exists X \ atom "P" [Y, X]), askolemize A B.
askolemizetest 26 "askolemize applies simplify, nnf and skolem." A B :- A = (exists X \ atom "P" [X, var "Y"]), askolemize A B.
askolemizetest 27 "askolemize applies simplify, nnf and skolem." A B :- A = ((forall Y \ (exists X \ (atom "P" [Y, X]))) imp (forall X \ truth)), askolemize A B.
askolemizetest 28 "askolemize applies simplify, nnf and skolem." A B :- A = (forall X \ truth), askolemize A B.
askolemizetest 29 "askolemize applies simplify, nnf and skolem." A B :- A = (exists X \ truth), askolemize A B.
askolemizetest 30 "askolemize applies simplify, nnf and skolem." A B :- A = ((exists Y \ (atom "F" [Y])) and truth), askolemize A B.
askolemizetest 31 "askolemize applies simplify, nnf and skolem." A B :- A = ((exists X \ (atom "P" (X :: nil)) and forall X\ truth) imp (exists W\ atom "P" [W])), askolemize A B.
askolemizetest 32 "askolemize applies simplify, nnf and skolem." A B :- A = ((exists X \ (atom "P" [fn "F" [X]])) iff (forall Y \ (atom "Q" [fn "G" [Y]]))), askolemize A B.
askolemizetest 33 "askolemize applies simplify, nnf and skolem." A B :- A = (((forall X \ (atom "P" [fn "F" [X]])) or (forall Z \ (atom "Q" [fn "H" [Z]])))  and (exists Y \ (atom "R" [fn "G" [Y]]))), askolemize A B.
askolemizetest 34 "askolemize applies simplify, nnf and skolem." A B :- A = (exists Y \ (exists X \ (atom "P" ( Y :: X :: nil)))), askolemize A B.
askolemizetest 35 "askolemize applies simplify, nnf and skolem." A B :- A = (exists Y \ (exists Z \ (exists X \ atom "P" [Y, Z, X]))), askolemize A B.
askolemizetest 36 "askolemize applies simplify, nnf and skolem." A B :- A = (forall (W1\ neg (atom "P" (W1 :: nil)) or exists (W2\ neg truth)) or exists (W1\ atom "P" (W1 :: nil))), askolemize A B.
askolemizetest 37 "askolemize applies simplify, nnf and skolem." A B :- A = (forall (W1\ neg (atom "P" (W1 :: nil)) or exists (W2\ neg (atom "P" [W2]))) or exists (W1\ atom "P" (W1 :: nil))), askolemize A B.


end