module pred.

accumulate lib.
accumulate term.

form false.
form truth.
form (atom A).
form (and P Q) :- form P, form Q.
form (nt P):- form P. %not
form (or P Q):- form P, form Q.
form (imp P Q) :- form Q, form P.
form (iff P Q) :- form (P), form (Q).

form (exists (x\ P x)):- sigma x \ form (P x).
form (forall (x\ P x)) :- pi x \ form (P x).			 
			  
occurs S (atom Tm) :- toccurs S Tm.
occurs A (and P Q) :- occurs A P.
occurs A (and P Q) :- occurs A Q.
occurs A (nt P) :- occurs A P.
occurs A (or P Q):- occurs A P.
occurs A (or P Q):- occurs A Q.
occurs A (imp P Q):- occurs A P.
occurs A (imp P Q):- occurs A Q.
occurs A (iff P Q):- occurs A P.
occurs A (iff P Q):- occurs A Q.
		  
occurs A (exists (x \ P x)) :- occurs A (P bottom).
occurs A (forall (x \ P x)) :- occurs A (P bottom).

frees truth [].
frees false [].
frees (atom Tm) Vars :- tvars Tm Vars.
frees (and P Q) Vars :- frees P VP, frees Q VQ, append VP VQ Vars.
frees (forall x \ P x) Vars :- frees (P bottom) Vars.

subst F (atom Tm) (atom Tm') :- tsubst F Tm Tm'.
subst F (and P Q) (and P' Q') :- subst F P P', subst F Q Q'.
subst F (forall x \ P x) (forall x \ P' x) :-
  pi x \ tsubst F x x => subst F (P x) (P' x).

		%pag 131

fsub "X" (var "ciao").
fsub "Y" (var "pqr").
