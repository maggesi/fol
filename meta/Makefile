default : main.lp testsucc.lp arith3test.lp arith4test.lp \
  booltests.lp graph0test.lp graph1test.lp

%.lpo : %.mod
	tjcc $<

main.lp testsucc.lp arith3test.lp arith4test.lp \
  booltests.lp graph0test.lp graph1test.lp : %.lp : %.lpo
	tjlink $<

clean :
	-rm -f *.lp *.lpo

depend : $(wildcard *.mod *.sig)
	tjdepend $^ > .depend

.PHONY : default depend clean

-include .depend
