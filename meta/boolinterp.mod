module boolinterp.

import fol, boolmodel.

funcb "ff" [] 0.
funcb "vv" [] 1.


predb "=" [M, N] :- eqb M N.

use_model "bool" (model domainb funcb predb).

end
