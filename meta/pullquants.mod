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
/*
pqtest R :- pullquants ((forall X \ truth and (atom "P" [fn "F" [X]])) and (forall Y \ false or (atom "Q" [fn "G" [Y]]))) R.
pqtest R :- pullquants ((forall X \ truth and (atom "P" [fn "F" [X]])) or (forall Y \ false or (atom "Q" [fn "G" [Y]]))) R.
pqtest R :- pullquants ((exists X \ truth and (atom "P" [fn "F" [X]])) or (exists Y \ false or (atom "Q" [fn "G" [Y]]))) R.
pqtest R :- pullquants ((forall X \ truth and (atom "P" [fn "F" [X]])) and (exists Y \ false or (atom "Q" [fn "G" [Y]]))) R.

pqtest R :- pullquants ((forall X \ truth and (atom "P" [fn "F" [X]])) and (false or truth)) R.
pqtest R :- pullquants ((exists X \ truth and (atom "P" [fn "F" [X]])) or (false or truth)) R.
*/
end