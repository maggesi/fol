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

local myskolem0 form -> list string -> form -> list string -> o.
myskolem0 truth Fms truth Fms.
myskolem0 false Fms false Fms.
myskolem0 (P and Q) Fns (P' and Q') Fns' :-
  myskolem P Fns P' Fns', myskolem Q Fns' Q' Fns''.
myskolem0 (P or Q) Fns (P' or Q') Fns' :-
  myskolem P Fns P' Fns', myskolem Q Fns' Q' Fns''.
myskolem0 (forall x \ P x) Fns (forall x \ P' x) Fns' :-
  pi x \ is_var x => myskolem (P x) Fns (P' x) Fns'.
myskolem0 (exists x \ P x) Fns Q Fns' :-
   variant "sko" Fns S,
   freesFm (exists x \ P x) Vs,
   myskolem (P (fn S Vs)) [S|Fns] Q Fns'.


myskolem X Fms Y Fms':- myskolem0 X Fms Y Fms', !.
myskolem X Fms X Fms.

askolemize P Q:- simplify P P1, nnf P1 P2, myskolem P2 [] Q Fms.

local specialize form -> form -> o.
specialize (forall X \ P X) (P X).

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