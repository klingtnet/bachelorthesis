#
# Makefile for Bachelorthesis
#
#	Andreas Linz -- 10INB-T
#	HTWK-Leipzig, Fakultaet IMN
#	klingt.net@googlemail.com
#
# @ supresses command output
#
# conditionals are not allowed to have a starting tab, 
# otherwise they will be sent to the shell
DEBUG='true'
.PHONY : clearscr clean screen print

all: screen print
	@echo "Trying to build this bloody piece of ... :)"	

screen:
	@echo "Building screen version ..."
ifeq ($(DEBUG) , 'true')
	xelatex thesis			
	biber thesis			
	makeglossaries thesis	
	xelatex thesis			
else
	@xelatex thesis > /dev/null			
	@biber thesis > /dev/null			
	@makeglossaries thesis > /dev/null	
	@xelatex thesis > /dev/null			
endif

print:
	@echo "Building print version ..."
ifeq ($(DEBUG) , 'true')
	xelatex thesis_print		
	biber thesis_print		
	makeglossaries thesis_print
	xelatex thesis_print		
else
	@xelatex thesis_print > /dev/null			
	@biber thesis_print > /dev/null			
	@makeglossaries thesis_print > /dev/null	
	@xelatex thesis_print > /dev/null			
endif

clean:
	@echo "I will clean up this mess ..."
	@rm -f *.out *.nav *.snm *.toc *.log *.bcf *.bbl *.blg *.lof *.lot *.run.xml *.xdy *.glo *.glg *.gls *.idx *.ist *-blx.bib .*.bbl.swp
	@find . -name \*.aux  -type f -delete
	@find . -name \*.bbl  -type f -delete
	@find . -name \*.bak  -type f -delete
	@find . -name \*.blg  -type f -delete

clearscreen:
	clear
