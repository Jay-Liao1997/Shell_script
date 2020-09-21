#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-23 20:33
# * Filename      : port.sh
# * Description   : 
# * *******************************************************/
# 1. 先作一些告知的动作而已～
echo "Now, I will detect your Linux server's services!"
echo -e "The www, ftp, ssh, and mail(smtp) will be detected! \n"

# 2. 开始进行一些测试的工作，并且也输出一些资讯啰！
testfile=/dev/shm/netstat_checking.txt
netstat -tuln > ${testfile}           #先转存资料到记忆体当中！不用一直执行netstat 
testing=$(grep ":80 " ${testfile})    #侦测看port 80在否？
if [ "${testing}" != "" ]; then
	echo "WWW is running in your system."
fi
testing=$(grep ":22 " ${testfile})    #侦测看port 22在否？
if [ "${testing}" != "" ]; then
	echo "SSH is running in your system."
fi
testing=$(grep ":21 " ${testfile})    #侦测看port 21在否？
if [ "${testing}" != "" ]; then
	echo "FTP is running in your system."
fi
testing=$(grep ":25 " ${testfile})    #侦测看port 25在否？
if [ "${testing}" != "" ]; then
	echo "Mail is running in your system."
fi
