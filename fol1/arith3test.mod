/* ========================================================================= */
/* Theory of addition in Z3: tests and examples.                             */
/* ========================================================================= */

module arith3test.

accumulate arith3interp.

test0 :- holds (forall X \ truth).
test1 :- holds (forall X \ false).
test2 :- holds (exists X \ truth).
test3 :- holds (exists X \ false).

% Tutti gli elmenti sono idempotenti.
test4 :- holds (forall X \ (eq (add X X) X)).

% Esiste un elemento idempotente.
test5 :- holds (exists X \ (eq (add X X) X)).

% Proprietà commutativa.
test6 :- holds (forall X \ (forall Y \ (eq (add X Y) (add Y X)))).

% Esiste un elemento neutro.
test7 :- holds (exists E \ (forall X \
                  (and (eq (add X E) X) (eq (add E X) X)))).

% Esiste un elemento assorbente.
test8 :- holds (exists Z \ (forall X \ (eq (add X Z) Z))).

% Tutti gli elmenti hanno ordine 3.
test9 :- holds (forall X \ (eq (add X (add X X)) zero)).

end
