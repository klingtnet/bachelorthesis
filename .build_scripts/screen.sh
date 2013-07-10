#!/bin/bash
#
# script for generating the print pdfs
# this script should be called from the Makefile in the document root
#
# check number of arguments with `$# -eq 0`
#

if [ $# == 2 ]; then
    echo "Changing directory to: $1"
    cd $1
    if [ $2 = 'true' ]; then
        echo "12345: $XELATEX_OPTS"
        echo -e "\n------------------ xelatex --------------------\n"     
        xelatex $XELATEX_OPTS thesis #|grep --ignore-case --extended-regex "info|warning|error|^\([A-Za-z0-9]*\)"
        echo -e "\n------------------- biber ---------------------\n" 
        biber $BIBER_OPTS thesis
        echo -e "\n--------------- makeglossaries ----------------\n"         
        makeglossaries thesis
        echo -e "\n------------------ xelatex --------------------\n" 
        xelatex $XELATEX_OPTS thesis > /dev/null
    else
        xelatex $XELATEX_OPTS thesis > /dev/null  
        biber $BIBER_OPTS thesis > /dev/null          
        makeglossaries thesis > /dev/null   
        xelatex $XELATEX_OPTS thesis > /dev/null
    fi
else
    echo "Number of arguments given: $#"
    echo "Usage: ./screen.sh path_to_build_dir [true/false]"
fi
