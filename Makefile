#
# Makefile for Bachelorthesis
#
#	Andreas Linz -- 10INB-T
#	HTWK-Leipzig, Fakultaet IMN
#	klingt.net@googlemail.com
#

all:
	echo "Trying to build this bloody piece of ... :)"
	xelatex thesis.tex

clean:
	echo "I will clean up this mess ..."
	rm *.out *.nav *.snm *.toc *.log *.aux