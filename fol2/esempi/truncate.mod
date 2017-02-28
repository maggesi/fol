module truncate.

truncate nil X nil.
truncate L1 0 L1.
truncate L1 X L2:- length L1 Len, Len = X, L2 = L1.
truncate L1 X L2:- length L1 Len, Len < X, L2 = L1.
truncate [Head|Tail] 1 [Head].
truncate [Head, Tail, H] 2 [Head, Tail].
%truncate L1 X L2:- truncate [Head|Tail] X L2.
truncate [F, L1] X L2:- truncate [L1] (X-1) L3, L2 = (F :: L3).
%Y = X - 1, truncate [Head|Tail] Y [Head].


length nil 0.
length [Head|Tail] Len:- length Tail Lent, Len is Lent + 1.
							 
