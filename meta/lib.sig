sig lib.

type append list A -> list A -> list A -> o.

type unions list (list A) -> list A -> o.

type map (A -> B -> o) -> list A -> list B -> o.

type ex (A -> o) -> list A -> o.

type member A -> list A -> o.

type numseg int -> int -> list int -> o.

end