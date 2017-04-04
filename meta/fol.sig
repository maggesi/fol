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

/* zero --> fn "zero" nil */
/* node3 --> fn "node3" nil */
/* add X Y --> fn "add" (X :: Y :: nil) */

/* ------------------------------------------------------------------------- */
/* Formulas.                                                                 */
/* ------------------------------------------------------------------------- */

kind model type -> type.

/* edge X Y --> atom "edge" (X :: Y :: nil) */
/* eq X Y --> atom "=" (X :: Y :: nil) */

type atom string -> list term -> form.
type truth, false form.
type neg form -> form. 
type and, or, imp, iff form -> form -> form.
type forall, exists (term -> form) -> form.

/* ------------------------------------------------------------------------- */
/* Models.                                                                   */
/* ------------------------------------------------------------------------- */


type model
  (A -> o) ->                             /* domain */
  (string -> list A -> A -> o) ->         /* valutazione dei termini */
  (string -> list A -> o) ->              /* valutazione delle relazioni */
  model A.

/*
type model
  list A ->                               /* domain */
  (string -> list A -> A -> o) ->         /* valutazione dei termini */
  (string -> list A -> o) ->              /* valutazione delle relazioni */
  model A.
*/  
/* ------------------------------------------------------------------------- */
/* Evaluation and validity.                                                  */
/* ------------------------------------------------------------------------- */

type undefined string -> A -> o.

% type domain A -> o.
type termval model A -> (string -> A -> o) -> term -> A -> o.
type holds model A -> (string -> A -> o) -> form -> o.

type use_model string -> model A -> o.

end
