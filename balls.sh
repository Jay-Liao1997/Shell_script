redballs=({1..33})#红球
blueballs=({1..16}})#蓝球
result=()#定义一个装摇出来的红球的数组
i=0 #做辅助用，做装红球的索引
while [ ${#result[*]} -lt 6 ]#只要装红球的数组小于6个，就进行循环
do
    redlen=${#redballs[*]}#原红球数组的的长度
    num=$(($RANDOM * ${redlen} / 32767 ))#生成一个0-32之间的随机数
    result[${i}]=${redballs[${num}]}#往装红球的数组里面装红球
    let i++#装一个，加一
    unset redballs[${num}]#不能出现重复的球，被选出来之后就要删除掉
    redballs=(${redballs[@]})#shell的数组元素不会自动排位，要手动进行重新排位，否则删除后就会出现是空值的索引
done
if [ ${#result[*]} -eq 6 ];then #装好红球后开始摇蓝球
        bluelen=${#blueballs[*]} #获取蓝球数组的数组长度
        num=$(($RANDOM * ${bluelen} / 32767))#产生0-15的随机数
        bluenum=${blueballs[${num}]}#抓出蓝球
fi

echo -e "\033[31m${result[*]}\033[0m \c" #遍历红球数组，并显示红色
echo -e "\033[34m${bluenum}\033[0m"#显示蓝球，蓝色

    

#生成红球的简易方法
#!/bin/bash
balls=({1..33})
for i in ${balls[*]}
do
        echo "$[$RANDOM] $i"
done|sort -n|head -6|awk '{print $2}'