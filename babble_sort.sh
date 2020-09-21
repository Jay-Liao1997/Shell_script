#!/bin/bash
#/**********************************************************
# * Author        : 
# * Email         : 
# * Last modified : 2020-08-05 14:50
# * Filename      : babble_sort.sh
# * Description   :
# * *******************************************************/

numbers=(6 8 10 3 4 5 99 5)
len=${#numbers[@]}
len=$[ $len-1 ]
for i in `seq 0 $len`
do
    newlen=$[ $len-$i ]
    for j in `seq 0 $newlen`
    do
        k=$[ $j+1 ]
        if [[ ${numbers[$j]} -lt ${numbers[$k]} ]];
        then
            tmp=${numbers[${k}]}
            numbers[${k}]=${numbers[${j}]}
            numbers[${j}]=$tmp
        fi
    done
done

echo ${numbers[*]}


99 10 8 6 5 5 4 3
