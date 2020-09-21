#使用while循环。打印用户名及UID，但不要输出mail用户及其UID
while read users
do

    user_name=`echo ${users}|awk -F: '{print $1}'`
    user_ID=`echo ${users}|awk -F: '{print $3}'`
    [ "${user_name}" == "mail" ] && continue
    echo "用户名：${user_name}    UID: ${user_ID}"
done < /etc/passwd