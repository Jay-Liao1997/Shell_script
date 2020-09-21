#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-27 19:02
# * Filename      : for01.sh
# * Description   : 
# * *******************************************************/
i=1
for annimal in cat dog lion tiger chicken
do
	echo "$annimal is NO.$i."
	i=$(($i+1))
done
