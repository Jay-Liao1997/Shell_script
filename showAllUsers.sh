for usernames in `awk -F: '{print $1}' /etc/passwd`;
do
    user_id=`id -u ${usernames}`
    echo -e "\033[33mUsername: ${usernames}\033[0m  UserID: ${user_id}"
done