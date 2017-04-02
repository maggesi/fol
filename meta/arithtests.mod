/* ========================================================================= */
/* Examples and tests in the language of arithmetics.                        */
/* ========================================================================= */

module arithtests.

test "all_truth" (forall X \ truth).
test "all_false" (forall X \ false).
test "ex_truth" (exists X \ truth).
test "ex_false" (exists X \ false).

% Tutti gli elmenti sono idempotenti.
test "all_idemp" (forall X \ atom "=" [fn "+" [X, X], X]).

% Esiste un elemento idempotente.
test "ex_idemp" (exists X \ atom "=" [fn "+" [X, X], X]).

% Proprietà commutativa.
test "add_comm"
     (forall X \ forall Y \ atom "=" [fn "+" [X, Y], fn "+" [Y, X]]).

% Esiste un elemento neutro.
test "ex_neutral"
     (exists E \ forall X \
        and (atom "=" [fn "+" [X, E], X]) (atom "=" [fn "+" [E, X], X])).

% Esiste un elemento assorbente.
test "ex_absorb"
     (exists Z \ forall X \ atom "=" [fn "*" [X, Z], Z]).

% Tutti gli elmenti hanno ordine 3.
test "all_ord_3"
     (forall X \ atom "=" [fn "+" [X, fn "+" [X, X]], fn "zero" []]).

test "ex_inv"
     (forall X \
        imp (neg (atom "=" [X, fn "zero" []])) 
            (exists Y \ atom "=" [fn "*" [X, Y], fn "one" []])).


test "all_inv"
      (forall X \
      	      exists Y \ atom "=" [fn "*" [X, Y], fn "one" []]).


end