sig maybe.
kind option type -> type.
kind pair type -> type -> type.
kind ressource, location type.

type member A -> list A -> o.
type length list A -> int -> o.
type none option A.
type some A -> option A.
type pr A -> B -> pair A B.
type loc pair int int -> option ressource -> location.
type food, gold, stone, wood ressource.
type filterLocations list location -> list location -> o.

