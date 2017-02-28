% Termini per la logica dei predicati.

module term.

accumulate lib.

lhs (eq Tm1 Tm2) Tm1.

toccurs S (var S).
toccurs S (eq L R) :- toccurs S L.
toccurs S (eq L R) :- toccurs S R.

tvars (var S) [S].
tvars (eq L R) Vars :- tvars L VL, tvars R VR, append VL VR Vars.

tsubst F (var S) Tm :- F S Tm.
tsubst F (eq L R) (eq Tml Tmr) :- tsubst F L Tml, tsubst F R Tmr.

end
