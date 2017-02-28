module prova.

hasAge "Alan" 9.
hasAge "Helen" 18.
hasAge "Marcus" 26.
hasAge "Lucas" 9.

canDrink Someone :- hasAge Someone Age, Age >= 18.
