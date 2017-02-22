/* ========================================================================= */
/* Predicate logic.                                                          */
/* ========================================================================= */

module fol.

accumulate lib.

/* ------------------------------------------------------------------------- */
/* Terms.                                                                    */
/* ------------------------------------------------------------------------- */

fvt (var X) [X].
fvt (fn F Args) Vars :- map fvt Args Vls, unions Vls Vars.

/* ------------------------------------------------------------------------- */
/* Term evaluation.                                                          */
/* ------------------------------------------------------------------------- */

/* OCaml version. */
/*
let rec termval (domain,func,pred as m) v tm =
  match tm with
    Var(x) -> apply v x
  | Fn(f,args) -> func f (map (termval m v) args);;
*/

termval _ V (var X) Y :- V X Y.
termval Func V (fn F Args) W :-
  map (termval Func V) Args Ws,
  Func F Ws W.

/* ------------------------------------------------------------------------- */
/* Term substitution.                                                        */
/* ------------------------------------------------------------------------- */

/* OCaml version. */
/*
let rec tsubst sfn tm =
  match tm with
    Var x -> tryapplyd sfn x tm
  | Fn(f,args) -> Fn(f,map (tsubst sfn) args);;
*/

tsubst Sfn (Var X) Tm :- Sfn X Tm.
tsubst Sfn (fn F Args) (fn F Args') :- map (tsubst Sfn) Args Args'.

/* ------------------------------------------------------------------------- */
/* Formulas.                                                                 */
/* ------------------------------------------------------------------------- */

fv (atom _ Tm) Vars :- fvt Tm Vars.
fv (and P Q) Vars :- fv P Pvars, fv Q Qvars, append Pvars Qvars Vars.
fv (forall x \ P x) Vars :- fv (P (fn "" [])) Vars.

/* ------------------------------------------------------------------------- */
/* Substitution in formulas.                                                 */
/* ------------------------------------------------------------------------- */

subst _ truth truth.
% subst SubstFn (atom R Tml) (atom R Tml') :- map (tsubst SubstFn) Tml Tml'.
subst SubstFn (atom R Tm) (atom R Tm') :- tsubst SubstFn Tm Tm'.
subst SubstFn (and P Q) (and P' Q') :- subst SubstFn P P', subst SubstFn Q Q'.
subst SubstFn (forall x \ P x) (forall x \ P' x) :-
  pi x \ subst SubstFn (P x) (P' X).

end
