/* ========================================================================= */
/* Library.                                                                  */
/* ========================================================================= */

sig lib.

type somenot (A -> o) -> (A -> o) -> o.
type all (A -> o) -> (A -> o) -> o.

type append list A -> list A -> list A -> o.
type reverse list A -> list A -> o.
type map (A -> B -> o) -> list A -> list B -> o.
type unions list (list A) -> list A -> o.

end
