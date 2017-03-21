/* ========================================================================= */
/* Generic code for testing interpretations.                                 */
/* ========================================================================= */

module tests.

check P ok :- P, !.
check P ko.

/*
Mod = modello (stringa "graph0", "arith3", ...)
Test = nome del test (stringa)
P = formula (di fol)
Exp = risultato atteso (ok o ko)
Ret = risultato ottenuto (ok o ko)
*/
runtest Mod Test P Exp Ret :-
  use_model Mod M,
  unit Mod Test Exp,
  test Test P,
  check (holds M undefined P) Ret.

runtest0 Mod Test P Ret :-
  use_model Mod M,
  test Test P,
  unit Mod Test Exp,
  check (holds M undefined P) Ret,
  not (Exp = Ret).

end
