sig meta.

/* ------------------------------------------------------------------------- */
/* Liste.                                                                    */
/* ------------------------------------------------------------------------- */

type union list A -> list A -> list A -> o.
type insert A -> list A -> list A -> o.

type member A -> list A -> o.

/* ------------------------------------------------------------------------- */
/* Varie chiusure riflessive e transitive.                                   */
/* ------------------------------------------------------------------------- */

type reflc (A -> A -> o) -> A -> A -> o.

type reflct string -> (A -> A -> o) -> A -> A -> o.

/* ========================================================================= */
/* Semantics for first order logic.                                          */
/* ========================================================================= */

/* ------------------------------------------------------------------------- */
/* Terms.                                                                    */
/* ------------------------------------------------------------------------- */

kind term, form type.

type var string -> term.
type fn string -> list term -> term.

/* ------------------------------------------------------------------------- */
/* Formulas.                                                                 */
/* ------------------------------------------------------------------------- */

type atom string -> list term -> form.
type truth, false form.
type neg form -> form.
type and, or, imp, iff form -> form -> form.
type forall, exists (term -> form) -> form.

infixl and 5.
infixl or 4.
infixr imp 3.
infixr iff 3.

/* ------------------------------------------------------------------------- */
/* Models.                                                                   */
/* ------------------------------------------------------------------------- */

kind model type -> type.

type model
  (A -> o) ->                             /* domain */
  (string -> list A -> A -> o) ->         /* terms' evaluation */
  (string -> list A -> o) ->              /*  relations' evaluation */
  model A.

/* ------------------------------------------------------------------------- */
/* Domain.                                                                   */
/* ------------------------------------------------------------------------- */

type domain model A -> A -> o.
type domall,domex model A -> (A -> o) -> o.

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

type undefined term -> A -> o.
type extend term -> A -> (term -> A -> o) -> term -> A -> o.
type functor model A -> string -> list A -> A -> o.
type termval model A -> (term -> A -> o) -> term -> A -> o.

/* ------------------------------------------------------------------------- */
/* Interpretation of atoms.                                                  */
/* ------------------------------------------------------------------------- */

type relation model A -> string -> list A -> o.

/* ------------------------------------------------------------------------- */
/* Interpretation of formulas.                                               */
/* ------------------------------------------------------------------------- */

type holds model A -> (term -> A -> o) -> form -> o.

type use_model string -> model A -> o.

/* ========================================================================= */
/* Generic code for testing interpretations.                                 */
/* ========================================================================= */

kind result type.

type ok, ko result.

type check o -> result -> o.

type test string -> form -> o.

type unit string -> string -> result -> o.

type runtest string -> string -> form -> result -> result -> o.

type failtest string -> string -> form -> result -> o.

/* ========================================================================= */
/* Model: addition on integers modulo 3.                                     */
/* ========================================================================= */

type listdomain int -> list int -> o.
type domain3 int -> o.
type add3 int -> int -> int -> o.
type mul3 int -> int -> int -> o.
type eq3 int -> int -> o.

/* ========================================================================= */
/* Model: addition on integers modulo 4.                                     */
/* ========================================================================= */

type listdomain int -> list int -> o.
type domain4 int -> o.
type add4 int -> int -> int -> o.
type mul4 int -> int -> int -> o.
type eq4 int -> int -> o.

/* ========================================================================= */
/* Model: boolean.                                                           */
/* ========================================================================= */

type listdomain int -> list int -> o.
type domainb int -> o.

type addb int -> int -> int -> o.
type mulb int -> int -> int -> o.
type addexb int -> int -> int -> o.
type eqb int -> int -> o.

/* ========================================================================= */
/* Model: simple undirected graph.                                           */
/* ========================================================================= */

type node A -> o.
type link int -> int -> o.

/* ========================================================================= */
/* Interpetation of first order logic in the language of arith3.             */
/* ========================================================================= */

type func3 string -> list int -> int -> o.
type pred3 string -> list A -> o.

/* ========================================================================= */
/* Interpetation of first order logic in the language of arith4.             */
/* ========================================================================= */

type func4 string -> list int -> int -> o.
type pred4 string -> list A -> o.
type inv4 o.

/* ========================================================================= */
/* Interpetation in booleans.                                                */
/* ========================================================================= */

type funcb string -> list int -> int -> o.
type predb string -> list A -> o.

/* ========================================================================= */
/* Interpretation of the language in the model as directed graph.            */
/* ========================================================================= */

type func0 string -> list int -> int -> o.
type pred0 string -> list int -> o.

/* ========================================================================= */
/* Interpretation of the language in the model as undirected graph.          */
/* ========================================================================= */

type func1 string -> list int -> int -> o.
type pred1 string -> list int -> o.

end
