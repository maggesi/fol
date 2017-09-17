module extras.

accum_sig lib.

append [] Xs Xs.
append (X :: Xs) Ys (X :: Zs) :- append Xs Ys Zs.

unions [] [].
unions (X :: Xs) Ys :- unions Xs Zs, append X Zs Ys.

map F [] [].
map F (X :: Xs) (Y :: Ys) :- F X Y, map F Xs Ys.

ex P (X :: Xs) :- P X; ex P Xs.

all P [].
all P (X :: Xs) :- P X, all P Xs.

numseg N N [N].
numseg N Y [N|Tail]:- not (N = Y), N1 is N + 1, numseg N1 Y Tail.

/* ------------------------------------------------------------------------- */
/* Varie chiusure riflessive e transitive.                                   */
/* ------------------------------------------------------------------------- */

%% ---- Senza taglio. ----

%% Chiusura riflessiva.
rc R X Y :- R X Y.
rc R X X.

%% Chiusura transitiva
tc R X Y :- R X Z, rtc R Z Y.

%% Chiusura riflessiva-transitiva
rtc R X X.
rtc R X Y :- R X Z, tc R Z Y.

%% Forma normale.
nf R X Y :- rtc R X Y, not(R X Y).

%% ---- Con taglio. ----

determ R X Y :- R X Y, !.

reduct R X Y :- R X Z, !, reduct R Z Y.
reduct R X X.

end
