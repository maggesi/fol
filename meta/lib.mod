module lib.

append [] Xs Xs.
append (X :: Xs) Ys (X :: Zs) :- append Xs Ys Zs.

unions [] [].
unions (X :: Xs) Ys :- unions Xs Zs, append X Zs Ys.

map F [] [].
map F (X :: Xs) (Y :: Ys) :- F X Y, map F Xs Ys.

ex P (X :: Xs) :- P X; ex P Xs.

member Name [Name|Tail].
member Name [Head|Tail]:- member Name Tail.

numseg N N [N].
numseg N Y [N|Tail]:- not (N = Y), N1 is N + 1, numseg N1 Y Tail. 



end