/* ========================================================================= */
/* Simple tests for the language: add zero one.                              */
/* ========================================================================= */

module tests.

accum_sig interp.

holds0 P :- holds (termval emptyenv) P.

test 0 :- holds0 (forall X \ truth).
test 1 :- holds0 (forall X \ false).
test 2 :- holds0 (exists X \ truth).
test 3 :- holds0 (exists X \ false).

% Tutti gli elmenti sono idempotenti.
test 4 :- holds0 (forall X \ eq (add X X) X).

% Esiste un elemento idempotente.
test 5 :- holds0 (exists X \ eq (add X X) X).

% Proprietà commutativa.
test 6 :- holds0 (forall X \ forall Y \ (eq (add X Y) (add Y X))).

% Esiste un elemento neutro.
test 7 :- holds0 (exists E \ forall X \
                  and (eq (add X E) X) (eq (add E X) X)).

% Esiste un elemento assorbente.
test 8 :- holds0 (exists Z \ forall X \ eq (add X Z) Z).

% Tutti gli elmenti hanno ordine 2.
test 9 :- holds0 (forall X \ eq (add X X) zero).

% Tutti gli elmenti hanno ordine 3.
test 10 :- holds0 (forall X \ eq (add X (add X X)) zero).

% Tutti gli elmenti hanno ordine 4.
test 11 :- holds0 (forall X \ eq (add X (add X (add X X))) zero).

end