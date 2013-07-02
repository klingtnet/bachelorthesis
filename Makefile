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

screen:
	@echo "Building screen version ..."
ifeq ($(DEBUG) , 'true')
	@echo "\n------------------ xelatex --------------------\n"		
	@xelatex thesis | grep --ignore-case warning
	@echo "\n------------------- biber ---------------------\n"	
	@biber thesis
	@echo "\n--------------- makeglossaries ----------------\n"			
	@makeglossaries thesis
	@echo "\n------------------ xelatex --------------------\n"	
	@xelatex thesis | grep --ignore-case warning		
else
	@xelatex thesis > /dev/null	
	@biber thesis > /dev/null			
	@makeglossaries thesis > /dev/null	
	@xelatex thesis > /dev/null			
endif

print:
	@echo "Building print version ..."
ifeq ($(DEBUG) , 'true')
	@echo "\n------------------ xelatex --------------------\n"	
	@xelatex thesis_print | grep --ignore-case warning
	@echo "\n------------------- biber ---------------------\n"		
	@biber thesis_print		
	@echo "\n--------------- makeglossaries ----------------\n"	
	@makeglossaries thesis_print
	@echo "\n------------------ xelatex --------------------\n"		
	@xelatex thesis_print | grep --ignore-case warning		
else
	@xelatex thesis_print > /dev/null			
	@biber thesis_print > /dev/null			
	@makeglossaries thesis_print > /dev/null	
	@xelatex thesis_print > /dev/null			
endif

clean:
	@echo "I will clean up this mess ..."
	@rm -f *.out *.nav *.snm *.toc *.log *.bcf *.bbl *.blg *.lof *.lol *.lot *.run.xml *.xdy *.glo *.glg *.gls *.idx *.ist *-blx.bib .*.bbl.swp *.mtc* *.maf
	@find . -name \*.aux  -type f -delete
	@find . -name \*.bbl  -type f -delete
	@find . -name \*.bak  -type f -delete
	@find . -name \*.blg  -type f -delete
	@find . -name \*.fls  -type f -delete
	@find . -name \*.fdb_latexmk  -type f -delete
	@find . -name \*.vsdx  -type f -delete
	@find `pwd` -name '*in Konflikt stehende*' -delete

clearscreen:
	clear
