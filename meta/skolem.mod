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
Exists(y,p) -> ----------------------------------------------------------------------------------------
                                                                                                      
let xs = fv(fm) in                                                                                    
let f = variant (if xs = [] then "c_"^y else "f_"^y) fns in                                           
let fx = Fn(f,map (fun x -> Var x) xs) in
skolem (subst (y |=> fx) p) (f::fns)                                                                   A questo punto sostituisce l'esistenziale con Const c o il funtore
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
freesTm (var X) [X].
freesTm (fn S Args) L :- freesTms Args L.
freesTms [] [].
freesTms (T :: Ts) L :- freesTm T LT, freesTms Ts LTs, union LT LTs L.

freesFm truth [].
freesFm false [].
freesFm (atom S Args) L :- freesTms Args L.
freesFm (P and Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (P or Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (P imp Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (P iff Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (Quant V \ P V) L :- quant Quant, pi x\ freesFm (P x) L.

skolem Atoms Atoms:- (Atoms = truth; Atoms = false; Atoms = atom X Xs).
skolem (P and Q) (P' and Q') :- skolem P P', skolem Q Q'.
skolem (P or Q)  (P' or Q') :- skolem P P', skolem Q Q'.
skolem (P imp Q)  (P' or Q') :- skolem P P', skolem Q Q'.
skolem (P iff Q)  (P' or Q') :- skolem P P', skolem Q Q'.
skolem (forall X\ P X) (forall X\ P' X):- pi X\ skolem (P X) (P' X).
skolem (exists X\ P X) Q:-
  pi S\
    freesFm (exists X\ P X) L,
    map mkVar L Vs,
    skolem (P (fn S Vs)) Q.

mkVar S (var S).






skolemtest1 A :- skolem (exists X \ (atom "P" (X :: nil))) A.
skolemtest2 A :- skolem (forall Y \ (exists X \ (atom "P" ( Y :: X :: nil)))) A.
skolemtest3 A :- skolem ((exists X \ (atom "P" [fn "F" [X]])) and (forall Y \ (atom "Q" [fn "G" [Y]]))) A.
skolemtest4 A :- skolem (((forall X \ (atom "P" [fn "F" [X]])) or (forall Z \ (atom "Q" [fn "H" [Z]])))  and (exists Y \ (atom "R" [fn "G" [Y]]))) A.
skolemtest5 A :- skolem ((exists Y \ (atom "F" [Y])) and truth) A.
skolemtest6 A :- skolem (exists X \ (atom "P" (X :: nil))) A.
skolemtest7 A :- skolem (forall Y \ (exists X \ (atom "P" ( Y :: X :: nil)))) A.
skolemtest8 A :- skolem truth A.
skolemtest9 A :- skolem (forall X \ (atom "P" ( X :: nil))) A.
skolemtest10 A :- skolem (forall X \ truth) A.
skolemtest11 A :- skolem (exists X \ truth) A.
skolemtest12 A :- skolem (forall Z \ (forall Y \ (exists X \ (atom "P" ( Z :: Y :: X :: nil))))) A.
skolemtest13 A :- skolem ((exists X \ (atom "P" [fn "F" [X]])) and (exists Y \ (atom "Q" [fn "G" [Y]]))) A.
skolemtest14 A :- skolem ((forall X \ (atom "P" [fn "F" [X]])) and (exists Y \ (atom "Q" [fn "G" [Y]]))) A.

end