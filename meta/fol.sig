/* ========================================================================= */
/* Semantics for first order logic.                                          */
/* ========================================================================= */

sig fol.
accum_sig lib.

/* ------------------------------------------------------------------------- */
/* Terms.                                                                    */
/* ------------------------------------------------------------------------- */

kind term, form type.

type var string -> term.
type fn string -> list term -> term.

/* ------------------------------------------------------------------------- */
/* Formulas.                                                                 */
/* ------------------------------------------------------------------------- */

kind model type -> type.


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


type model
  (A -> o) ->                             /* domain */
  (string -> list A -> A -> o) ->         /* terms' evaluation */
  (string -> list A -> o) ->              /*  relations' evaluation */
  model A.


/* ------------------------------------------------------------------------- */
/* Evaluation and validity.                                                  */
/* ------------------------------------------------------------------------- */

type undefined string -> A -> o.


type termval model A -> (string -> A -> o) -> term -> A -> o.
type holds model A -> (string -> A -> o) -> form -> o.

type use_model string -> model A -> o.

end
