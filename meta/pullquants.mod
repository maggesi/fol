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

%Op all'inizio
%pullquant (Op (Quant X \ P X) (Quant Y \ Q Y)) (Quant Z \ (Op (P Z) (Q Z))) :- (Op = and; Op = or), quant Quant Y, !. ----------------> continua a dare problemi

pullquant ((Quant X \ P X) and (Quant Y \ Q Y)) (Quant Z \ ((P Z) and (Q Z))) :- quant Quant Y, !.
pullquant ((Quant X \ P X) or (Quant Y \ Q Y)) (Quant Z \ ((P Z) or (Q Z))) :- quant Quant Y, !.
pullquant ((Quant X \ P X) and Q) (Quant Z \ (P Z) and Q) :- quant Quant Y, !.
pullquant ((Quant X \ P X) or Q) (Quant Z \ (P Z) or Q) :- quant Quant Y, !.
pullquant (P and (Quant Y \ Q Y)) (Quant Z \ P and (Q Z)) :- quant Quant Y, !.
pullquant (P or (Quant Y \ Q Y)) (Quant Z \ P or (Q Z)) :- quant Quant Y, !.
pullquant (Quant X \ P) (Quant X \ P) :- quant Quant Y.

quant forall forall.
quant exists exists.

/*
pullquants P (Quant X \ Q X) :- (Quant = forall; Quant = exists), print "hello\n", flush std_out, term_to_string Q Sq,
print Sq, term_to_string Quant Qu, print Qu, print "\n", flush std_out,
  pullquant P (Quant X \ P' X), !, print "hi\n", flush std_out,
  (pi X \ pullquants (P' X) (Q X)).
*/

/*
pullquants P (forall X \ Q X) :-
  print "all\n", flush std_out, term_to_string P Sq,
  print Sq, print "\n", flush std_out,
  pullquant P (forall X \ P' X), !, print "hi\n", flush std_out,
  (pi X \ pullquants (P' X) (Q X)),
  !.
pullquants P (exists X \ Q X) :-
  print "ex\n", flush std_out, term_to_string P Sq,
  print Sq, print "\n", flush std_out,
  pullquant P (exists X \ P' X), !, print "hi\n", flush std_out,
  (pi X \ pullquants (P' X) (Q X)),
  !.
pullquants P P :- not(pullquant P R).
*/

pullquants P (Quant X \ Q X) :-
  pullquant P (Quant X \ P' X), !,
 quant Quant Y, %non dovrebbe servire, ma serve
 (pi X \ pullquants (P' X) (Q X)).
pullquants P P.

end