accumulate smallcheck.

/* ------------------------------------------------------------------------- */
/* onatoms								     */
/* ------------------------------------------------------------------------- */

onatoms F (atom A) P :- F A P.
onatoms F (not P) (not P') :- onatoms F P P'.
onatoms F (and P Q) (and P' Q') :- onatoms F P P', onatoms F Q Q'.
onatoms F (or P Q) (or P' Q') :- onatoms F P P', onatoms F Q Q'.
onatoms F (imp P Q) (imp P' Q') :- onatoms F P P', onatoms F Q Q'.
onatoms F (iff P Q) (iff P' Q') :- onatoms F P P', onatoms F Q Q'.
onatoms F (forall x\P) (forall x\P') :- pi x \ onatoms F (P x) (P' x).
onatoms F (exists x\P) (exists x\P') :- pi x \ onatoms F (P x) (P' x).

testf _ fff.
