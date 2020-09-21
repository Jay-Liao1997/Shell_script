#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-27 19:30
# * Filename      : perm_dir.sh
# * Description   : 
# * *******************************************************/
function question() {
		echo
		echo "NEXT!!"
		echo " If you want to quit,keyin quit."
		read -p "Do you want to quit?" ans
		if [ "$ans" != "quit" ]; then
			read -p "Please keyin a diretory name.(Use absolute path)" dpath
		fi
}

read -p "Please keyin a diretory name.(Use absolute path)" dpath
/usr/bin/file ${dpath} &> /dev/null && result=0 || result=1
#echo "$result"
while [ "${ans}" != "quit" ]
do
	if [ "${result}" == "0" ];then
		echo
		ls -l ${dpath} 2> /dev/null || echo "no such diretory."
		question
	fi
done
