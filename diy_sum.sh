#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-27 18:52
# * Filename      : diy_sum.sh
# * Description   : 
# * *******************************************************/

read -p "Please enter a number. I will caculate 1+...+number for you." number

i=0
sum=0
while [ "$i" != "${number}" ]
do
    i=$(($i+1))
    sum=$(($sum+$i))
done
echo "1+...+${number} is $sum"
