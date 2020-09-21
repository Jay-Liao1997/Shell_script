#!/bin/bash
math(){
        read -p "请输入第一个数字：" num1
        read -p "请输入第二个数字：" num2
        let result=num1+num2
        echo $result
       
}
math
while true;do
    
    read -p "是否要继续输入？Y|N" ans
    if [ $ans == "Y" ] || [ $ans == "y" ];then
        math
    elif [ $ans == "N" ] || [ $ans == "n" ];then
        break
    else
        echo "输入无法识别！"
        break
    fi
done