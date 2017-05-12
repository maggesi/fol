module testsucc.

accumulate prenex.


/*-------- Test for psimplify --------*/

psimplifytest1 Q :- psimplify ((neg false) or truth and truth) Q.
psimplifytest2 Q :- psimplify (false or truth and truth) Q.
psimplifytest3 Q :- psimplify (false imp truth imp truth) Q.
psimplifytest4 Q :- psimplify ((truth imp false) iff ((neg truth) imp truth)) Q.
psimplifytest5 Q :- psimplify (((neg truth) or (neg truth)) iff ((neg truth) imp truth)) Q.
psimplifytest6 Q :- psimplify (((forall X \ truth) or (neg truth)) iff ((neg truth) imp truth)) Q.
psimplifytest7 Q :- psimplify (forall X \ truth) Q.
psimplifytest8 Q :- psimplify ((forall X \ (atom "P" (fn "F" (X :: nil) :: nil))) imp truth) Q.
psimplifytest9 Q :- psimplify ((forall X \ (atom "P" (fn "F" (X :: nil) :: nil))) imp false) Q.
psimplifytest10 Q :- psimplify (((forall X \ (atom "P" (fn "F" (X :: nil) :: nil))) imp truth) and ((forall X \ (atom "P" (fn "F" (X :: nil) :: nil))) imp truth)) Q.
psimplifytest11 Q:- psimplify (((neg truth) and truth) iff (truth imp false)) Q.

/*-------- Test for NNF --------*/
nnftest1 Y:- nnf (neg (neg truth)) Y.
nnftest2 Y:- nnf (truth and false) Y.
nnftest3 Y:- nnf (false or truth) Y.
nnftest4 Y:- nnf (false imp truth) Y.
nnftest5 Y:- nnf ((truth imp false) or truth) Y.
nnftest6 Y:- nnf (Y imp truth) (truth or truth).
nnftest7 Y:-  nnf ((forall X \ exists A \ (atom "P" (fn "F" (A :: nil) :: nil))) and truth) Y.
%problema con nnftest8: R = forall (W1\ exists (W2\ atom "P" (fn "F" (W2 :: nil) :: nil) imp truth))
nnftest8 Y:- nnf (forall X \ (exists A \ (atom "P" (fn "F" (A :: nil) :: nil))) imp truth) Y.
nnftest9 Y:- nnf (neg (neg (truth imp false))) Y.
nnftest10 Y:- nnf ((forall X \ (exists A \ (atom "P" (fn "F" (A :: nil) :: nil)))) imp truth) Y.
%nnftest10: no solutions.
nnftest11 Y:- nnf ((truth imp false) or truth) Y.
nnftest12 Y:- nnf (((neg truth) imp false) iff ((neg false) imp truth)) Y.
nnftest13 Y:- nnf (forall X \ exists A \ (atom "P" (fn "F" (A :: nil) :: nil)) imp truth) Y.
nnftest14 Y:- nnf (((forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp truth) imp (forall X \ (atom "P" (fn "F" (X :: nil) :: nil)))) imp truth) Y.
nnftest15 Y:- nnf (((forall X \ (atom "P" (fn "F" (X :: nil) :: nil))) or false) iff truth) Y.
nnftest16 Y:- nnf (forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) or false) Y.
nnftest17 Y:- nnf ((forall X \ (atom "P" (fn "F" (X :: nil) :: nil))) iff truth) Y.
nnftest18 Y:- nnf (forall (X\ exists (Y \ atom "=" (X :: Y :: nil))) imp false) Y.
%formula usata semplificata con simplifytest11, presa da pnftest3

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
simplifytest11 A:- simplify ((forall X \ truth and (exists Y \ atom "=" (X :: Y :: nil))) imp false) A.
simplifytest12 A:- simplify ((forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp truth) imp (forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp false)) A.
simplifytest13 A :- simplify (truth or (forall Y \ (atom "P" [fn "F" [X]]))) A.
simplifytest14 A :- simplify (truth imp (forall Y \ (atom "P" [fn "F" [X]]))) A.


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
pqtest1 R :- pullquants ((forall X \ truth and (atom "P" [fn "F" [X]])) and (forall Y \ false or (atom "Q" [fn "G" [Y]]))) R.
pqtest2 R :- pullquants ((forall X \ truth and (atom "P" [fn "F" [X]])) or (forall Y \ false or (atom "Q" [fn "G" [Y]]))) R.
pqtest3 R :- pullquants ((exists X \ truth and (atom "P" [fn "F" [X]])) or (exists Y \ false or (atom "Q" [fn "G" [Y]]))) R.
pqtest4 R :- pullquants ((forall X \ truth and (atom "P" [fn "F" [X]])) and (forall Y \ false or (atom "Q" [fn "G" [Y]]))) R.
pqtest5 R :- pullquants ((forall X \ truth and (atom "P" [fn "F" [X]])) and (false or truth)) R.
pqtest6 R :- pullquants ((exists X \ truth and (atom "P" [fn "F" [X]])) or (false or truth)) R.
pqtest7 R :- pullquants ((exists X \ (atom "P" [fn "F" [X]])) and truth) R.
pqtest8 R :- pullquants (((forall X \ (atom "P" [fn "F" [X]])) or (forall Z \ (atom "Q" [fn "H" [Z]])))  and (exists Y \ (atom "R" [fn "G" [Y]]))) R.
pqtest9 R :- pullquants ((exists Y \ false) and (forall X \ truth)) R.
pqtest10 R:- pullquants ((forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp truth) imp (forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp false)) R.

