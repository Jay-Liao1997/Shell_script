#!/bin/bash
echo "Choose the numbers!"
read -p "Made your User rock:0  scissors:1  paper:2 : " User


if [[ $User =~ [012] ]]; then
    computer=$[ $RANDOM%3 ]
    echo "User:$User ================ Computer:$computer"
    [ $User -eq $computer ] && echo "Tie!" && exit
    let User=($User+1)%3
    [ $User -eq $computer ] && echo "You win!" && exit
    echo "The computer wins!" && exit
fi
echo "You gotta follow my tips like rock:0  scissors:1  paper:2."  