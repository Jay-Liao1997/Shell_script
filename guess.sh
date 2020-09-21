num=$[ $RANDOM%100+1 ]
for ((i=5;i>=0;i--))
do
    read -p "Please tell me your number:" user_num
    if [[ $user_num =~ ^[0-9]+$ ]]
    then
        [ $user_num -eq $num ] && echo -e "\033[5mBingo!\033[0m" && break
        [ $user_num -lt $num ] && echo -e "The answer is \033[31mgreater\033[0m than yours."
        [ $user_num -gt $num ] && echo -e "The answer is \033[31mless\033[0m than yours."
    fi
    [[ $i -ne 0 ]] && echo -e "You still have \033[41;37m$i\033[0m chances"  || echo -e "\033[31mGame over!\033[0m The answer is \033[32m$num\033[0m. Be smarter next time!"
done


