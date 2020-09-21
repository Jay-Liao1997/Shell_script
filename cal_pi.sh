#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-21 20:18
# * Filename      : cal_pi.sh
# * Description   : User input a scale number to calculate pi number. 
# * *******************************************************/

echo -e "This program will calculate pi value. \n"
echo -e "You should input a float number to calculate pi value.\n"
read -p "The scale number (10~10000)?" checking
num=${checking:-"10"}
echo -e "Staring calculate pi value. Be patient."
time echo "scale=${num};4*a(1)" | bc -lq  
#4*a(1) 是bc 主动提供的一个计算pi 的函数，至于scale 就是要bc 计算几个小数点下位数的意思。当scale 的数值越大， 代表pi 要被计算的越精确
