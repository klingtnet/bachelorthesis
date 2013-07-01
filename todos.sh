#!/bin/bash

#
# This shell script searches for every occur of the first command line argument in any file in the current- and their subdirectories.
#
# Andreas Linz
# admin@klingt.net
# http://www.klingt.net
#

# -R recursive
# -n prefix with line number
# -i ignore Case
# -H print filename
clear
if [ $# == 0 ]
	then grep -iRnH --exclude=todos.sh 'todo:'
elif [ $# -gt 1 ]
	then echo "usage: ./todos.sh search_keyword"
else
	grep -iRnH $1 *
fi
