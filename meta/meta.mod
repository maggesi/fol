module meta.

/* ========================================================================= */
/* Miscellanea.                                                              */
/* ========================================================================= */

union [] L L.
union [Head|Tail] L1 L:- insert Head L1 L2, union Tail L2 L.

insert X Xs Xs:- member X Xs, !.
insert X Xs [X|Xs].

member Name [Name|Tail].
member Name [Head|Tail]:- member Name Tail.

/* ------------------------------------------------------------------------- */
/* Varie chiusure riflessive e transitive.                                   */
/* ------------------------------------------------------------------------- */

%% Con taglio.

reflc R X Y:- R X Y, !.
reflc R X X.

% Con traccia.

reflct S R X Y:- R X Y, !.
reflct S R X X :- print S, print " - reflc: ",
                  term_to_string X T, print T,
 		  print "\n", flush std_out.

/* ========================================================================= */
/* Semantics for first order logic.                                          */
/* ========================================================================= */

/* ------------------------------------------------------------------------- */
/* Domain.                                                                   */
/* ------------------------------------------------------------------------- */

domain (model D _ _) A :- D A.
domex M P :- sigma A \ (domain M A, P A, !).
domall M P :- not (domex M (A \ not(P A))).

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

extend X A _ X A.
extend _ _ V X A :- V X A.

functor (model _ F _) S As A :- F S As A.

/*
termval _ V X A :- V X A.
termval M V (fn S Tms) A :- map (termval M V) Tms As, functor M S As A.
*/

local termvals model A -> (term -> A -> o) -> list term -> list A -> o.
termvals _ _ [] [].
termvals M V (X :: Xs) (A :: As) :- termval M V X A, termvals M V Xs As.
termval _ V X A :- V X A.
termval M V (fn S Tms) A :- termvals M V Tms As, functor M S As A.

/* ------------------------------------------------------------------------- */
/* Interpretation of atoms.                                                  */
/* ------------------------------------------------------------------------- */

relation (model _ _ W) S As :- W S As.

/* ------------------------------------------------------------------------- */
/* Interpretation of formulas.                                               */
/* ------------------------------------------------------------------------- */

holds _ _ truth.
%holds M V (atom S Tms) :- map (termval M V) Tms As, relation M S As.
holds M V (atom S Tms) :- termvals M V Tms As, relation M S As.
holds M V (neg P) :- not (holds M V P).
holds M V (P and Q) :- holds M V P, holds M V Q.
holds M V (P or Q) :- holds M V P; holds M V Q.
holds M V (P imp Q) :- holds M V Q; not (holds M V P).
holds M V (P iff Q) :- holds M V P, holds M V Q.
holds M V (P iff Q) :- not (holds M V P), not (holds M V Q).
holds M V (exists P) :- pi x \ domex  M (A \ holds M (extend x A V) (P x)).
holds M V (forall P) :- pi x \ domall M (A \ holds M (extend x A V) (P x)).

/* ========================================================================= */
/* Generic code for testing interpretations.                                 */
/* ========================================================================= */

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

/* ========================================================================= */
/* Model: addition on integers modulo 3.                                     */
/* ========================================================================= */

/* ------------------------------------------------------------------------- */
/* Domain3.                                                                   */
/* ------------------------------------------------------------------------- */

domain3 N :- member N [0, 1, 2].

/* ------------------------------------------------------------------------- */
/* Addition on integers modulo 3.                                            */
/* ------------------------------------------------------------------------- */

add3 0 N N :- domain3 N.
add3 N 0 N :- domain3 N.
add3 1 1 2.
add3 1 2 0.
add3 2 1 0.
add3 2 2 1.

/* ------------------------------------------------------------------------- */
/* Multiplication on integers modulo 3.                                      */
/* ------------------------------------------------------------------------- */

mul3 0 N 0 :- domain3 N.
mul3 N 0 0 :- domain3 N.
mul3 1 N N :- domain3 N.
mul3 N 1 N :- domain3 N.
mul3 2 2 1.

/* ------------------------------------------------------------------------- */
/* Equality.                                                                 */
/* ------------------------------------------------------------------------- */

eq3 N N :- domain3 N.

/* ========================================================================= */
/* Model: addition on integers modulo 4.                                     */
/* ========================================================================= */

domain4 N :- member N [0, 1, 2, 3].

add4 0 N N :- domain4 N.
add4 N 0 N :- domain4 N.
add4 1 1 2.
add4 1 2 3.
add4 1 3 0.
add4 2 1 3.
add4 2 2 0.
add4 2 3 1.
add4 3 1 0.
add4 3 2 1.
add4 3 3 2.

mul4 0 N 0 :- domain4 N.
mul4 N 0 0 :- domain4 N.
mul4 1 N N :- domain4 N.
mul4 N 1 N :- domain4 N.
mul4 2 2 0.
mul4 2 3 2.
mul4 3 2 2.
mul4 3 3 1.

