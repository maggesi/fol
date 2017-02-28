sig lib.

type append list A -> list A -> list A -> o.
type map (A -> B -> o) -> list A -> list B -> o.
type unions list (list A) -> list A -> o.
type ex (A -> o) -> list A -> o.

end
