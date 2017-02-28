module prop.

form false.
form tt.
form (atom A).
form (and P Q) :- form P, form Q. %errore
				   
form (nt P):- form P. %not
form (or P Q):- form P.
form (or P Q):- form Q.
form (imp P Q):- form Q.
form (imp P Q):-  form (nt P).			  
%form (iff P Q):- form (imp P Q), form (imp Q P).

occurs A (atom A).
occurs A (and P Q) :- occurs A P.
occurs A (and P Q) :- occurs A Q.
occurs A (nt A).
occurs A (or P Q):- occurs A P.
occurs A (or P Q):- occurs A Q.
occurs A (imp P Q):- occurs A P.
occurs A (imp P Q):- occurs A Q.
%occurs A (iff P Q):- occurs A Q.
%occurs A (iff P Q):- occurs P A.
