#!/bin/bash
#
# script for generating the print pdfs
# this script should be called from the Makefile in the document root
#
# check number of arguments with `$# -eq 0`
#

XELATEX_OPTS=''
BIBER_OPTS=''

if [ $# == 2 ]; then
    echo "Changing directory to: $1"
    cd $1
    if [ $2 = 'true' ]; then
        echo -e "\n------------------ xelatex --------------------\n"     
        xelatex thesis_print $(XELATEX_OPTS) | grep --ignore-case warning
        echo -e "\n------------------- biber ---------------------\n" 
        biber thesis_print $(BIBER_OPTS)
        echo -e "\n--------------- makeglossaries ----------------\n"         
        makeglossaries thesis_print
        echo -e "\n------------------ xelatex --------------------\n" 
        xelatex thesis_print $(XELATEX_OPTS) | grep --ignore-case warning 
    else
        xelatex thesis_print $(XELATEX_OPTS) > /dev/null  
        biber thesis_print $(BIBER_OPTS) > /dev/null          
        makeglossaries thesis_print > /dev/null   
        xelatex thesis_print $(XELATEX_OPTS) > /dev/null
    fi
else
    echo "Number of arguments given: $#"
    echo "Usage: ./screen.sh path_to_build_dir [true/false]"
fi
