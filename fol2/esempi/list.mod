module list.
member Name [Name|Tail].
member Name [Head|Tail]:-member Name Tail.
length[] 0.
length [Head|Tail] Len:-length Tail Lent, Len is Lent + 1.
							
