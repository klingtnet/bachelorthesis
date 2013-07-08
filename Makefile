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
#
DEBUG='true'
ROOT_DIR=$(shell pwd)
BUILD_DIR=$(ROOT_DIR)/.build
OUTPUT_DIR=$(ROOT_DIR)/output
#.PHONY : clearscr clean screen print

all: copy_sources screen print copy_output

copy_sources:
	@echo "Copying sources to build folder: $(BUILD_DIR)"
	@rsync --verbose --checksum --recursive --human-readable --progress --exclude=.build --exclude=.build_scripts --exclude=output --exclude=.git --exclude=.gitignore $(ROOT_DIR)/ $(ROOT_DIR)/.build

copy_output:
	@echo "Copying generated PDFs to output folder: $(OUTPUT_DIR)"
	@cp -f $(BUILD_DIR)/*.pdf $(OUTPUT_DIR)

screen:
	@echo "Building screen version ..."
ifeq ($(DEBUG) , 'true')
	.build_scripts/screen.sh $(BUILD_DIR) $(DEBUG) 
else
	.build_scripts/screen.sh $(BUILD_DIR) $(DEBUG)
endif

print:
	@echo "Building print version ..."
ifeq ($(DEBUG) , 'true')
	.build_scripts/print.sh $(BUILD_DIR) $(DEBUG) 		
else
	.build_scripts/print.sh $(BUILD_DIR) $(DEBUG)
endif

clean_conflicts:
	@find $(ROOT_DIR) -name '*in Konflikt stehende*' -delete
	@find $(ROOT_DIR) -name '*conflicted copy*' -delete

clean: clean_conflicts
	@echo "I will clean up this mess ..."
	@cd $(BUILD_DIR); rm -r *

clean_all: clean
	@cd rm $(OUTPUT_DIR)/*

clearscreen:
	clear

# remove the following commands, if the build was started in the BUILD_DIR successfully
#	@rm -f *.out *.nav *.snm *.toc *.log *.bcf *.bbl *.blg *.lof *.lol *.lot *.run.xml *.xdy *.glo *.glg *.gls *.idx *.ist *-blx.bib .*.bbl.swp *.mtc* *.maf
#	@find . -name \*.aux  -type f -delete
#	@find . -name \*.bbl  -type f -delete
#	@find . -name \*.bak  -type f -delete
#	@find . -name \*.blg  -type f -delete
#	@find . -name \*.fls  -type f -delete
#	@find . -name \*.fdb_latexmk  -type f -delete
#	@find . -name \*.vsdx  -type f -delete
#	@find $(ROOT_DIR) -name '*in Konflikt stehende*' -delete
