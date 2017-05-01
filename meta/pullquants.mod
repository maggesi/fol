module pullquants.
accumulate fol, simplify, lib.
/*To pull out all quantifiers that occur as immediate subformulas of either conjunction or disjunction
let rec pullquants fm =
match fm with
And(Forall(x,p),Forall(y,q)) ->pullq(true,true) fm mk_forall mk_and x y p q
| Or(Exists(x,p),Exists(y,q)) -> pullq(true,true) fm mk_exists mk_or x y p q
| And(Forall(x,p),q) -> pullq(true,false) fm mk_forall mk_and x x p q
| And(p,Forall(y,q)) -> pullq(false,true) fm mk_forall mk_and y y p q
| Or(Forall(x,p),q) -> pullq(true,false) fm mk_forall mk_or x x p q
| Or(p,Forall(y,q)) -> pullq(false,true) fm mk_forall mk_or y y p q
| And(Exists(x,p),q) -> pullq(true,false) fm mk_exists mk_and x x p q
| And(p,Exists(y,q)) -> pullq(false,true) fm mk_exists mk_and y y p q
| Or(Exists(x,p),q) -> pullq(true,false) fm mk_exists mk_or x x p q
| Or(p,Exists(y,q)) -> pullq(false,true) fm mk_exists mk_or y y p q
| _ -> fm

Where pullq calls the main pullquants functions again on the body to pull up further quantifiers:

and pullq(l,r) fm quant op x y p q =
let z = variant x (fv fm) in
let p’ = if l then subst (x |=> Var z) p else p
and q’ = if r then subst (y |=> Var z) q else q in
quant z (pullquants(op p’ q’));;
*/
%Codice con Op - non funziona
/*
pullquants (Quant X \ (P X) Op Quant Y \ (Q Y)) (Quant Z \ R Z) :-
 (Op = and; Op = or), (Quant = forall; Quant = exists), !,
 (pi W \ pullquants ((P W) Op (Q W)) (R W)).
pullquants ((Quant X \ P X) Op Q) ((Quant Z \ P Z) Op Q) :-
 (Op = and; Op = or), (Quant = forall; Quant = exists), !,
 (pi W \ pullquants ((P W) Op Q) (R W)).
pullquants (P Op (Quant Y \ Q Y)) (Quant Z \ (P Op Q Z)) :-
 (Op = and; Op = or), (Quant = forall; Quant = exists), !,
 (pi W \ pullquants (P Op Q W) (R W)).
pullquants (P Op Q) (P Op Q) :- (Op = and; Op = or).
*/
% Problema: perché questo codice sotto non è equivalente a quello sopra?!
/*
pullquant (Op (Quant X \ P X) (Quant Y \ Q Y)) (Quant Z \ (Op (P Z) (Q Z))) :- (Op = and; Op = or), (Quant = forall; Quant = exists), !.
pullquant (Op (Quant X \ P X) Q) (Quant Z \ Op (P Z) Q) :- (Op = and; Op = or), (Quant = forall; Quant = exists), !.
pullquant (Op P (Quant Y \ Q Y)) (Quant Z \ Op P (Q Z)) :- (Op = and; Op = or), (Quant = forall; Quant = exists).

pullquants P (Quant X \ Q X) :-
  pullquant P (Quant X \ P' X), !,
  (pi X \ pullquants (P' X) (Q X)).
pullquants P P :- print "Hello".
*/
%Codice con and/or al posto di Op - funziona
/*
pullquants (Quant X \ (P X) and Quant Y \ (Q Y)) (Quant Z \ R Z) :-
 (Quant = forall; Quant = exists), !,
 (pi W \ pullquants ((P W) and (Q W)) (R W)).
pullquants (Quant X \ (P X) or Quant Y \ (Q Y)) (Quant Z \ R Z) :-
 (Quant = forall; Quant = exists), !,
 (pi W \ pullquants ((P W) or (Q W)) (R W)).
pullquants ((Quant X \ P X) and Q) ((Quant Z \ P Z) and Q) :-
 (Quant = forall; Quant = exists), !,
 (pi W \ pullquants ((P W) and Q) (R W)).
pullquants ((Quant X \ P X) or Q) ((Quant Z \ P Z) or Q) :-
 (Quant = forall; Quant = exists), !,
 (pi W \ pullquants ((P W) or Q) (R W)).
pullquants (P and (Quant Y \ Q Y)) (Quant Z \ (P and Q Z)) :-
 (Quant = forall; Quant = exists), !,
 (pi W \ pullquants (P and Q W) (R W)).
pullquants (P or (Quant Y \ Q Y)) (Quant Z \ (P or Q Z)) :-
 (Quant = forall; Quant = exists), !,
 (pi W \ pullquants (P or Q W) (R W)).
%pullquants (P and Q) (P and Q).
%pullquants (P or Q) (P or Q).
*/
/*
pullquant ((Quant X \ P X) and (Quant Y \ Q Y)) (Quant Z \ ((P Z) and (Q Z))) :- (Quant = forall; Quant = exists), !.
pullquant ((Quant X \ P X) or (Quant Y \ Q Y)) (Quant Z \ ((P Z) or (Q Z))) :- (Quant = forall; Quant = exists), !.
pullquant ((Quant X \ P X) and Q) (Quant Z \ (P Z) and Q) :- (Quant = forall; Quant = exists), !.
pullquant ((Quant X \ P X) or Q) (Quant Z \ (P Z) or Q) :- (Quant = forall; Quant = exists), !.
pullquant (P and (Quant Y \ Q Y)) (Quant Z \ P and (Q Z)) :- (Quant = forall; Quant = exists).
pullquant (P or(Quant Y \ Q Y)) (Quant Z \ P or (Q Z)) :- (Quant = forall; Quant = exists).
pullquant truth truth.
pullquant false false.



pullquants P (Quant X \ Q X) :-
  pullquant P (Quant X \ P' X), !,
  (pi X \ pullquants (P' X) (Q X)).


*/
%/*
pullquant ((Quant X \ P X) and (Quant Y \ Q Y)) (Quant Z \ ((P Z) and (Q Z))) :- (Quant = forall; Quant = exists), !.
pullquant ((Quant X \ P X) or (Quant Y \ Q Y)) (Quant Z \ ((P Z) or (Q Z))) :- (Quant = forall; Quant = exists), !.
pullquant ((Quant X \ P X) and truth) (Quant Z \ (P Z) and truth) :- (Quant = forall; Quant = exists), !.
pullquant ((Quant X \ P X) and false) (Quant Z \ (P Z) and false) :- (Quant = forall; Quant = exists), !.
pullquant ((Quant X \ P X) or truth) (Quant Z \ (P Z) or truth) :- (Quant = forall; Quant = exists), !.
pullquant ((Quant X \ P X) or false) (Quant Z \ (P Z) or false) :- (Quant = forall; Quant = exists), !.
pullquant (truth and (Quant Y \ Q Y)) (Quant Z \ truth and (Q Z)) :- (Quant = forall; Quant = exists).
pullquant (false and (Quant Y \ Q Y)) (Quant Z \ false and (Q Z)) :- (Quant = forall; Quant = exists).
pullquant (truth or (Quant Y \ Q Y)) (Quant Z \ truth or (Q Z)) :- (Quant = forall; Quant = exists).
pullquant (false or (Quant Y \ Q Y)) (Quant Z \ false or (Q Z)) :- (Quant = forall; Quant = exists).
pullquant truth truth.
pullquant false false.
pullquant (Quant X \ truth) (Quant X \ truth).
pullquant (Quant X \ false) (Quant X \ false). 

/*
pullquants P (Quant X \ Q X) :- print "hello",
  pullquant P (Quant X \ P' X), !,
  (pi X \ pullquants (P' X) (Q X)).
*/


%/*
pullquants (P and Q) Y:- print "hello", pullquants P P1, pullquants Q Q1, pullquant (P1 and Q1) Y.
pullquants (P or Q) Y:- print "Hi", pullquants P P1, pullquants Q Q1, pullquant (P1 or Q1) Y.
pullquants P Q:- pullquant P Q.



%*/

end