module append2.

pi L\ append nil L L.
pi X\ pi L1\ pi L2\ pi L3\ append (X :: L1) L2 (X :: L3) :- append L1 L2 L3.

sublist L K :- append _ T K, append L _ T.
