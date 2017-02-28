% Termini per la logica dei predicati.

sig term.

kind term type.

type var string -> term.

% eq e' fuorviante, dovrebbe essere una relazione (atomo):
% Esempio: atom "eq" [X, Y]

type eq term -> term -> term.

% Un esempio piu' attenente sarebbe la somma
% type add term -> term -> term.

% Libro:
% type fn string -> list term -> term.
% Esempio di termine: fn "add"  [X, Y].
type bottom term.

type lhs term -> term -> o.
type toccurs string -> term -> o.
type tvars term -> list string -> o.

type tsubst (string -> term -> o) -> term -> term -> o.
end