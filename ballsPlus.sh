function genNumbers() {

     redballs=({1..33})
     blueballs=({1..16})

     while :;
     do
        [ ${#redballs[@]} -eq 27 ] && break
        rindex=$[ $RANDOM%33 ]
        [ -n "${redballs[${rindex}]}" ] && echo -ne "\033[31m${redballs[${rindex}]}\033[0m  " && unset redballs[${rindex}]
     done


     bindex=$[ $RANDOM%16 ]
     echo -e "\033[34m${blueballs[$bindex]}\033[0m"

 }

customers=($(genNumbers))
backGround=($(genNumbers))
echo "${customers[*]}"
echo "${backGround[*]}"

# customers=(1 2 3 4 5 6 7)
# backGround=(1 2 3 4 5 6 7)

if [[ ${customers[6]} == ${backGround[6]} ]]; #判断两边都是参数，要用双[]
then
    i=0
    flag=0

    while [ $i -le 5 ]
    do
        j=0
        while [ $j -le 5 ]
        do 
            c=${customers[${i}]}
            b=${backGround[${j}]}
            [[ "$c" == "$b" ]] && let flag++
            let j++
        done
        let i++
    done

    [ $flag -le 2 ] && echo "恭喜你！你中了六等奖，奖金 5元  ！"
    [ $flag -eq 3 ] && echo "恭喜你！你中了五等奖，奖金 10元  ！"
    [ $flag -eq 4 ] && echo "恭喜你！你中了四等奖，奖金 200元  ！"
    [ $flag -eq 5 ] && echo "恭喜你！你中了三等奖，奖金 3000元  ！"
    [ $flag -eq 6 ] && echo "恭喜你！！！！！！！！！！你中了一等奖，奖金 500万元  ！"
else
    i=0
    flag=0

    while [ $i -le 5 ]
    do
        j=0
        while [ $j -le 5 ]
        do
            c=${customers[${i}]}
            b=${backGround[${j}]}
            [[ "$c" == "$b" ]] && let flag++
            let j++
        done
        let i++
    done

    [ $flag -le 3 ] && echo "很遗憾！你没有中奖！！"
    [ $flag -eq 4 ] && echo "恭喜你！你中了五等奖，奖金 10元  ！"
    [ $flag -eq 5 ] && echo "恭喜你！你中了四等奖，奖金 200元  ！"
    [ $flag -eq 6 ] && echo "恭喜你！你中了二等奖，奖金 300万元  ！"
fi


#循环进行，看看什么时候才能中500万
#!/bin/bash
i=1
starttime=`date +%s`
while :;
do
        ballss=`balls` #前提是要将双色球的脚本提升为环境变量才能直接执行
        result=`echo $ballss | sed -nr '/500/p'`
        echo "$i"
        let i++
        [ -n "$result" ] && echo "$ballss"  &&  break
done
endtime=`date +%s`
usetime=$[ $endtime-$starttime ]
echo "总耗时：$usetime s"

