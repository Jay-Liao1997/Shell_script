#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-21 20:52
# * Filename      : if_then.sh
# * Description   : This program shows how if_then sentence works. 
# * *******************************************************/

read -p "Please input (Y?N):" anws
if [ "${anws}" = "Y" ] || [ "${anws}" = "y" ];then
	echo "You are a Yes!"
	exit 0
fi
if [ "${anws}" = "N" ] || [ "${anws}" = "n" ];then
	echo "Oh,you are a no!"
fi
