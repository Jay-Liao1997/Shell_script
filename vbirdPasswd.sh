#我们知道/etc/passwd 里面以: 来分隔，第一栏为帐号名称。请写一只程式，可以将/etc/passwd 的第一栏取出，而且每一栏都以一行字串『The 1 account is "root" 』来显示，那个1 表示行数。
i=1
while [ ${i} -le `cat /etc/passwd | wc -l` ];
do
    name=`cat /etc/passwd | sed -n "${i}p" | awk -F: '{ print $1 }'`
    echo "第${i}个名字是：${name}"
    let i++
done


