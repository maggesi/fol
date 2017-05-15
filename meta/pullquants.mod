module pullquants.

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

%Op all'inizio
%pullquant (Op (Quant X \ P X) (Quant Y \ Q Y)) (Quant Z \ (Op (P Z) (Q Z))) :- (Op = and; Op = or), quant Quant, !.

pullquant1 ((Quant X \ P X) and (Quant Y \ Q Y)) (Quant Z \ ((P Z) and (Q Z))) :- quant Quant, !.
pullquant1 ((Quant X \ P X) or (Quant Y \ Q Y)) (Quant Z \ ((P Z) or (Q Z))) :- quant Quant, !.
pullquant1 ((Quant X \ P X) and Q) (Quant Z \ (P Z) and Q) :- quant Quant, !.
pullquant1 ((exists X \ P X) or Q) (exists Z \ ((P Z) or Q)) :-
  print "hello: ", term_to_string ((exists X \ P X) or Q) S, print S, print " ",
  print "out: ", term_to_string (exists Z \ ((P Z) or Q)) S', print S',
  print "\n", flush std_out, !.
pullquant1 ((Quant X \ P X) or Q) (Quant Z \ (P Z) or Q) :- quant Quant, !.
pullquant1 (P and (Quant Y \ Q Y)) (Quant Z \ P and (Q Z)) :- quant Quant, !.
pullquant1 (P or (Quant Y \ Q Y)) (Quant Z \ P or (Q Z)) :- quant Quant, !.
pullquant1 (Quant X \ P) (Quant X \ P) :- quant Quant.

pullquant P Q:- reflct "pullquant" pullquant1 P Q.
quant forall.
quant exists.

pullquants1 P (Quant X \ Q X) :-
  pullquant P (Quant X \ P' X),
  quant Quant,    %%%%%%%%%%%%%%%% PERCHE'?????? (ALTRIMENTI Stack overflow)
  (pi X \ pullquants (P' X) (Q X)).

pullquants P Q:- reflct "pullquants" pullquants1 P Q.

end