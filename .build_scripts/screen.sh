#!/bin/bash
#
# script for generating the print pdfs
# this script should be called from the Makefile in the document root
#
# check number of arguments with `$# -eq 0`
#

XELATEX_OPTS=-halt-on-error

if [ $# == 2 ]; then
    echo "Changing directory to: $1"
    cd $1
    if [ $2 = 'true' ]; then
        echo " ______"
        echo "|      |"
        echo "|      | Building"
        echo "|______| Screen version"
        echo "  /__\\ "
        echo -e "\n------------------ xelatex (#1) --------------------\n"     
        xelatex $XELATEX_OPTS -no-pdf thesis #|grep --ignore-case --extended-regex "info|warning|error|^\([A-Za-z0-9]*\)"
        echo -e "\n------------------- biber --------------------------\n" 
        biber $BIBER_OPTS thesis
        echo -e "\n--------------- makeglossaries ---------------------\n"         
        makeglossaries thesis
        echo -e "\n------------------ xelatex (#2) --------------------\n" 
        xelatex $XELATEX_OPTS thesis -no-pdf | grep --ignore-case --extended-regex "info|Reference|warning|error|^\([A-Za-z0-9]*\)"
        echo -e "\n------------------ xelatex (#3) --------------------\n" 
        xelatex $XELATEX_OPTS thesis | grep --ignore-case --extended-regex "info|Reference|warning|error|^\([A-Za-z0-9]*\)"
        true
    else
        xelatex $XELATEX_OPTS -no-pdf thesis > /dev/null  
        biber $BIBER_OPTS thesis > /dev/null          
        makeglossaries thesis > /dev/null   
        xelatex $XELATEX_OPTS thesis > /dev/null
        true
    fi
else
    echo "Number of arguments given: $#"
    echo "Usage: ./screen.sh path_to_build_dir [true/false]"
fi
