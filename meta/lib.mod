module lib.

append [] Xs Xs.
append (X :: Xs) Ys (X :: Zs) :- append Xs Ys Zs.

unions [] [].
unions (X :: Xs) Ys :- unions Xs Zs, append X Zs Ys.

map F [] [].
map F (X :: Xs) (Y :: Ys) :- F X Y, map F Xs Ys.

ex P (X :: Xs) :- P X; ex P Xs.

all P [].
all P (X :: Xs) :- P X, all P Xs.

member Name [Name|Tail].
member Name [Head|Tail]:- member Name Tail.

numseg N N [N].
numseg N Y [N|Tail]:- not (N = Y), N1 is N + 1, numseg N1 Y Tail. 
/*---------------------------------------------------Varie chiusure riflessive e transitive: */
%% Senza taglio.
%da usare in simplify
rc R X Y :- R X Y.
rc R X X.
%chiusura transitiva
tc R X Y :- R X Z, rtc R Z Y.

rtc R X X.
rtc R X Y :- R X Z, tc R Z Y.

nf R X Y :- rtc R X Y, not(R X Y).

%% Con taglio.

determ R X Y :- R X Y, !.

%maybe
reflc R X Y:- R X Y, !.
reflc R X X.

reduct R X Y :- R X Z, !, reduct R Z Y.
reduct R X X.

%con traccia
reflct S R X Y:- R X Y, !.
reflct S R X X :- print S, print " - reflc: ", term_to_string X T, print T, print "\n"; flush std_out.

end
