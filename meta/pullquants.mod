module pullquants.

accumulate lib.

local pullquant1 form -> form -> o.
pullquant1 ((Quant X \ P X) and (Quant Y \ Q Y)) (Quant Z \ ((P Z) and (Q Z))) :- quant Quant, !.
pullquant1 ((Quant X \ P X) or (Quant Y \ Q Y)) (Quant Z \ ((P Z) or (Q Z))) :- quant Quant, !.
pullquant1 ((Quant X \ P X) and Q) (Quant Z \ (P Z) and Q) :- quant Quant, !.
pullquant1 ((Quant X \ P X) or Q) (Quant Z \ (P Z) or Q) :- quant Quant, !.
pullquant1 (P and (Quant Y \ Q Y)) (Quant Z \ P and (Q Z)) :- quant Quant, !.
pullquant1 (P or (Quant Y \ Q Y)) (Quant Z \ P or (Q Z)) :- quant Quant, !.
pullquant1 (Quant X \ P) (Quant X \ P) :- quant Quant.

pullquant P Q:- reflc pullquant1 P Q.


quant forall.
quant exists.

local pullquants1 form -> form -> o.
pullquants1 P (Quant X \ Q X) :-
  pullquant P (Quant X \ P' X),
  quant Quant,
  (pi X \ pullquants (P' X) (Q X)).

pullquants P Q:- reflc pullquants1 P Q.

end