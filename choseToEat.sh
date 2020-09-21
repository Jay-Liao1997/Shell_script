
#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-28 09:42
# * Filename      : choseToEat.sh
# * Description   : 
# * *******************************************************/

eat[1]="賣噹噹漢堡"
eat[2]="肯爺爺炸雞"
eat[3]="彩虹日式便當"
eat[4]="越油越好吃大雅"
eat[5]="想不出吃啥學餐"
eat[6]="太師父便當"
eat[7]="池上便當"
eat[8]="懷念火車便當"
eat[9]="一起吃泡麵"
eatnum=9
num=0
while [ "${num}" -lt 1 ]
do
	for i in {1..3}
	do
	
		result=$((${RANDOM} * ${eatnum} / 32767 + 1))
		resulteat[$i]="${eat[${result}]}"
	#	echo "${resulteat[$i]}"
	#	echo "${eat[$i]}"
	done

	if [ "${resulteat[1]}" != "${resulteat[2]}" -a "${resulteat[1]}" != "${resulteat[3]}" -a "${resulteat[2]}" != "${resulteat[3]}" ];then
		echo "${resulteat[1]}"
		echo "${resulteat[2]}"
		echo "${resulteat[3]}"
		num=$((${num}+1))
	fi
done
