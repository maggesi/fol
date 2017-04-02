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



%And(Forall(x,p),Forall(y,q)) ->pullq(true,true) fm mk_forall mk_and x y p q
pullquants (and (forall X \ P X) (forall X \ Q X)) (forall X \ (and (P X) (Q X))):- fvt (forall x \ P x) L, fvt (forall x \ Q x) L, not (member X L).
pullquants (and (forall X \ P X) (forall X \ Q X)) (forall Z \ (and (P Z) (Q Z))):- fvt (forall x \ P x) L, fvt (forall x \ Q x) L, member X L.



end