/* ========================================================================= */
/* Miscellanea.                                                              */
/* ========================================================================= */

module lib.

union [] L L.
union [Head|Tail] L1 L:- insert Head L1 L2, union Tail L2 L.

insert X Xs Xs:- member X Xs, !.
insert X Xs [X|Xs].

member Name [Name|Tail].
member Name [Head|Tail]:- member Name Tail.

/* ------------------------------------------------------------------------- */
/* Varie chiusure riflessive e transitive.                                   */
/* ------------------------------------------------------------------------- */

%% Con taglio.

reflc R X Y:- R X Y, !.
reflc R X X.

% Con traccia.

reflct S R X Y:- R X Y, !.
reflct S R X X :- print S, print " - reflc: ",
                  term_to_string X T, print T,
 		  print "\n", flush std_out.

end
