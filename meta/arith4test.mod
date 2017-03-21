/* ========================================================================= */
/* Theory of addition in Z4: tests and examples.                             */
/* ========================================================================= */

module arith4test.

unit "arith4" "all_truth" ok.
unit "arith4" "all_false" ko.
unit "arith4" "ex_truth" ok.
unit "arith4" "ex_false" ko.
unit "arith4" "all_idemp" ko.
unit "arith4" "ex_idemp" ok.
unit "arith4" "add_comm" ok.
unit "arith4" "ex_neutral" ok.
unit "arith4" "ex_absorb" ok.
unit "arith4" "all_ord_3" ko.
unit "arith4" "ex_inv" ko.
unit "arith4" "all_inv" ko.

end
