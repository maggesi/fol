module arith4model.


listdomain 0 (0 :: nil).
%listdomain N (N :: Tail) :- N > 0, N1 is N - 1, listdomain N1 Tail.
listdomain N (N1 :: Tail) :- N > 0, N1 is N - 1, listdomain N1 Tail.

domain4 N :- listdomain 4 L, member N L.
domain4 0.
domain4 1.
domain4 2.
domain4 3.

add4 0 N N :- domain4 N.
add4 N 0 N :- domain4 N.
add4 1 1 2.
add4 1 2 3.
add4 1 3 0.
add4 2 1 3.
add4 2 2 0.
add4 2 3 1.
add4 3 1 0.
add4 3 2 1.
add4 3 3 2.

mul4 0 N 0 :- domain4 N.
mul4 N 0 0 :- domain4 N.
mul4 1 N N :- domain4 N.
mul4 N 1 N :- domain4 N.
mul4 2 2 0.
mul4 2 3 2.
mul4 3 2 2.
mul4 3 3 1.

eq4 N N :- domain4 N.

end