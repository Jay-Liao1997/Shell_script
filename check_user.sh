#!/bin/bash
#/**********************************************************
# * Author        : Jay-L
# * Email         : 1046250579@126.com
# * Last modified : 2020-07-27 19:07
# * Filename      : check_user.sh
# * Description   : 
# * *******************************************************/
#
#方法一
for user in `compgen -u`
do
	echo "`id $user`"
done

#方法二

echo "===================================="
echo

users=$(cut -d ':' -f1 /etc/passwd)
for username in ${users}
do
	id ${username}
done
