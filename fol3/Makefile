default : fol.lp

%.lpo : %.mod
	tjcc $<

fol.lp : fol.lpo
	tjlink $<

clean :
	-rm -f *.lp *.lpo

.depend : fol.sig fol.mod
	tjdepend $^ > .depend

.PHONY : default clean

-include .depend
