#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-23 20:30
# * Filename      : newhello.sh
# * Description   : 
# * *******************************************************/

if [ "${1}" == "hello" ]; then
	echo "Hello, how are you ?"
elif [ "${1}" == "" ]; then
	echo "You MUST input parameters, ex> {${0} someword}"
else
	echo "The only parameter is 'hello', ex> {${0} hello}"
fi
