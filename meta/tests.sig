/* ========================================================================= */
/* Generic code for testing interpretations.                                 */
/* ========================================================================= */

sig tests.

accum_sig fol.

kind result type.

type ok, ko result.

type check o -> result -> o.

type test string -> form -> o.

type unit string -> result -> o.

type runtest string -> form -> result -> result -> o.

type runtest0 string -> form -> result -> o.

end
