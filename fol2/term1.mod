% Termini per la logica dei predicati.

module term1.
accumulate lib.

/*predicato che dice sempre il termine più a sinistra
In Ocaml:
# let eq = <<f(f(x)) = g(x)>> in critical_pairs eq eq;;

let lhs eq = fst(dest_eq eq) and rhs eq = snd(dest_eq eq);;

*/
lhs (eq Tm1 Tm2) Tm1.
/*


 In Ocaml:
let rec occurs_in s t =
s = t or
match t with
Var y -> false
| Fn(f,args) -> exists (occurs_in s) args;;
*/

toccurs S (var S).
toccurs S (fn S Xs) :- ex (toccurs S) Xs.

fvt (var S) [S].
fvt (fn F Args) Vars :- map fvt Args V1, unions V1 Vars.


tsubst F (var S) Tm :- F S Tm.
tsubst S (fn F Args) (fn F Args') :- map (tsubst S) Args Args'.
tsubst F (eq L R) (eq Tml Tmr) :- tsubst F L Tml, tsubst F R Tmr.

end