eq4 N N :- domain4 N.

/* ========================================================================= */
/* Boolean model.                                                            */
/* ========================================================================= */

domainb M :- member M [0, 1].

/*----------------disjunction----------------*/
addb 1 1 1.
addb 1 0 1.
addb 0 1 1.
addb 0 0 0.

/*----------------exclusive or----------------*/
addexb 1 1 0.
addexb 1 0 1.
addexb 0 1 1.
addexb 0 0 0.

/*----------------conjunction----------------*/
mulb 1 1 1.
mulb 1 0 0.
mulb 0 1 0.
mulb 0 0 0.

eqb N N :- domainb N.

/* ========================================================================= */
/* Model: simple undirected graph.                                           */
/* ========================================================================= */

/* ------------------------------------------------------------------------- */
/* Four edges.                                                               */
/* ------------------------------------------------------------------------- */

node 0.
node 1.
node 2.
node 3.

/* ------------------------------------------------------------------------- */
/* Edges.                                                                    */
/* ------------------------------------------------------------------------- */

link 0 1.
link 1 2.
link 2 0.
link 0 3.

/* ========================================================================= */
/* Interpetation of first order logic in the language of arith3.             */
/* ========================================================================= */

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

func3 "zero" [] 0.
func3 "one" [] 1.
func3 "two" [] 2.
func3 "+" [M, N] P :- add3 M N P.
func3 "*" [M, N] P :- mul3 M N P.

/* ------------------------------------------------------------------------- */
/* Interpretation of predicates.                                             */
/* ------------------------------------------------------------------------- */

pred3 "=" [M, N] :- eq3 M N.

/* ------------------------------------------------------------------------- */
/* Validity.                                                                 */
/* ------------------------------------------------------------------------- */

use_model "arith3" (model domain3 func3 pred3).

/* ========================================================================= */
/* Interpetation of first order logic in the language of arith4.             */
/* ========================================================================= */

func4 "zero" [] 0.
func4 "one" [] 1.
func4 "two" [] 2.
func4 "three" [] 3.
func4 "+" [M, N] P :- add4 M N P.
func4 "*" [M, N] P :- mul4 M N P.

pred4 "=" [M, N] :- eq4 M N.

use_model "arith4" (model domain4 func4 pred4).

/* ========================================================================= */
/* Interpreatation for booleans.                                             */
/* ========================================================================= */

funcb "ff" [] 0.
funcb "vv" [] 1.
funcb "+" [M, N] P :- addb M N P.
funcb "++" [M, N] P :- addexb M N P.
funcb "*" [M, N] P :- mulb M N P.

predb "=" [M, N] :- eqb M N.

use_model "bool" (model domainb funcb predb).

/* ========================================================================= */
/* Interpretation of the language in the model as directed graph.            */
/* ========================================================================= */

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

func0 "n0" [] 0.
func0 "n1" [] 1.
func0 "n2" [] 2.
func0 "n3" [] 3.

/* ------------------------------------------------------------------------- */
/* Interpretation of predicates.                                             */
/* ------------------------------------------------------------------------- */

pred0 "edge" (A :: B :: nil) :- link A B.

/* ------------------------------------------------------------------------- */
/* Validity.                                                                 */
/* ------------------------------------------------------------------------- */

use_model "graph0" (model node func0 pred0).

/* ========================================================================= */
/* Interpretation of the language in the model as undirected graph.          */
/* ========================================================================= */

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

func1 "n0" [] 0.
func1 "n1" [] 1.
func1 "n2" [] 2.
func1 "n3" [] 3.

/* ------------------------------------------------------------------------- */
/* Interpretation of predicates.                                             */
/* ------------------------------------------------------------------------- */

pred1 "edge" [A, B] :- (link A B; link B A).

/* ------------------------------------------------------------------------- */
/* Validity.                                                                 */
/* ------------------------------------------------------------------------- */

use_model "graph1" (model node func1 pred1).

/* ========================================================================= */
/* Examples and tests in the language of arithmetics.                        */
/* ========================================================================= */

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
        (atom "=" [fn "+" [X, E], X]) and (atom "=" [fn "+" [E, X], X])).

% Esiste un elemento assorbente.
test "ex_absorb"
     (exists Z \ forall X \ atom "=" [fn "*" [X, Z], Z]).

% Tutti gli elmenti hanno ordine 3.
test "all_ord_3"
     (forall X \ atom "=" [fn "+" [X, fn "+" [X, X]], fn "zero" []]).

test "ex_inv"
     (forall X \
            (neg (atom "=" [X, fn "zero" []])) imp
            (exists Y \ atom "=" [fn "*" [X, Y], fn "one" []])).


test "all_inv"
      (forall X \
      	      exists Y \ atom "=" [fn "*" [X, Y], fn "one" []]).

