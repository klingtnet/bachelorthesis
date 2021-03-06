#!/bin/bash
#
# script for generating the print pdfs
# this script should be called from the Makefile in the document root
#
# check number of arguments with `$# -eq 0`
#

XELATEX_OPTS=-halt-on-error
#PRETTY_PRINT=pplatex -v -i -
PRETTY_PRINT='grep --ignore-case --extended-regex "info|Reference|warning|error|^\([A-Za-z0-9]*\)"'

if [ $# == 2 ]; then
    echo "Changing directory to: $1"
    cd $1
    if [ $2 = 'true' ]; then
        echo " _ _"
        echo "| |_\\"
        echo "|    | Building"
        echo "|    | Print version"
        echo "|____|"
        echo -e "\n------------------ xelatex (#1) --------------------\n"     
        xelatex $XELATEX_OPTS -no-pdf thesis_print > /dev/null
        echo -e "\n------------------- biber ---------------------\n" 
        biber $BIBER_OPTS thesis_print  
        echo -e "\n--------------- makeglossaries ----------------\n"         
        makeglossaries thesis_print
        echo -e "\n------------------ xelatex (#2) --------------------\n" 
        xelatex $XELATEX_OPTS thesis_print -no-pdf > /dev/null
        echo -e "\n------------------ xelatex (#3) --------------------\n" 
        xelatex $XELATEX_OPTS thesis_print
        true
    else
        xelatex $XELATEX_OPTS -no-pdf thesis_print > /dev/null  
        biber $BIBER_OPTS thesis_print > /dev/null          
        makeglossaries thesis_print > /dev/null   
        xelatex $XELATEX_OPTS thesis_print > /dev/null
        true
    fi
else
    echo "Number of arguments given: $#"
    echo "Usage: ./screen.sh path_to_build_dir [true/false]"
fi
