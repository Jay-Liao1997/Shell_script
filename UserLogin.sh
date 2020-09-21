read -p "Please tell me your username: " user_name
read -p "Please tell me your password: " pass_word
tom=$(cut -d ':' -f 1 /tmp/userinfo.txt |sed -n '1p')
tom_passwd=$(cut -d ':' -f 2 /tmp/userinfo.txt |sed -n '1p')
jerry=$(cut -d ':' -f 1 /tmp/userinfo.txt |sed -n '2p')
jerry_passwd=$(cut -d ':' -f 2 /tmp/userinfo.txt |sed -n '2p')

case ${user_name},${pass_word} in
${tom},${tom_passwd})
    echo "You are Tom,welcome to Linux!"
    ;;
${jerry},${jerry_passwd})
    echo "You are jerry,welcome to Linux!"
    ;;
*)
    echo "Username or Password incorrect!"
    ;;
esac