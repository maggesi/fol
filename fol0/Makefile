default : main.lp main4.lp mainb.lp

%.lpo : %.mod
	tjcc $<

main.lp main4.lp mainb.lp : %.lp : %.lpo
	tjlink $<

clean :
	-rm -f *.lp *.lpo

depend : $(wildcard *.mod *.sig)
	tjdepend $^ > .depend

.PHONY : default depend clean

-include .depend
