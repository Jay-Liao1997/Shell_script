numbers=(6 8 10 3 4 5 99 5)
len=${#numbers[@]}
i=0
while [ $i -lt $len ]
do
    j=0
    while [ $j -lt $len ]
    do
         if [ ${numbers[$i]} -lt ${numbers[$j]} ];then
         tmp=${numbers[$j]}
         numbers[$j]=${numbers[$i]}
         numbers[$i]=$tmp
         fi
         let j++
    done
    let i++
done
echo ${numbers[*]}



3 4 5 5 6 8 10 99
