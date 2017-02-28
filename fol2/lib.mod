module lib.

append nil L L.
append L nil L.
append (X::L1) L2 (X::L3):-append L1 L2 L3.

map F [] [].
map F (X :: Xs) (Y :: Ys) :- F X Y, map F Xs Ys.

unions [] [].
unions (X :: Xs) Ys :- unions Xs Zs, append X Zs Ys.

ex P (X :: Xs) :- P X; ex P Xs.

end
