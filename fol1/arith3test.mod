/* ========================================================================= */
/* Theory of addition in Z3: tests and examples.                             */
/* ========================================================================= */

module arith3test.

accumulate arith3interp.

test 0 :- topholds (forall X \ truth).
test 1 :- topholds (forall X \ false).
test 2 :- topholds (exists X \ truth).
test 3 :- topholds (exists X \ false).

% Tutti gli elmenti sono idempotenti.
test 4 :- topholds (forall X \ eq (add X X) X).

% Esiste un elemento idempotente.
test 5 :- topholds (exists X \ (eq (add X X) X)).

% Proprietà commutativa.
test 6 :- topholds (forall X \ forall Y \ eq (add X Y) (add Y X)).

% Esiste un elemento neutro.
test 7 :- topholds (exists E \ forall X \
                  and (eq (add X E) X) (eq (add E X) X)).

% Esiste un elemento assorbente.
test 8 :- topholds (exists Z \ forall X \ eq (add X Z) Z).

% Tutti gli elmenti hanno ordine 3.
test 9 :- topholds (forall X \ eq (add X (add X X)) zero).

test 10 :- topholds (eq (add one zero) one).

end
