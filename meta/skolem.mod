module skolem.

accumulate prenex.

/* Harrison:

let rec funcs tm =
  match tm with
    Var x -> []
  | Fn(f,args) -> itlist (union ** funcs) args [f,length args];;

let functions fm =
  atom_union (fun (R(p,a)) -> itlist (union ** funcs) a []) fm;;

let rec skolem fm fns =
  match fm with
    Exists(y,p) ->
      let xs = fv(fm) in
      let f = variant (if xs = [] then "c_"^y else "f_"^y) fns in
      let fx = Fn(f,map (fun x -> Var x) xs) in
      skolem (subst (y |=> fx) p) (f::fns)
  | Forall(x,p) -> let p’,fns’ = skolem p fns in Forall(x,p’),fns’
  | And(p,q) -> skolem2 (fun (p,q) -> And(p,q)) (p,q) fns
  | Or(p,q) -> skolem2 (fun (p,q) -> Or(p,q)) (p,q) fns
  | _ -> fm,fns

When dealing with binary connectives, the set of functions to avoid needs
to be updated with new Skolem functions introduced into one formula before
tackling the other, hence the auxiliary function skolem2:

and skolem2 cons (p,q) fns =
  let p’,fns’ = skolem p fns in
  let q’,fns’’ = skolem q fns’ in
  cons(p’,q’),fns’’;;

askolemize fa simplify poi nnf e skolem
*/

is_var (var _).

local variant_aux list string -> string -> list string -> string -> o.
variant S L S' :- variant_aux L S L S'.
variant_aux Avoid S [] S.
variant_aux Avoid S [S|L] S'' :- !, S' is S ^ "'", variant_aux Avoid S' Avoid S''.
variant_aux Avoid S [_|L] S' :- variant_aux Avoid S L S'.



myskolem0 truth Fms truth Fms.
myskolem0 false Fms false Fms.
myskolem0 (atom S Args) Fms (atom S Args) Fms.
myskolem0 (P and Q) Fns (P' and Q') Fns' :-
  myskolem0 P Fns P' Fns', myskolem0 Q Fns' Q' Fns''.
myskolem0 (P or Q) Fns (P' or Q') Fns' :-
  myskolem0 P Fns P' Fns', myskolem0 Q Fns' Q' Fns''.
myskolem0 (P imp Q) Fns (P' imp Q') Fns' :-
  myskolem0 P Fns P' Fns', myskolem0 Q Fns' Q' Fns''.
myskolem0 (P iff Q) Fns (P' iff Q') Fns' :-
  myskolem0 P Fns P' Fns', myskolem0 Q Fns' Q' Fns''.

