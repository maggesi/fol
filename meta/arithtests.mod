/* ========================================================================= */
/* Examples and tests in the language of arithmetics.                        */
/* ========================================================================= */

module arithtests.


test "all_truth" (forall X \ truth).
test "all_false" (forall X \ false).
test "ex_truth" (exists X \ truth).
test "ex_false" (exists X \ false).

/*
unit "ex_idemp" ok.
unit "comm" ok.
unit "ex_id" ok.
unit "ex_absorb" ko.
unit "all_ord3" ok.
*/

/*
% Tutti gli elmenti sono idempotenti.
test "all_idemp" (forall X \ atom "=" [fn "+" [X, X], X]).

% Esiste un elemento idempotente.
test5 :-
  arith3_holds undefined
    (exists X \ atom "+" [fn "+" [X, X], X]).

% Proprietà commutativa.
test6 :-
  arith3_holds undefined
    (forall X \ forall Y \ atom "=" [fn "+" [X, Y], fn "+" [Y, X]]).

% Esiste un elemento neutro.
test7 :-
  arith3_holds undefined
    (exists E \ forall X \
       and (atom "=" [fn "+" [X, E], X]) (atom "+" [fn "+" [E, X], X])).

% Esiste un elemento assorbente.
test8 :- arith3_holds undefined
  (exists Z \ forall X \ atom "+" [fn "+" [X, Z], Z]).

% Tutti gli elmenti hanno ordine 3.
test9 :- arith3_holds undefined
  (forall X \ atom "+" [fn "+" [X, fn "+" [X, X]], fn "zero" []]).
*/

end