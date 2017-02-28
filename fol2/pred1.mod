module pred1.

accumulate lib.
accumulate term1.

form false.
form truth.
form (atom P A):- form P.
form (and P Q) :- form P, form Q.
form (nt P):- form P. %not
form (or P Q):- form P, form Q.
form (imp P Q) :- form Q, form P.
form (iff P Q) :- form (P), form (Q).

form (exists (x\ P x)):- sigma x \ form (P x).
form (forall (x\ P x)) :- pi x \ form (P x).			 

occurs S (atom P Xs):- ex (occurs S) Xs.

occurs A (and P Q) :- occurs A P; occurs A Q.
occurs A (nt P) :- occurs A P.
occurs A (or P Q):- occurs A P.
occurs A (or P Q):- occurs A Q.
occurs A (imp P Q):- occurs A P.
occurs A (imp P Q):- occurs A Q.
occurs A (iff P Q):- occurs A P.
occurs A (iff P Q):- occurs A Q.

occurs A (exists (x \ P x)) :- occurs A (P bottom).
occurs A (forall (x \ P x)) :- occurs A (P bottom).


fv truth [].
fv false [].
%fv (atom Tm) Vars :- fvt Tm Vars.
%fv (atom F Args) Vars :- fvt Args Vars.
fv (atom F Args) Vars :- map fvt Args Vss, unions Vss Vars.

fv (and P Q) Vars :- fv P VP, fv Q VQ, append VP VQ Vars.
fv (forall x \ P x) Vars :- fv (P bottom) Vars.

/*
subst S (atom R Tml) (atom R Tml') :- map (tsubst S) Tml Tml'.
subst S (and P Q) (and P' Q') :- subst S P P', subst S Q Q'.
subst SubstFn (forall x \ P x) (forall x \ P' x) :- pi x \ subst SubstFn (P x) (P' X).
 

%holds
%termval Func V Tm W
termval _ V (var X) Y :- V X Y.
termval Func V (fn F Args) W :- map (termval Func V) Args Ws, Func F Ws W.
*/ 
 
%model
fsub "X" (var "ciao").
fsub "Y" (var "pqr").
