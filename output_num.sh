#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-27 08:42
# * Filename      : output_num.sh
# * Description   : 
# * *******************************************************/

echo "I will show what you give!"
case ${1} in
 "one")
	echo "Your number is one"
	;;
 "two")
	echo "Your number is two"
	;;
 "23")
	echo "You are Lebron."
	;;
 *)
	echo "Please follow ${0}."
	;;
esac
