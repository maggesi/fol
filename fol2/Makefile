default : pred1.lp

%.lpo : %.mod
	tjcc $<

pred1.lp : %.lp : %.lpo
	tjlink $<

clean :
	-rm -f *.lp *.lpo

depend : $(wildcard *.mod *.sig)
	tjdepend $^ > .depend

.PHONY : default depend clean

test :
	echo 

-include .depend
