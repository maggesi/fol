module skolem.

accumulate prenex.

test 1 A B Fms :- A = truth, myskolem A [] B Fms.
test 2 A B Fms :- A = (exists x \ atom "F" [x]), myskolem A [] B Fms.
test 3 A B Fms :- A = (exists x \ atom "F" [x, var "X"]), myskolem A [] B Fms.
test 4 A B Fms :- A = (forall Y \ atom "P" [Y, X]), myskolem A [] B Fms.
test 5 A B Fms :- A = (forall Y \ exists X \ atom "P" [Y, X]), myskolem A [] B Fms.
test 6 A B Fms :- A = (exists X \ atom "P" [X, var "Y"]), myskolem A [] B Fms.

test 7 A B Fms :- A = ((forall Y \ (exists X \ (atom "P" (Y :: X :: nil)))) imp (forall X \ truth)),
                      myskolem A [] B Fms.

/*
test 2 A B Fms :- A = (forall X \ (atom "P" (X :: nil))), myskolem A [] B Fms.
test 3 A B Fms :- A = (forall X \ truth), myskolem A [] B Fms.

test 4 A B Fms :- myskolem (exists X \ truth) A.
test 5 A B Fms :- myskolem ((exists Y \ (atom "F" [Y])) and truth) A.
test 6 A B Fms :- myskolem (exists X \ (atom "P" (X :: nil))) A.

%test 7 : no solution
test 8 A :- myskolem ((exists X \ (atom "P" (X :: nil)) and forall X\ truth) imp (exists W\ atom "P" [W])) A.
%3 soluzioni corrispondenti in test8
test 9 A :- myskolem (forall Y \ (exists X \ (atom "P" ( Y :: X :: nil)))) A.
%test 9 : no solution
test 10 A :- myskolem ((exists X \ (atom "P" [fn "F" [X]])) and (forall Y \ (atom "Q" [fn "G" [Y]]))) A.
test 11 A :- myskolem (((forall X \ (atom "P" [fn "F" [X]])) or (forall Z \ (atom "Q" [fn "H" [Z]])))  and (exists Y \ (atom "R" [fn "G" [Y]]))) A.
test 12 A :- myskolem (forall Z \ (forall Y \ (exists X \ (atom "P" ( Z :: Y :: X :: nil))))) A.
%test 12 : no solution
test 13 A :- myskolem ((exists X \ (atom "P" [fn "F" [X]])) and (exists Y \ (atom "Q" [fn "G" [Y]]))) A.
test 14 A :- myskolem ((forall X \ (atom "P" [fn "F" [X]])) and (exists Y \ (atom "Q" [fn "G" [Y]]))) A.
test 15 A :- myskolem (exists Y \ (exists X \ (atom "P" ( Y :: X :: nil)))) A.
test 16 A :- myskolem (exists Y \ (exists Z \ (exists X \ atom "P" [Y, Z, X]))) A.
*/
%A = atom "P" (fn "S" (var _T1 :: var _T2 :: var _T3 :: nil) ::
%              fn "S" (var _T1 :: var _T2 :: var _T3 :: var _T4 :: var _T5 :: nil) ::
%              fn "S" (var _T1 :: var _T2 :: var _T3 :: var _T1 :: var _T2 :: var _T3 :: var _T4 :: var _T5 :: var _T6 :: nil) :: nil)





is_var (var _).

local variant_aux list string -> string -> list string -> string -> o.
variant S L S' :- variant_aux L S L S'.
variant_aux Avoid S [] S.
variant_aux Avoid S [S|L] S'' :- !, S' is S ^ "'", variant_aux Avoid S' Avoid S''.
variant_aux Avoid S [_|L] S' :- variant_aux Avoid S L S'.

/*
is_atom truth.
is_atom false.
is_atom (atom X Xs).

is_conn (P and Q) (x \ y \ x and y) P Q.
is_conn (P or  Q) (x \ y \ x or  y) P Q.
is_conn (P imp Q) (x \ y \ x imp y) P Q.
is_conn (P iff Q) (x \ y \ x iff y) P Q.

is_binop (x \ y \ x and y).
is_binop (x \ y \ x or  y).
is_binop (x \ y \ x imp y).
is_binop (x \ y \ x iff y).
*/

