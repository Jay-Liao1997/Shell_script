#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-27 18:48
# * Filename      : sum.sh
# * Description   : 
# * *******************************************************/

s=0
i=0
while [ "${i}" != "100" ]
do
    i=$(($i+1))
    s=$(($s+$i))
done
echo "sum=$s"
