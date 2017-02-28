module maybe.

member Name [Name|Tail].
member Name [Head|Tail]:- member Name Tail.
length [] 0.
length [Head|Tail] Len:- length Tail Lent, Len is Lent + 1.
filterLocations nil nil.
filterLocations [loc P none |Tail] Flist &
filterLocations [loc P (some Res) |Tail] [loc P (some Res)|Flist]:-filterLocations Tail Flist.




%filterLocations [loc (pr 1 2) none, loc (pr 3 6) (some food), loc (pr 4 9) none, loc (pr 13 6) (some gold), loc (pr 13 66) (some stone)] FilteredList.
