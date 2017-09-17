module fol.

/* ------------------------------------------------------------------------- */
/* Model: addition on integers modulo 3.                                     */
/*   domain : int -> o							     */
/*   add3   : int -> int -> int -> o					     */
/* ------------------------------------------------------------------------- */

domain 0.
domain 1.
domain 2.

add3 0 N N :- domain N.
add3 N 0 N :- domain N.
add3 1 1 2.
add3 1 2 0.
add3 2 1 0.
add3 2 2 1.

/* ------------------------------------------------------------------------- */
/* Terms.                                                                    */
/*   zero, one, two : term						     */
/*   add     : term -> term -> term			                     */
/*   termval : term -> int -> o                                              */
/* ------------------------------------------------------------------------- */

termval zero 0.
termval one 1.
termval two 2.
termval (add X Y) P :- termval X M, termval Y N, add3 M N P.

/* ------------------------------------------------------------------------- */
/* Formulas.                                                                 */
/*   truth, false form							     */
/*   eq : term -> term -> form						     */
/*   and : form -> form -> form						     */
/*   forall, exists : (term -> form) -> form				     */
/*   holds : form -> o.							     */
/* ------------------------------------------------------------------------- */

holds truth.
holds (eq X Y) :- termval X M, termval Y N, M = N.
holds (and P Q) :- holds P, holds Q.
holds (exists x \ P x) :- pi x \ ((termval x 0 => holds (P x));
                                  (termval x 1 => holds (P x));
                                  (termval x 2 => holds (P x))).
holds (forall x \ P x) :- pi x \ ((termval x 0 => holds (P x)),
                                  (termval x 1 => holds (P x)),
                                  (termval x 2 => holds (P x))).

/* ------------------------------------------------------------------------- */
/* Tests ed esempi.                                                          */
/* ------------------------------------------------------------------------- */

test 0 :- holds (forall X \ truth).
test 1 :- holds (forall X \ false).
test 2 :- holds (exists X \ truth).
test 3 :- holds (exists X \ false).

% Tutti gli elmenti sono idempotenti.
test 4 :- holds (forall X \ eq (add X X) X).

% Esiste un elemento idempotente.
test 5 :- holds (exists X \ eq (add X X) X).

% Proprietà commutativa.
test 6 :- holds (forall X \ forall Y \ eq (add X Y) (add Y X)).

% Esiste un elemento neutro.
test 7 :- holds (exists E \ forall X \
                  and (eq (add X E) X) (eq (add E X) X)).

% Esiste un elemento assorbente.
test 8 :- holds (exists Z \ forall X \ eq (add X Z) Z).

% Tutti gli elmenti hanno ordine 3.
test 9 :- holds (forall X \ eq (add X (add X X)) zero).

end
