/* ========================================================================= */
/* Predicate logic.                                                          */
/* ========================================================================= */

sig fol2.

/* ------------------------------------------------------------------------- */
/* Library.                                                                  */
/* ------------------------------------------------------------------------- */

type append list A -> list A -> list A -> o.
type map (A -> B -> o) -> list A -> list B -> o.
type unions list (list A) -> list A -> o.

/* ------------------------------------------------------------------------- */
/* Term datatypes.                                                           */
/* ------------------------------------------------------------------------- */

kind term type.

% type var string -> term.
type fn string -> list term -> term.

/* ------------------------------------------------------------------------- */
/* Formulas.                                                                 */
/* ------------------------------------------------------------------------- */

kind fol type.

type atom string -> term -> fol.
type truth fol.
type false fol.
type and fol -> fol -> fol.
type forall (term -> fol) -> fol.

/* ------------------------------------------------------------------------- */
/* Semantica.                                                                */
/* ------------------------------------------------------------------------- */

type termval (string -> list A -> A -> o) -> term -> A -> o.

type holds (A -> o) ->
           (string -> A -> o) ->
           (string -> list A -> A -> o) ->
      	   fol -> o.

type myfol fol -> o.

type myi string -> list int -> int -> o.
type myd int -> o.
% type mym string -> list int -> o.
type mym string -> int -> o.
type test o.

end