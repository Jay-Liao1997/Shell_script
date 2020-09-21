#使用while循环，打印出passwd文件中mail用户以上的内容，并且输出结束后打印“END”字样
while read users
do
    user_name=`echo ${users}|awk -F: '{print $1}'`
    user_ID=`echo ${users}|awk -F: '{print $3}'`
    [ "${user_name}" == "mail" ] && break
    echo "用户名：${user_name}    UID: ${user_ID}"
done < /etc/passwd
echo "END."
