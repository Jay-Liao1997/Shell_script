#!/bin/bash

for i in {1..9};do
    for j in `seq $i`;do
        echo -n "$i"
    done
    echo
done

for i in {1..5};do
    let i=i-1
    for j in `seq $i`;do
        echo -n "|  "
    done
    echo "|__"
done

flag1=0
flag2=0
while true;do
    if [ $flag1 -lt 5 ] && [ $flag2 -eq 0 ];then
        let flag1++
        for i in `seq $flag1`;do
            echo -n "*"
        done
        echo
    else
        flag2=1
        for i in `seq $flag1`;do
            echo -n "*"
        done
        let flag1--
        echo
        [ $flag1 -eq 0 ] && break 
    fi
done