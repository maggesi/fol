/* ========================================================================= */
/* Library.                                                                  */
/* ========================================================================= */

module lib.

/* ------------------------------------------------------------------------- */
/* Meta predicates.                                                          */
/* ------------------------------------------------------------------------- */

somenot G P :- G X, not (P X).
all G P :- not (somenot G P).

/* ------------------------------------------------------------------------- */
/* Lists.                                                                    */
/* ------------------------------------------------------------------------- */

append [] Xs Xs.
append (X :: Xs) Ys (X :: Zs) :- append Xs Ys Zs.

reverse [] [].
reverse (X :: Xs) Ys :- reverse Xs Zs, append Zs [X] Ys.

map F [] [].
map F (X :: Xs) (Y :: Ys) :- F X Y, map F Xs Ys.

unions [] [].
unions (X :: Xs) Ys :- unions Xs Zs, append X Zs Ys.

/* ------------------------------------------------------------------------- */
/* setify cmp list list                                                      */
/* ------------------------------------------------------------------------- */

/*
pivot _ [] _ [] [].
pivot Ls (X :: Xs) P (X :: Ys) Zs :- Ls X P, pivot Ls Xs P Ys Zs.
pivot Ls (X :: Xs) P Ys (X :: Zs) :- Ls P X, pivot Ls Xs P Ys Zs.
pivot Ls (P :: Xs) P Ys Zs :- pivot Ls Xs P Ys Zs.

setify _ [] [].
setify Ls (X :: Xs) Ys :- pivot Ls Xs X As Bs, setify Ls As As', setify Ls Bs Bs',
  append As' (X :: Bs') Ys.
*/

end
