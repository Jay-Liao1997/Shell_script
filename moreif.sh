#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-23 20:18
# * Filename      : moreif.sh
# * Description   : We test elif. 
# * *******************************************************/

read -p "Do you wanna be tiga? (Y/N)"  choice
if [ ${choice} = "Y" ]  || [ ${choice} = "y" ];then
	echo "Please show me what you get."
elif [ ${choice} = "N" ] || [ ${choice} = "n" ];then
	echo "Alright,bye."
else
	echo "What are you talking about?"
fi
