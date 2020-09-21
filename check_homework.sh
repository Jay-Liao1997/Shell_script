#!/bin/bash
#作业命名格式为  名字的拼音.后缀

read -p "请输入你存放作业的目录路径（绝对路径）：" homework_path
read -p "请输入你存放花名册的文件位置（绝对路径）：" name_path

 ls -l $homework_path |awk -F "[ |.]" 'NR!=1{print $(NF-1)}' >/tmp/checked.txt
 awk '{if (NR==FNR){name[$1]++}else{if (name[$1]==""){print $2}}}' /tmp/checked.txt $name_path
