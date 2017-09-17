/* ========================================================================= */
/* Semantics for first order logic.                                          */
/* ========================================================================= */

sig fol.

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

end
