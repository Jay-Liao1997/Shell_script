names=(许科侠 魏建辉 严逸波 林镜滨 郑俊林 万日清 蔡浩然 胡伶俐 焦秋博 李佳俊 孙李 王维军 魏字强 张达钧 谭凯成 谭文 刘泽宏 朱博 刘向阳 石文龙 成瑞 曾俊玉 凌远诚 吴志豪 杜列巧 刘名鑫 王戈阳 廖正杰 李庚泽 吴逸彪)

while [ "${ans}" != "quit" ]
do
    len=${#names[*]}
    num=$(($RANDOM * ${len} / 32767))
    echo ${names[${num}]}
    unset names[${num}]
    names=(${names[@]})#shell中删除数组的元素之后，是不会自动补位置的，只会把索引变为空，所以要执行此步对数组进行重排
    read -p "You can keyin \"quit\" to stop. Or press Enter to continue." ans
    if [ "${len}" == "1" ];then
        echo "========================"
        echo "All students were picked."
        break
    fi
done


