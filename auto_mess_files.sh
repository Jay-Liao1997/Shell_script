#!/bin/bash
#脚本说明：请不要将此脚本放在需要整理的目录当中！否则会影响下次计划任务执行
#建议放在/root/下，如改变位置，请自行修改计划任务路径

echo "Warning：使用此脚本前请阅读《脚本说明》！"
read -p "请输入你要整理的目录（绝对路径）：" path
[ ! -d $path ] && echo "No such a directory." && exit

cd $path

mkdir `date +%F`

dir=`ls -lt | awk 'NR==2{print $NF}'`
for i in `ls $path`
do
    [ -d $i ] || mv $i $dir
done


=========================================================================
其实两条计划任务就可以实现。。。。

36 20 * * * /usr/bin/mkdir /root/`date +%F`
37 20 * * * /usr/bin/find /root/ -type f -exec mv {} /root/`date +%F` \;
这两句计划任务存在很大的问题；

1 %有特殊含义，需要转义，否则无法执行
2 这句find的命令没有限制maxdepth，执行之后会查找root下的所有文件，包括所有隐藏文件，一旦执行，非常危险；

改进：
10 09 * * * /usr/bin/mkdir /root/`date +\%F`
11 09 * * * /usr/bin/find /root/ -maxdepth 1 -type f|grep -v '/root/\.'|xargs -i  mv {} /root/`date +\%F`