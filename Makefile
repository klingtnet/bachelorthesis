#
# Makefile for Bachelorthesis
#
#	Andreas Linz -- 10INB-T
#	HTWK-Leipzig, Fakultaet IMN
#	klingt.net@googlemail.com
#
# @ supresses command output
#

all:
	@echo "Trying to build this bloody piece of ... :)"	
	@xelatex thesis > /dev/null
	@biber thesis > /dev/null
	@makeglossaries thesis > /dev/null
	@xelatex thesis > /dev/null
	@xelatex thesis > /dev/null

clean:
	@echo "I will clean up this mess ..."
	@rm -f *.out *.nav *.snm *.toc *.log *.aux *.bcf *.bbl *.blg *.lof *.lot *.run.xml *.xdy *.glo
	@rm -f bibliography/*.bbl bibliography/*.bak bibliography/*.blg
	@rm -f frontpage/*.aux
	@rm -f header/*.aux
	@rm -f variables/*.aux
	@rm -f appendix/*.aux