/*-------- Test for prenex --------*/


pnxtest1 A :- pnx (forall X \ truth) A.
pnxtest2 A :- pnx (forall X \ exists Y \ atom "=" (X :: Y :: nil)) A.
pnxtest3 A :- pnx (forall X \ truth and (exists Y \ atom "=" (X :: Y :: nil))) A.

/*-------- Test for PNF --------*/

pnftest1 A:- pnf ((forall X \ truth) imp (forall Y \ false)) A.
pnftest2 A:- pnf (((forall X \ truth) imp truth) and (forall Y \ truth)) A.
pnftest3 A:- pnf ((forall X \ truth and (exists Y \ atom "=" (X :: Y :: nil))) imp false) A.
%no solutions for pnftest3
pnftest4 A :- pnf ((forall X \ (atom "P" [fn "F" [X]]) and forall Z \ (atom "Q" [fn "H" [Z]])) or (forall Y \ (atom "R" [fn "G" [Y]]))) A.
pnftest5 A :- pnf (((forall X \ (atom "P" [fn "F" [X]]) and forall Z \ (atom "Q" [fn "H" [Z]])) or (forall Y \ (atom "R" [fn "G" [Y]]))) imp forall X \ false) A.
%no solutions before
pnftest6 A:- pnf (((forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp truth) imp (forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp false)) and (exists Y \ (atom "P" (fn "F" (Y :: nil) :: nil)))) A.
%no solutions before



% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------

simple_string N "A" :- N >= 1.
simple_string N "B" :- N >= 2.
simple_string N "C" :- N >= 3.
simple_string N "D" :- N >= 4.
simple_string N "E" :- N >= 5.
simple_string N "F" :- N >= 6.

leq N N :- N >= 0.
leq N M :- N >= 1, N' is N - 1, leq N' M.

split N M K :- leq N M, K is N - M.

term N (var S) :- simple_string N S.
term N (fn S Tms) :- split N M K, simple_string M S, terms K Tms.
terms 0 [].
terms N (T :: Tms) :- split N M K, term M T, terms K Tms.

form N (atom S Tms) :- split N M K, simple_string M S, terms K Tms.
form N truth :- N > 0.
form N false :- N > 0.
form N (neg P) :- N > 0, N' is N - 1, form N' P.
form N (P and Q) :- N > 0, N' is N - 1, split N' M K, form M P, form K Q.
form N (P or Q) :- N > 0, N' is N - 1, split N' M K, form M P, form K Q.
form N (P imp Q) :- N > 0, N' is N - 1, split N' M K, form M P, form K Q.
form N (P iff Q) :- N > 0, N' is N - 1, split N' M K, form M P, form K Q.
form N (forall X\ P X) :- N > 0, N' is N - 1, pi X\ form N' (P X).
form N (exists X\ P X) :- N > 0, N' is N - 1, pi X\ form N' (P X).

% All subterms (including itself).

subform P P.
subform P Q :- psubform P Q.

% Proper subforms
psubform (neg P) Q :- subform P Q.
psubform (P and Q) R :- subform P R; subform Q R. 
psubform (P or Q) R :- subform P R; subform Q R. 
psubform (P imp Q) R :- subform P R; subform Q R. 
psubform (P iff Q) R :- subform P R; subform Q R. 
psubform (forall X\ P X) Q :- pi X\ subform (P X) Q.
psubform (exists X\ P X) Q :- pi X\ subform (P X) Q.

notsimpl1 (neg truth).
notsimpl1 (neg (neg P)).
% ....

notsimpl P :- subform P Q, notsimpl Q.

testsimpl N P :- form N P, simplify P Q, notsimpl Q.

testnotsimpl N P :- form N P, notsimpl P.

end