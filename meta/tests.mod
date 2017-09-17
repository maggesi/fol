/* ========================================================================= */
/* Generic code for testing interpretations.                                 */
/* ========================================================================= */

module tests.

check P ok :- P.
check P ko :- not P.

%% ----------------------------------------------------------------------------
%% Mod = modello (stringa "graph0", "arith3", ...)
%% Test = nome del test (stringa)
%% P = formula (di fol)
%% Exp = risultato atteso (ok o ko)
%% Ret = risultato ottenuto (ok o ko)
%% ----------------------------------------------------------------------------

runtest Mod Test P Exp Ret :-
  use_model Mod M, unit Mod Test Exp, test Test P,
  check (holds M undefined P) Ret.

failtest Mod Test P Ret :-
  runtest Mod Test P Exp Ret, not (Exp = Ret).

end
