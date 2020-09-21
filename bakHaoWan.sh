#将/haowan目录中所有文件（除了abc.txt外）重命名为.bak结尾
ls /haowan/> /tmp/haowan.txt
while read filename
do
    [ "${filename}" == "abc.txt" ] && continue
    mv /haowan/${filename} /haowan/${filename}.bak
done < /tmp/haowan.txt

以上的脚本还存在漏洞，如果/haowan下存在含有空格的文件名，那么在执行时将会产生歧义
(实际上，只要在重命名文件时，给文件名加上双引号即可解决这个问题)
可以创建一个含空格的文件试试  touch a\ b.txt

将以上脚本做修改：

cd /haowan
for filename in *
do
    [ "${filename}" == "abc.txt" ] && continue
    mv /haowan/"${filename}" /haowan/"${filename}.bak"
done
