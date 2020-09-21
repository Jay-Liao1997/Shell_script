#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-08-03 19:23
# * Filename      : flowerNum.sh
# * Description   : Find the daffodil numbers between 100 and 999
# * *******************************************************/

for i in `seq 100 999`
do
    first_num=${i:0:1}
    second_num=${i:1:1}
    third_num=${i:2:1}
    result=`$[ $first_num**3+$second_num**3+$third_num**3 ]`
    [ $result -eq $i ] && echo "$i"
done
