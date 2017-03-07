module interpb.

accumulate fol, bool.

termval ff 0.
termval tt 1.

termval (add X Y) P :- termval X M, termval Y N, addb M N P', termval P P'.

holds (eq X Y) :- termval X M, termval Y N, M = N.

end