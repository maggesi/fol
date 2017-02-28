% Termini per la logica dei predicati.

sig term1.
kind term type.

type var string -> term.

type fn string -> list term -> term.
% Esempio di termine: fn "add"  [X, Y].

type eq term -> term -> term.

type bottom term.
type lhs term -> term -> o.

type toccurs string -> term  -> o.
type fvt term -> list string -> o.
type tsubst (string -> term -> o) -> term -> term -> o.
end