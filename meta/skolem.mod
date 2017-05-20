module skolem.

accumulate prenex.

/* Harrison:
--------------------------------------------------------------------------------------------------------------------------
let rec funcs tm =                                                     --------> serve per evitare la cattura di variabili  
match tm with
Var x -> []
| Fn(f,args) -> itlist (union ** funcs) args [f,length args];;

let functions fm =
atom_union (fun (R(p,a)) -> itlist (union ** funcs) a []) fm;;
--------------------------------------------------------------------------------------------------------------------------

let rec skolem fm fns =
match fm with
Exists(y,p) -> ---------------------------------------------------------------------------------------- xs sono le variabili libere
                                                                                                       Quando trova il quant esistenziale allora 
let xs = fv(fm) in                                                                                     se xs è [] allora mette la constante c altrimenti 
let f = variant (if xs = [] then "c_"^y else "f_"^y) fns in                                            prende un funtore f con variabili dipendendenti da xs
let fx = Fn(f,map (fun x -> Var x) xs) in
skolem (subst (y |=> fx) p) (f::fns)                                                                   A questo punto sostituisce l'esistenziale con il funtore
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

Askolemize fa simplify poi nnf e skolem
*/

skolem0 (exists X \ (P X)) (P (const C)).
skolem0 (forall y \ (exists X \ (P y X))) (forall y \ (P y (fn "F" (y :: (const C) :: nil)))).
/*-------IDEA: avere un predicato countQ che conta i forall, un altro che crea una lista di variabili e aggiungere a questa la constante C.-------*/
skolem0 (P X) (Q X (fn "F" L)) :- %pi X \ skolem0 (P X) (Q X),
	countQ (P X) Z,
	create_list Z L1,
	append L1 (const C :: nil) L.

%chiusura riflessiva
skolem P Q:- reflc skolem0 P Q.


skolem1 (P and Q) Z :- skolem1 P P1, skolem1 Q Q1, skolem (P1 and Q1) Z.                                    %per farlo con tutti gli esistenziali che incontra e non fermarsi al primo
skolem1 (P or Q) Z :- skolem1 P P1, skolem1 Q Q1, skolem (P1 or Q1) Z.
skolem1 (Quant X \ P X) (Z X) :- quant Quant, pi X \ skolem (Quant X \ P X) (Z X).
%skolem1 (Quant X \ P X) (Quant X \ Z X) :- quant Quant, pi X \ skolem (Quant X \ P X) (Quant X \ Z X).

% predicato che conta i forall - probabilmente inutile
countQ0 Atoms 0 :- (Atoms = truth ; Atoms = false ; Atoms = atom S Xs).
countQ0 (exists X \ Atoms) 0:- (Atoms = truth ; Atoms = false ; Atoms = atom S Xs).
%countQ0 (forall X \ Atoms) 1:- (Atoms = truth ; Atoms = false ; Atoms = atom S Xs).
countQ0 (forall X \ P X) 1.

countQ (forall X \ P X) Q:- pi X \ countQ0 (forall X \ (P X)) Q1,
		       Q = Q1 + 1, !.
countQ P Q:- countQ0 P Q.		    

/* ----------------------------------------------------------------------------------------
countQ (neg P) X:- countQ P X.
countQ (P and Q) X:- countQ P X1, countQ Q X2, X = X1 + X2.
countQ (P or Q) X:- countQ P X1, countQ Q X2, X = X1 + X2.
countQ (P imp Q) X:- countQ P X1, countQ Q X2, X = X1 + X2.
countQ (P iff Q) X:- countQ P X1, countQ Q X2, X = X1 + X2.
----------------------------------------------------------------------------------------*/


%dato un numero crea una lista di variabili
create_list 0 [].
create_list 1 [X].
create_list N [X|L]:- N > 1, N1 is N - 1, create_list N1 L. 





skolemtest1 A :- skolem (exists X \ (atom "P" (X :: nil))) A.
skolemtest2 A :- skolem (forall Y \ (exists X \ (atom "P" ( Y :: X :: nil)))) A.
skolem1test1 A :- skolem1 ((exists X \ (atom "P" [fn "F" [X]])) and (exists Y \ (atom "Q" [fn "G" [Y]]))) A.
skolem1test2 A :- skolem1 ((forall X \ (atom "P" [fn "F" [X]])) and (exists Y \ (atom "Q" [fn "G" [Y]]))) A.
skolem1test3 A :- skolem1 ((exists X \ (atom "P" [fn "F" [X]])) and (forall Y \ (atom "Q" [fn "G" [Y]]))) A.
skolem1test4 A :- skolem1 (((forall X \ (atom "P" [fn "F" [X]])) or (forall Z \ (atom "Q" [fn "H" [Z]])))  and (exists Y \ (atom "R" [fn "G" [Y]]))) A.
skolem1test5 A :- skolem1 ((exists Y \ (atom "F" [Y])) and truth) A.
skolem1test6 A :- skolem1 (exists X \ (atom "P" (X :: nil))) A.
skolem1test7 A :- skolem1 (forall Y \ (exists X \ (atom "P" ( Y :: X :: nil)))) A.
skolem1test8 A :- skolem1 truth A.
skolem1test9 A :- skolem1 (forall X \ (atom "P" ( X :: nil))) A.
skolem1test10 A :- skolem1 (forall X \ truth) A.
skolem1test11 A :- skolem1 (exists X \ truth) A.
skolem1test12 A :- skolem1 (forall Z \ (forall Y \ (exists X \ (atom "P" ( Z :: Y :: X :: nil))))) A.