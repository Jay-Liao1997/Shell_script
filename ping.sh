#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-27 19:15
# * Filename      : ping.sh
# * Description   : 
# * *******************************************************/

ipp="192.168.186"
for num in $(seq 1 5)
do
	ping -c 2 -i 0.02 ${ipp}.${num} &> /dev/null && result=0 || result=1
	if [ "${result}" == 0 ]; then
		echo "Server ${ipp}.${num} is UP."
	else
		echo "Server ${ipp}.${num} is DOWN."
	fi
done
