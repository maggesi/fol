default : main.lp

%.lpo : %.mod
	tjcc $<

main.lp : main.lpo
	tjlink $<

clean :
	-rm -f *.lp *.lpo

depend : $(wildcard *.mod *.sig)
	tjdepend $^ > .depend

.PHONY : default depend clean

test :
	echo 

-include .depend
