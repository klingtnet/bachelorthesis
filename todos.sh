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

if [ -f ~/bin/ack-grep ]; then
	echo "using ack-grep"
	echo "--------------------------------------------"
	if [ $# == 0 ]; then
		ack-grep --ignore-file=is:todos.sh --ignore-case --sort-files "todo:"
	elif [ $# -gt 1 ]; then
		echo "usage: ./todos.sh search_keyword"
	else
		ack-grep --sort-files --ignore-file=is:todos.sh --ignore-case $1
	fi
else 
	echo "using grep"
	echo "--------------------------------------------"
	if [ $# == 0 ]; then
		grep -iRnH --exclude=todos.sh 'todo:'
	elif [ $# -gt 1 ]; then
		echo "usage: ./todos.sh search_keyword"
	else
		grep -iRnH $1 *
	fi
fi
echo "--------------------------------------------"