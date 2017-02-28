module statemachine.

initial a.
final a.

transition a 1 b.
transition b 1 a.
transition b 2 b.
transition b 3 b.
transition b 1 b.
transition b 2 a.
transition b 4 c.
transition c 5 b.
transition c 5 a.

runAuto Word :- initial S, runAux Word S.

runAux nil S :- final S.
runAux [L|Word] S :- transition S L Nexts, runAux Word Nexts.			   
