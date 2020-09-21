#撰写一支程式，他的作用是: 1.) 先查看一下/root/test/logical 这个名称是否存在； 2.) 若不存在，则建立一个档案，使用touch 来建立，建立完成后离开； 3 .) 如果存在的话，判断该名称是否为档案，若为档案则将之删除后建立一个目录，档名为logical ，之后离开； 4.) 如果存在的话，而且该名称为目录，则移除此目录

if [ -e /root/test/logical ];
then
    [ -f /root/test/logical ] && rm -rf /root/test/logical && mkdir /root/test/logical && exit 0
    [ -d /root/test/logical ] && rm -rf /root/test/logical
else
    touch /root/test/logical && exit 1
fi