myskolem0 (forall x \ P x) Fns (forall x \ P' x) Fns' :-
  pi x \ is_var x => myskolem0 (P x) Fns (P' x) Fns'.
myskolem0 (exists x \ P x) Fns (Q (fn S Vs)) Fns' :-
   print "Hello",
   variant "sko" Fns S,
   freesFm (exists x \ P x) Vs,
   %%% map mkVar L Vs,
   %%% myskolem0 (P (fn S Vs)) [S|Fns] Q Fns'.
   pi x \ myskolem0 (P x) [S|Fns] (Q x) Fns'.

myskolem0 (neg A) Fns (neg A1) Fns' :- myskolem0 A Fns A1 Fns'.
%myskolem0 (forall X \ (neg (A X))) Fns (forall X \ (neg (B X))) Fns' :- myskolem0 (forall X \ (A X)) Fns (forall X \ (B X)) Fns'.
myskolem0 (exists x \ neg (P x)) Fns (neg Q) Fns' :- myskolem0 (exists x \ P x) Fns Q Fns'.



myskolem A Fms B Fms' :- reflcSkolem myskolem0 A Fms B Fms'.
reflcSkolem R X Fms Y Fms':- R X Fms Y Fms', !.
reflcSkolem R X Fms X Fms.
%aggiunta per capire dove stava l'errore

askolemize P Q:- simplify P P1, nnf P1 P2, myskolem P2 [] Q Fms.


freesTm X [X] :- is_var X, !.
freesTm (fn S Args) L :- freesTms Args L.
freesTms [] [].
freesTms [T|Ts] L :- freesTm T LT, freesTms Ts LTs, union LT LTs L.


freesFm truth [].
freesFm false [].
freesFm (atom S Args) L :- freesTms Args L.
freesFm (P and Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (P or Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (P imp Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (P iff Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (Quant X \ P X) L :- quant Quant, freesFm (P (fn "dummy" [])) L.

%% mkVar S (var S).

test 1 A B Fms :- A = truth, myskolem A [] B Fms.
test 2 A B Fms :- A = (exists x \ atom "F" [x]), myskolem A [] B Fms.
test 3 A B Fms :- A = (exists x \ atom "F" [x, var "X"]), myskolem A [] B Fms.
test 4 A B Fms :- A = (forall Y \ atom "P" [Y, X]), myskolem A [] B Fms.
test 5 A B Fms :- A = (forall Y \ exists X \ atom "P" [Y, X]), myskolem A [] B Fms.
test 6 A B Fms :- A = (exists X \ atom "P" [X, var "Y"]), myskolem A [] B Fms.
test 7 A B Fms :- A = ((forall Y \ (exists X \ (atom "P" [Y, X]))) imp (forall X \ truth)), myskolem A [] B Fms.
test 8 A B Fms :- A = (forall X \ truth), myskolem A [] B Fms.
test 9 A B Fms :- A = (exists X \ truth), myskolem A [] B Fms.
test 10 A B Fms :- A = ((exists Y \ (atom "F" [Y])) and truth), myskolem A [] B Fms.
test 11 A B Fms :- A = ((exists X \ (atom "P" (X :: nil)) and forall X\ truth) imp (exists W\ atom "P" [W])), myskolem A [] B Fms.
test 12 A B Fms :- A = ((exists X \ (atom "P" [fn "F" [X]])) iff (forall Y \ (atom "Q" [fn "G" [Y]]))), myskolem A [] B Fms.
test 13 A B Fms :- A = (((forall X \ (atom "P" [fn "F" [X]])) or (forall Z \ (atom "Q" [fn "H" [Z]])))  and (exists Y \ (atom "R" [fn "G" [Y]]))), myskolem A [] B Fms.

%Soluzioni sbagliate
test 014 A B Fms :- A = (exists Y \ (exists X \ (atom "P" ( X :: nil)))), myskolem A [] B Fms.
test 14 A B Fms :- A = (exists Y \ (exists X \ (atom "P" ( Y :: X :: nil)))), myskolem A [] B Fms.
test 15 A B Fms :- A = (exists Y \ (exists Z \ (exists X \ atom "P" [Y, Z, X]))), myskolem A [] B Fms.
test 17 A B Fms :- A = (forall (W1\ neg (atom "P" (W1 :: nil)) or exists (W2\ neg (atom "P" [W2]))) or exists (W1\ atom "P" (W1 :: nil))), myskolem A [] B Fms.
test 18 A B Fms :- A = ((exists X \ (neg (atom "P" [X])) and forall X\ (neg truth)) imp (exists W\ atom "P" [W])), myskolem A [] B Fms.
test 19 A B Fms :- A = (forall Y \ (exists Z \ (exists X \ neg (atom "P" [Y, Z, X])))), myskolem A [] B Fms.

%giusti
test 16 A B Fms :- A = (forall (W1\ neg (atom "P" (W1 :: nil)) or exists (W2\ neg truth)) or exists (W1\ atom "P" (W1 :: nil))), myskolem A [] B Fms.
test 20 A B Fms :- A = (forall X \ (exists Y \ neg (atom "P" [X, Y]))), myskolem A [] B Fms.

%------------------------------------test per askolemize--------------------------------%

askolemizetest 21 A B :- print "askolemize P = simplify P, nnf P, myskolem P", A = truth, askolemize A B.
askolemizetest 22 A B :- A = (exists x \ atom "F" [x]), askolemize A B.
askolemizetest 23 A B :- A = (exists x \ atom "F" [x, var "X"]), askolemize A B.
askolemizetest 24 A B :- A = (forall Y \ atom "P" [Y, X]), askolemize A B.
askolemizetest 25 A B :- A = (forall Y \ exists X \ atom "P" [Y, X]), askolemize A B.
askolemizetest 26 A B :- A = (exists X \ atom "P" [X, var "Y"]), askolemize A B.
askolemizetest 27 A B :- A = ((forall Y \ (exists X \ (atom "P" [Y, X]))) imp (forall X \ truth)), askolemize A B.
askolemizetest 28 A B :- A = (forall X \ truth), askolemize A B.
askolemizetest 29 A B :- A = (exists X \ truth), askolemize A B.
askolemizetest 30 A B :- A = ((exists Y \ (atom "F" [Y])) and truth), askolemize A B.
askolemizetest 31 A B :- A = ((exists X \ (atom "P" (X :: nil)) and forall X\ truth) imp (exists W\ atom "P" [W])), askolemize A B.
askolemizetest 32 A B :- A = ((exists X \ (atom "P" [fn "F" [X]])) iff (forall Y \ (atom "Q" [fn "G" [Y]]))), askolemize A B.
askolemizetest 33 A B :- A = (((forall X \ (atom "P" [fn "F" [X]])) or (forall Z \ (atom "Q" [fn "H" [Z]])))  and (exists Y \ (atom "R" [fn "G" [Y]]))), askolemize A B.

%come per myskolem: soluzioni errate
askolemizetest 034 A B :- A = (exists Y \ (exists X \ (atom "P" ( X :: nil)))), askolemize A B.
askolemizetest 34 A B :- A = (exists Y \ (exists X \ (atom "P" ( Y :: X :: nil)))), askolemize A B.
askolemizetest 35 A B :- A = (exists Y \ (exists Z \ (exists X \ atom "P" [Y, Z, X]))), askolemize A B.
askolemizetest 36 A B :- A = (forall (W1\ neg (atom "P" (W1 :: nil)) or exists (W2\ neg truth)) or exists (W1\ atom "P" (W1 :: nil))), askolemize A B.
askolemizetest 37 A B :- A = (forall (W1\ neg (atom "P" (W1 :: nil)) or exists (W2\ neg (atom "P" [W2]))) or exists (W1\ atom "P" (W1 :: nil))), askolemize A B.





%test per freesTm/s
test1 A :- freesTm (fn "F" [X, Y, Z]) A.
test2 A :- freesTms [X, Y, Z] A.
test3 A :- freesTms [J, B, C, C, D, Y, Z] A.
test4 A :- freesTm (var X) A.
test4b A :- freesTm A [X, Z].
%test per freesFm
test5 A :- freesFm (truth and false) A.
test6 A :- freesFm (atom "S" [X, Y]) A.
test7 A :- freesFm (exists X\ atom "S" [X]) A.
test8 A :- freesFm (exists X\ atom "S" [X, var "b"]) A.

end