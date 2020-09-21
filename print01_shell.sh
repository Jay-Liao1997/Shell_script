#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-27 14:00
# * Filename      : print01_shell.sh
# * Description   : 
# * *******************************************************/

function printtest(){
	echo -n "Your choice is "
}

echo "Show me what you want."

case ${1} in
 "one")
	printtest ; echo ${1} | tr "[a-z]" "[A-Z]"
	;;
 "two")
	printtest ; echo ${1} | tr "[a-z]" "[A-Z]"
	;;
 "three")
	printtest ; echo ${1} | tr "[a-z]" "[A-Z]"
 	;;
 *)
	echo "I do not have your number."
	;;
esac
