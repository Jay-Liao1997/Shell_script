#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-27 20:44
# * Filename      : new_sum_for.sh
# * Description   : 
# * *******************************************************/

sum=0

for ((i=1; i<=100; i=i+1))
do
	sum=$((${sum}+${i}))
done

echo "$sum"