%%% myskolem P Fns P Fns :- is_atom P.
%%% myskolem (Op P Q) Fns R Fns' :- is_conn Op Fns.
/*
myskolem P Fns P' Fns' :-
  is_conn P Op A B,
  myskolem A Fns A' Fns',
  myskolem B Fns' B' Fns'',
  is_conn P' Op A' B'.
*/

myskolem truth Fms truth Fms.
myskolem false Fms false Fms.
myskolem (atom S Args) Fms (atom S Args) Fms.
myskolem (P and Q) Fns (P' and Q') Fns' :-
  myskolem P Fns P' Fns', myskolem Q Fns' Q' Fns''.
myskolem (P or Q) Fns (P' or Q') Fns' :-
  myskolem P Fns P' Fns', myskolem Q Fns' Q' Fns''.
myskolem (P imp Q) Fns (P' imp Q') Fns' :-
  myskolem P Fns P' Fns', myskolem Q Fns' Q' Fns''.
myskolem (P iff Q) Fns (P' iff Q') Fns' :-
  myskolem P Fns P' Fns', myskolem Q Fns' Q' Fns''.

/*
skolem2 Op P Q Fns (Op P' Q') Fns'':-
  myskolem P Fns P' Fns', myskolem Q Fns' Q' Fns''.
*/
myskolem (forall x \ P x) Fns (forall x \ P' x) Fns' :-
  pi x \ is_var x => myskolem (P x) Fns (P' x) Fns'.
myskolem (exists x \ P x) Fns (Q (fn S Vs)) Fns' :-
  variant "sko" Fns S,
  freesFm (exists x \ P x) Vs,
  %%% map mkVar L Vs,
  %%% myskolem (P (fn S Vs)) [S|Fns] Q Fns'.
  pi x \ myskolem (P x) [S|Fns] (Q x) Fns'.

/* Harrison:
--------------------------------------------------------------------------------------------------------------------------
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

/*
freeInTm X (var X).
freeInTm X (fn S Args) :- freeInTms X Args.
sfreeInTms X Tms :- ex (freeInTm X) Tms.

freeInFm X (P and Q) :- freeInFm X P; freeInFm X Q.
freeInFm X (P or Q) :- freeInFm X P; freeInFm X Q.
freeInFm X (atom S Args) :- freeInTms X Args.
freeInFm X (Quant V \ P V) :- quant Quant, pi x\ freeInFm X (P x).
*/

% freesFm P L
%%% freesTm V [V] :- is_var V.
%%% ?- freesTm A R.

freesTm X [X] :- is_var X, !.
freesTm (fn S Args) L :- freesTms Args L.
freesTms [] [].
freesTms [T|Ts] L :- freesTm T LT, freesTms Ts LTs, union LT LTs L.
%freesTms [T|Ts] L :- freesTm T LT, freesTms Ts LTs, append LT LTs L, !.


test1 A :- freesTm (fn "F" [X, Y, Z]) A.
test2 A :- freesTms [X, Y, Z] A.
test3 A :- freesTms [J, B, C, C, D, Y, Z] A.
test4 A :- freesTm (var X) A.
test4b A :- freesTm A [X, Z].


freesFm truth [].
freesFm false [].
freesFm (atom S Args) L :- freesTms Args L.
freesFm (P and Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (P or Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (P imp Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (P iff Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (Quant X \ P X) L :- quant Quant, freesFm (P (fn "dummy" [])) L.

test5 A :- freesFm (truth and false) A.
test6 A :- freesFm (atom "S" [X, Y]) A.
test7 A :- freesFm (exists X\ atom "S" [X]) A.
test8 A :- freesFm (exists X\ atom "S" [X, var "b"]) A.

%% mkVar S (var S).

skolem Atoms Atoms:- (Atoms = truth; Atoms = false; Atoms = atom X Xs).
skolem (P and Q) (P' and Q') :- skolem P P', skolem Q Q'.
skolem (P or Q)  (P' or Q') :- skolem P P', skolem Q Q'.
skolem (P imp Q)  (P' imp Q') :- skolem P P', skolem Q Q'.
skolem (P iff Q)  (P' iff Q') :- skolem P P', skolem Q Q'.
%skolem (forall X\ P X) (forall X\ P' X):- pi X\ skolem (P X) (P' X).
skolem (forall X \ Atoms) (forall X \ Atoms):- (Atoms = truth; Atoms = false; Atoms = atom X Xs), !.
%skolem (forall X\ P X) (forall X\ P' X):- print "hello", skolem (P X) (P' X).
%skolem (forall X\ P X) (forall X\ P' X):- print "hello", pi X\ skolem (P X) (P' X).
skolem (forall X\ P X) (forall X\ P' X):- print "hello", pi X\ skolem (P X) (P' X).

skolem (exists X\ P X) Q:-
    freesFm (exists X\ P X) Vs,
    %%% map mkVar L Vs,
    skolem (P (fn S Vs)) Q.

askolemize P Q:- simplify P P1, nnf P1 P2, skolem P2 Q.


skolemtest1 A :- skolem truth A.
skolemtest2 A :- skolem (forall X \ (atom "P" ( X :: nil))) A.
skolemtest3 A :- skolem (forall X \ truth) A.
skolemtest4 A :- skolem (exists X \ truth) A.
skolemtest5 A :- skolem ((exists Y \ (atom "F" [Y])) and truth) A.
skolemtest6 A :- skolem (exists X \ (atom "P" (X :: nil))) A.
skolemtest7 A :- skolem ((forall Y \ (exists X \ (atom "P" ( Y :: X :: nil)))) imp (forall X\ truth)) A.
%skolemtest7 : no solution
skolemtest8 A :- skolem ((exists X \ (atom "P" (X :: nil)) and forall X\ truth) imp (exists W\ atom "P" [W])) A.
%3 soluzioni corrispondenti in skolemtest8
skolemtest9 A :- skolem (forall Y \ (exists X \ (atom "P" ( Y :: X :: nil)))) A.
%skolemtest9 : no solution
skolemtest10 A :- skolem ((exists X \ (atom "P" [fn "F" [X]])) and (forall Y \ (atom "Q" [fn "G" [Y]]))) A.
skolemtest11 A :- skolem (((forall X \ (atom "P" [fn "F" [X]])) or (forall Z \ (atom "Q" [fn "H" [Z]])))  and (exists Y \ (atom "R" [fn "G" [Y]]))) A.
skolemtest12 A :- skolem (forall Z \ (forall Y \ (exists X \ (atom "P" ( Z :: Y :: X :: nil))))) A.
%skolemtest12 : no solution
skolemtest13 A :- skolem ((exists X \ (atom "P" [fn "F" [X]])) and (exists Y \ (atom "Q" [fn "G" [Y]]))) A.
skolemtest14 A :- skolem ((forall X \ (atom "P" [fn "F" [X]])) and (exists Y \ (atom "Q" [fn "G" [Y]]))) A.
skolemtest15 A :- skolem (exists Y \ (exists X \ (atom "P" ( Y :: X :: nil)))) A.
skolemtest16 A :- skolem (exists Y \ (exists Z \ (exists X \ atom "P" [Y, Z, X]))) A.
%A = atom "P" (fn "S" (var _T1 :: var _T2 :: var _T3 :: nil) ::
%              fn "S" (var _T1 :: var _T2 :: var _T3 :: var _T4 :: var _T5 :: nil) ::
%              fn "S" (var _T1 :: var _T2 :: var _T3 :: var _T1 :: var _T2 :: var _T3 :: var _T4 :: var _T5 :: var _T6 :: nil) :: nil)


%test per askolemize
skolemtest17 A :- askolemize ((exists X \ (atom "P" (X :: nil)) and forall X\ truth) imp (exists W\ atom "P" [W])) A.
skolemtest18 A :- askolemize (exists Y \ (exists Z \ (exists X \ atom "P" [Y, Z, X]))) A.
skolemtest19 A :- askolemize truth A.
skolemtest20 A :- askolemize (forall X \ atom "P" [X]) A.
skolemtest21 A :- askolemize (exists X \ atom "P" [X]) A.


%skolemtest17 non ha soluzioni, quella di sotto è la formula dopo aver fatto nnf e simplify.
skolemtest22 A :- skolem (forall (W1\ neg (atom "P" (W1 :: nil)) or exists (W2\ neg truth)) or exists (W1\ atom "P" (W1 :: nil))) A.

end