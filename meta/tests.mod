/* ========================================================================= */
/* Generic code for testing interpretations.                                 */
/* ========================================================================= */

module tests.

check P ok :- P, !.
check P ko.

runtest Test P Exp Ret :-
  unit Test Exp,
  use_model "graph0" M,
  test Test P,
  check (holds M undefined P) Ret.

runtest0 Test P Ret :-
  use_model "graph0" M,
  test Test P,
  not (unit Test Exp),
  check (holds M undefined P) Ret.

end
