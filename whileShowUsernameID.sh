while read line
do
    username=`echo ${line} | awk -F: '{print $1}'`
    userID=`echo ${line} | awk -F: '{print $3}'`
    userGID=`echo ${line} | awk -F: '{print $4}'`
    echo "Username: $username    UserID: $userID    UserGID: $userGID"
done < /etc/passwd