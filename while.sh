#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-27 14:27
# * Filename      : while.sh
# * Description   : 
# * *******************************************************/

#while [ "${inn}" != "yes" -a "${inn}" != "YES" ]
#do
#	read -p "Please input yes/YES to stop this program:" inn
#done
#echo "OK! Right!"


read -p "If you do not want to stop this loop,input yes/YES." inn
while [ "${inn}" = "yes" -o "${inn}" = "YES" ]
do
#	echo "Over!"

	read -p "If you do not want to stop this loop,input yes/YES." inn
done
echo "OVER!"
