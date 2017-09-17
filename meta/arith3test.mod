/* ========================================================================= */
/* Theory of addition in Z3: tests and examples.                             */
/* ========================================================================= */

module arith3test.

unit "arith3" "all_truth" ok.
unit "arith3" "all_false" ko.
unit "arith3" "ex_truth" ok.
unit "arith3" "ex_false" ko.
unit "arith3" "all_idemp" ko.
unit "arith3" "ex_idemp" ok.
unit "arith3" "add_comm" ok.
unit "arith3" "ex_neutral" ok.
unit "arith3" "ex_absorb" ok.
unit "arith3" "all_ord_3" ok.
unit "arith3" "ex_inv" ok.
unit "arith3" "all_inv" ko.

/* Esistenza dell'inverso. */
/* Per ogni X diverso da 0 esiste Y tale che X * Y = 1 */
/*
inv3 :- holds (model domain3 func3 pred3) undefined
        (forall X \
	   imp (neg (atom "=" [X, fn "zero" []]))
    	       (exists Y \ atom "=" [fn "*" [X, Y], fn "one" []])).

inv3x :- holds (model domain3 func3 pred3) undefined
        (forall X \ exists Y \ atom "=" [fn "*" [X, Y], fn "one" []]).
*/

end
