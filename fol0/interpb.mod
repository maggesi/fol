module interpb.

accumulate fol, bool.

termval _ zero false.
termval _ one true.
termval V (add X Y) P :- termval V X M, termval V Y N, addb M N P.

holds V (eq X Y) :- termval V X M, termval V Y N, M = N.

end