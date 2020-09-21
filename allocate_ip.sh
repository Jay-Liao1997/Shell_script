#!/bin/bash
names=(许科侠 魏建辉 严逸波 林镜滨 郑俊林 万日清 蔡浩然 胡伶俐 孙李 王维军 魏字强 张达钧 谭凯成 谭文 刘泽宏 朱博 刘向阳 石文龙 成瑞 曾俊玉 凌远诚 吴志豪 杜列巧 刘名鑫 王戈阳 廖正杰 李庚泽 吴逸彪)

len=$[ ${#names[*]}-1 ]
begin=2
[ -z $1 ] && echo "请在执行脚本时输入参数。" && exit
[ $1 -gt 7 -o $1 -lt 1 ] && echo "您输入的数无法完成IP分配，请输入1-7以完成分配。" && exit
for i in `seq 0 $len`
do
    end=$[ $begin+$1 ]
    echo -e "${names[$i]} \t获得的IP范围是 \t10.3.134.$begin~$end"
    let begin=$1+$begin+1
done