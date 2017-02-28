module reverse.

rev nil L L.
rev (X :: L) K M :- rev L K (X :: M).
reverse L K :- pi rev\( pi L\ rev nil L L) & (pi X\pi L\pi K\ pi M\ rev (X :: L) K M :- rev L K (X :: M)) => rev L K nil.
