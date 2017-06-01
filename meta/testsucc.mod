module testsucc.

accumulate prenex.


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
%pullquanttest 10 "it pulls out a quantifier" P Q :-  P = (R and truth) (exists X \ ((atom "P" [fn "F" [X]]) and truth)).

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
%A = forall (W1\ exists (W2\ truth and atom "=" (W1 :: W2 :: nil)))
%More solutions (y/n)? y
%A = forall (W1\ truth and exists (W2\ atom "=" (W1 :: W2 :: nil)))

/*-------- Test for PNF --------*/

pnftest 1 "it applies simplify, nnf and pnx" P Q:- P = ((forall X \ truth) imp (forall Y \ false)), pnf P Q.
pnftest 2 "it applies simplify, nnf and pnx" P Q:- P = (((forall X \ truth) imp truth) and (forall Y \ truth)), pnf P Q.
pnftest 3 "it applies simplify, nnf and pnx" P Q:- P = ((forall X \ truth and (exists Y \ atom "=" (X :: Y :: nil))) imp false), pnf P Q.
pnftest 4 "it applies simplify, nnf and pnx" P Q:- P = ((forall X \ (atom "P" [fn "F" [X]]) and forall Z \ (atom "Q" [fn "H" [Z]])) or (forall Y \ (atom "R" [fn "G" [Y]]))), pnf P Q.
pnftest 5 "it applies simplify, nnf and pnx" P Q:- P = (((forall X \ (atom "P" [fn "F" [X]]) and forall Z \ (atom "Q" [fn "H" [Z]])) or (forall Y \ (atom "R" [fn "G" [Y]]))) imp forall X \ false), pnf P Q.
pnftest 6 "it applies simplify, nnf and pnx" P Q:- P = (((forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp truth) imp (forall X \ (atom "P" (fn "F" (X :: nil) :: nil)) imp false)) and (exists Y \ (atom "P" (fn "F" (Y :: nil) :: nil)))), pnf P Q.




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