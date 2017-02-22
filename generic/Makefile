default : fol.lp

%.lpo : %.mod
	tjcc $<

fol.lp : fol.lpo
	tjlink $<

clean :
	-rm -f *.lp *.lpo

depend : $(wildcard *.mod *.sig)
	tjdepend $^ > .depend

.PHONY : default depend clean

test :
	echo 

-include .depend
