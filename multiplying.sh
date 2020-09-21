#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-21 20:05
# * Filename      : multiplying.sh
# * Description   : User input 2 integer numbers;program will cross these two numbers. 
# * *******************************************************/

echo -e "You SHOULD input 2 numbers, I will multiplying them! \n"
read -p "first number : " firstnu
read -p "first number : " secnu
total=$((${firstnu}*${secnu}))
echo -e "\n The result is ${total}"
