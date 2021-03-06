/* ========================================================================= */
/* Interpetation of first order logic in the language of arith3.             */
/* ========================================================================= */

sig interp4.

accum_sig fol, arith4.

/* ------------------------------------------------------------------------- */
/* Language of terms.                                                        */
/* ------------------------------------------------------------------------- */

type zero, one, two, three term.
type add term -> term -> term.
type mul term -> term -> term.

/* ------------------------------------------------------------------------- */
/* Relations.                                                                */
/* ------------------------------------------------------------------------- */

type eq term -> term -> form.
/* ------------------------------------------------------------------------- */
/*Inverse.                                                                   */
/* ------------------------------------------------------------------------- */

type inv4 o.
end
