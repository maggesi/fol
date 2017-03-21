module arith4interp.

func4 "zero" [] 0.
func4 "one" [] 1.
func4 "two" [] 2.
func4 "three" [] 3.
func4 "+" [M, N] P :- add4 M N P.
func4 "*" [M, N] P :- mul4 M N P.

pred4 "=" [M, N] :- eq4 M N.

use_model "arith4" (model domain4 func4 pred4).

end