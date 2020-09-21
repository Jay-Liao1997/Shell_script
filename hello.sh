#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-23 20:24
# * Filename      : hello.sh
# * Description   : How about say hello to me ? 
# * *******************************************************/

read -p "Say hello to me!!!!!" hi
if [ ${hi} = "hello" ] || [${hi} = "Hello" ];then
	echo "How are you?"
elif [ ${hi} = "" ];then
	echo "Please say hello to me..."
else
	echo "YOU HAVE TO SAY HELLO TO ME!!!!"
fi
