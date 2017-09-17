sig extras.

/* ------------------------------------------------------------------------- */
/* Liste.                                                                    */
/* ------------------------------------------------------------------------- */

type append list A -> list A -> list A -> o.

type unions list (list A) -> list A -> o.

type map (A -> B -> o) -> list A -> list B -> o.

type ex (A -> o) -> list A -> o.

type all (A -> o) -> list A -> o.

type numseg int -> int -> list int -> o.

/* ------------------------------------------------------------------------- */
/* Varie chiusure riflessive e transitive.                                   */
/* ------------------------------------------------------------------------- */

type rc, tc, rtc, nf (A -> A -> o) -> A -> A -> o.

type determ, reduct  (A -> A -> o) -> A -> A -> o.

end