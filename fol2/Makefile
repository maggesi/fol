# Etichetta di default

default : pred1.lp

# Generazione dei files oggetto

pred1.lpo : pred1.mod pred1.sig term1.lpo
	tjcc pred1

term1.lpo : term1.mod term1.sig lib.lpo
	tjcc term1

lib.lpo : lib.mod lib.sig
	tjcc lib

# Linking

pred1.lp : term1.lpo pred1.lpo
	tjlink pred1
