/* ========================================================================= */
/* Model: Logical conjunction as addiction.                                  */
/* ========================================================================= */

module bool.

domain ff.
domain tt.

addb tt X tt :- domain X.
addb X tt tt :- domain X.
addb ff ff ff.

end.