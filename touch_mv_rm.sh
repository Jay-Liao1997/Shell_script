#!/bin/bash
#检查是否存在/qfedu/，若不存在则创建一个
[ ! -d /qfedu/ ] && mkdir /qfedu/
#定义一个随机生成10个字母的函数
function genLetters(){
    letters=qwertyuiopasdfghjklzxcvbnm
    name=
    for i in {1..10}
    do
        num=$[ $RANDOM%26 ]
        one_letters=${letters:$num:1} #变量切片
        name=$name$one_letters
    done
    echo $name
}

echo "正在创建文件..."
sleep 2

#开始创建文件
for j in {1..10}
do
    touch /qfedu/$(genLetters)_html
done
echo "文件创建完毕！结果如下："
ls /qfedu/          #直接展示第一步结果
sleep 5

echo "开始重命名文件...."
sleep 1


#开始重命名
for i in `ls /qfedu/*_html`
do
    mv $i ${i::-4}HTML  #变量切片
done
echo "重命名完毕！结果如下："
ls  /qfedu/          #直接展示第二步结果
sleep 5

echo "正在删除旧文件..."
sleep 1

#开始删除旧文件
for i in `ls /qfedu/*`
do
    for j in `ls /qfedu/*`
    do
        test $j -ot $i  
        result=`echo $?`   
        [ $result -eq 0 ]&& rm -rf $j && echo "已删除$j"
    done
done
echo "旧文件删除完毕！结果如下："
ls /qfedu/          #直接展示第三步结果