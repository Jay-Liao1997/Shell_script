#!/bin/bash 
read -p "Pleas input your birthday (MMDD, ex> 0709): " bir 
now=`date +%m%d` 
if [ "$bir" == "$now" ]; then 
    echo "Happy Birthday to you!!!" 
elif [ "$bir" -gt "$now" ]; then 
    year=`date +%Y`
    bs=`date --date="${year}${bir}" +%s`
    ns=`date +%s`
    total_d=$(($((${bs}-${ns}))/60/60/24)) #将生日的月日，配上当前的年，以这个时间的秒数减去当前的秒数
    echo "Your birthday will be ${total_d} later" 
else 
    year=$((`date +%Y`+1)) 
    bs=`date --date="${year}${bir}" +%s`
    ns=`date +%s`
    total_d=$(($((${bs}-${ns}))/60/60/24)) 
    echo "Your birthday will be ${total_d} later" 
fi
