module skolem.

accumulate lib, simplify, psimplify, fol, pullquants, nnf, prenex.

local is_var term -> o.
is_var (var _).

local variant string -> list string -> string -> o.
variant S L S' :- variant_aux L S L S'.

local variant_aux list string -> string -> list string -> string -> o.
variant_aux Avoid S [] S.
variant_aux Avoid S [S|L] S'' :- !, S' is S ^ "'", variant_aux Avoid S' Avoid S''.
variant_aux Avoid S [_|L] S' :- variant_aux Avoid S L S'.

local skolem0 form -> list string -> form -> list string -> o.
skolem0 truth Fms truth Fms.
skolem0 false Fms false Fms.
skolem0 (P and Q) Fns (P' and Q') Fns' :-
  skolem P Fns P' Fns', skolem Q Fns' Q' Fns''.
skolem0 (P or Q) Fns (P' or Q') Fns' :-
  skolem P Fns P' Fns', skolem Q Fns' Q' Fns''.
skolem0 (forall x \ P x) Fns (forall x \ P' x) Fns' :-
  pi x \ is_var x => skolem (P x) Fns (P' x) Fns'.
skolem0 (exists x \ P x) Fns Q Fns' :-
   variant "sko" Fns S,
   freesFm (exists x \ P x) Vs,
   skolem (P (fn S Vs)) [S|Fns] Q Fns'.


skolem X Fms Y Fms':- skolem0 X Fms Y Fms', !.
skolem X Fms X Fms.

askolemize P Q:- simplify P P1, nnf P1 P2, skolem P2 [] Q Fms.

local specialize0 form -> form -> o.
specialize0 (forall X \ (P X)) (P X).
specialize0 (Quant X \ P X) B :- quant Quant, pi x \ specialize0 (Quant X \ P X) B.

local specialize1 form -> form -> o.
specialize1 A B :- reflc specialize0 A B.

local specialize2 form -> form -> o.
specialize2 (A and B) Y :- specialize A A1, specialize B B1, specialize1 (A1 and B1) Y.
specialize2 (A or B) Y :- specialize A A1, specialize B B1, specialize1 (A1 or B1) Y.
specialize2 (forall X \ P X) B :- pi x \ specialize (P X) B.


specialize A B :- reflc specialize2 A B.




test 1 A B :- A = (forall (W1\ neg (atom "P" (_T1 :: nil)) and neg (atom "P" (fn "sko" nil :: nil)) or atom "P" (_T1 :: nil) and atom "P" (W1 :: nil))), specialize A B.
test 2 A B :- A = (forall (W1\ neg (atom "P" (W1 :: nil))) or forall (W1\ atom "P" (W1 :: nil))), specialize A B.
test 3 A B :- A = (forall X \ atom "P" [X]), specialize A B.
test 4 A B :- A = (forall X \ atom "P" [X] and exists X \  truth), specialize A B.


skolemize P Q :- askolemize P P1, pnf P1 P2, specialize P2 Q.

freesTm X [X] :- is_var X, !.
freesTm (fn S Args) L :- freesTms Args L.
freesTms [] [].
freesTms [T|Ts] L :- freesTm T LT, freesTms Ts LTs, union LT LTs L.


freesFm truth [].
freesFm false [].
freesFm (atom S Args) L :- freesTms Args L.
freesFm (neg P) L :- freesFm P L.
freesFm (P and Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (P or Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (P imp Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (P iff Q) L :- freesFm P LP, freesFm Q LQ, union LP LQ L.
freesFm (Quant X \ P X) L :- quant Quant, freesFm (P (fn "dummy" [])) L.

%----------------test per freesTm/s and freesFm----------------%


test1 A :- freesTms [X, Y, Z] A.
test2 A :- freesTms [J, B, C, C, D, Y, Z] A.

test3 A :- freesTm (fn "F" [X, Y, Z]) A.
test4 A :- freesTm (var X) A.

test5 A :- freesFm (truth and false) A.
test6 A :- freesFm (atom "S" [X, Y]) A.
test7 A :- freesFm (exists X\ atom "S" [X]) A.
test8 A :- freesFm (exists X\ atom "S" [X, var "b"]) A.

end