#!/bin/bash
  2 #/**********************************************************
  3 # * Author        : Jay-L
  4 # * Email         : 1046250579@126.com
  5 # * Last modified : 2020-07-28 19:18
  6 # * Filename      : genArea.sh
  7 # * Description   :
  8 # * *******************************************************/

result=`df -Th|sed -n '6p'|awk '{print $6}'|tr -d "%"`

[ ${result} -le 50 ] && echo "分区空间充足" && exit 0
[ ${result} -gt 80 ] && echo "分区空间告急" && exit 2
echo "分区空间紧张" && exit 1