/* ========================================================================= */
/* Examples and tests in the language of graphs.                             */
/* ========================================================================= */

test "link01" (atom "edge" (fn "n0" nil :: fn "n1" nil :: nil)).
test "link10" (atom "edge" (fn "n1" nil :: fn "n0" nil :: nil)).

/* ------------------------------------------------------------------------- */
/* Grafo totalmente connesso.                                                */
/* ------------------------------------------------------------------------- */

test "graph_tot_conn" (forall X \ forall Y \ atom "edge" (X :: Y :: nil)).

/* ------------------------------------------------------------------------- */
/* Grafo simmetrico.                                                         */
/* ------------------------------------------------------------------------- */

test "graph_sym"
     (forall X \ forall Y \
        (atom "edge" (X :: Y :: nil)) imp (atom "edge" (Y :: X :: nil))).

/* ------------------------------------------------------------------------- */
/* Non esistono nodi isolati.                                                */
/* ------------------------------------------------------------------------- */

test "graph_no_isol"
     (forall X \ exists Y \
      (atom "edge" (X :: Y :: nil)) or (atom "edge" (Y :: X :: nil))).

/* ------------------------------------------------------------------------- */
/* Grafo connesso.                                                           */
/* ------------------------------------------------------------------------- */

test "graph_conn"
     (((forall X \ atom "path" (X :: X :: nil)) and
               (forall X \ forall Y \
                  (exists Z \
                         (atom "edge" (X :: Z :: nil)) and
                             (atom "path" (Z :: Y :: nil))) imp
                      (atom "path" (X :: Y :: nil)))) imp
          (forall X \ forall Y \ atom "path" (X :: Y :: nil))).

/* ========================================================================= */
/* Theory of addition in Z3: tests and examples.                             */
/* ========================================================================= */

unit "arith3" "all_truth" ok.
unit "arith3" "all_false" ko.
unit "arith3" "ex_truth" ok.
unit "arith3" "ex_false" ko.
unit "arith3" "all_idemp" ko.
unit "arith3" "ex_idemp" ok.
unit "arith3" "add_comm" ok.
unit "arith3" "ex_neutral" ok.
unit "arith3" "ex_absorb" ok.
unit "arith3" "all_ord_3" ok.
unit "arith3" "ex_inv" ok.
unit "arith3" "all_inv" ko.

/* Esistenza dell'inverso. */
/* Per ogni X diverso da 0 esiste Y tale che X * Y = 1 */
/*
inv3 :- holds (model domain3 func3 pred3) undefined
        (forall X \
	   imp (neg (atom "=" [X, fn "zero" []]))
    	       (exists Y \ atom "=" [fn "*" [X, Y], fn "one" []])).

inv3x :- holds (model domain3 func3 pred3) undefined
        (forall X \ exists Y \ atom "=" [fn "*" [X, Y], fn "one" []]).
*/

/* ========================================================================= */
/* Theory of addition in Z4: tests and examples.                             */
/* ========================================================================= */

unit "arith4" "all_truth" ok.
unit "arith4" "all_false" ko.
unit "arith4" "ex_truth" ok.
unit "arith4" "ex_false" ko.
unit "arith4" "all_idemp" ko.
unit "arith4" "ex_idemp" ok.
unit "arith4" "add_comm" ok.
unit "arith4" "ex_neutral" ok.
unit "arith4" "ex_absorb" ok.
unit "arith4" "all_ord_3" ko.
unit "arith4" "ex_inv" ko.
unit "arith4" "all_inv" ko.

/* ========================================================================= */
/* Theory of addition in Bool: tests and examples.                           */
/* ========================================================================= */

unit "bool" "all_truth" ok.
unit "bool" "all_false" ko.
unit "bool" "ex_truth" ok.
unit "bool" "ex_false" ko.
unit "bool" "all_idemp" ok.
unit "bool" "ex_idemp" ok.
unit "bool" "add_comm" ok.
unit "bool" "ex_neutral" ok.
unit "bool" "ex_absorb" ok.
unit "bool" "ex_inv" ko.
unit "bool" "all_inv" ko.

/* ========================================================================= */
/* Directed graph: tests and examples.                                       */
/* ========================================================================= */

unit "graph0" "link01" ok.
unit "graph0" "link10" ko.
unit "graph0" "graph_tot_conn" ko.
unit "graph0" "graph_sym" ko.
unit "graph0" "graph_no_isol" ok.
unit "graph0" "graph_conn" ko.

/* ========================================================================= */
/* Undirected graph: tests and examples.                                     */
/* ========================================================================= */

unit "graph1" "link01" ok.
unit "graph1" "link10" ok.
unit "graph1" "graph_tot_conn" ko.
unit "graph1" "graph_sym" ok.
unit "graph1" "graph_no_isol" ok.
unit "graph1" "graph_conn" ok.

end