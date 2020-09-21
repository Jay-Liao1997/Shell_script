#!/bin/bash
PS3="学生名单管理系统（1-5）"
while true; do
    select choice in "添加学员名单" "获取学员名单" "随机点名" "删除某个学员的信息" "退出"; do
        case $choice in
            "添加学员名单")
                name(){
                    read -p "填写要添加的名字: " num1
                    if [ -f namelist.txt ];then
                        name1=`grep $num1 namelist.txt`
                    else
                        echo "正在键入信息请稍后..."
                        sleep 2
                        touch namelist.txt
                        name1=`grep $num1 namelist.txt`
                    fi

                    if [[ $num1 == $name1 ]];then
                        echo "该学员已经存在!"
                    else
                        echo $num1 >> namelist.txt
                        echo "学员添加成功!"
                    fi
                }
                name
                while true; do
                    read -p "是否继续添加Y|N: " num2
                    if [ $num2 == "Y" ] || [ $num2 == "y" ];then
                        name
                    elif [ $num2 == "N" ] || [ $num2 == "n" ];then
                        break
                    else
                        echo "你输入的字符有误，请输入Y|N."
                        break
                    fi
                done
                clear
                break
                ;;
            "获取学员名单")
                echo "即将为您获取学员名单，请稍后..."
                for i in `cat namelist.txt`;do
                    echo -n "$i "
                    sleep 1
                done
                echo
                echo -n "获取完成!   " 
                total=`cat namelist.txt |wc -l`
                echo "总共 $total 个学员!"
                break
                ;;
            "随机点名")
                while true;do
                    line=`cat namelist.txt |wc -l`
                    num3=$[RANDOM%line+1]
                    sed -n "${num3}p" namelist.txt
                    sleep 0.3
                    read -p "是否要返回学员管理系统y/n: " input
                    if [ $input  == "Y" ] || [ $input  == "y" ];then
                        echo "正在返回请稍后"
                        sleep 1
                        break
                    elif [ $input == "N" ] || [ $input == "n" ];then
                        echo "新的功能正在研发，敬请期待！"
                        sleep 2
                        break
                    else
                        echo "你输入的字符有误，请输入Y|N"
                        break
                    fi
                    done
                    clear
                    break 
                        ;;
            "删除某个学员的信息")
                    while true ;do
                        awk '{printf $1" "}END{print}' namelist.txt
                        read -p "请输入要删除的学员: " num4
                        flag=0
                        while read line
                        do
                            if [ $line == $num4 ];then
                                flag=1
                                sed -i "/${num4}/d" namelist.txt
                                echo "删除成功!"
                                break
                            fi
                        done < namelist.txt 
                        [ $flag -eq 0 ] && echo "这位同学不在名单中！" 
                        read -p "是否返回学生系统管理首页Y|N: " back
                        if [ $back == "y" ] || [ $back == "Y" ];then
                            echo "正在返回请稍后"
                            break
                        fi  
                    done
                    clear
                    break
                    ;;
            "退出")
                echo "感谢您使用学员管理系统！"
                exit
                ;;
             *)
                    echo "暂无此功能，敬请期待！" 
                    break
                    ;;
        esac
    done
done