default : arith3test.lp graph0test.lp graph1test.lp

%.lpo : %.mod
	tjcc $<

arith3test.lp graph0test.lp graph1test.lp : %.lp : %.lpo
	tjlink $<

clean :
	-rm -f *.lp *.lpo

depend : $(wildcard *.mod *.sig)
	tjdepend $^ > .depend

.PHONY : default depend clean

test :
	echo 

-include .depend
