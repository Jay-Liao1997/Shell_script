编写脚本:提示用户输入用户名和密码,脚本自动创建相应的账户及配置密码。如果用户
不输入账户名,则提示必须输入账户名并退出脚本;如果用户不输入密码,则统一使用默
认的 123456 作为默认密码。

echo "I will add a user for you."
echo
read -p "Please input your username: " username
defaultpw="123456"
[[ "$username" =~ ^[0-9] ]] && echo "You can not use number for username." && exit
[ -z "$username" ] && echo "You must give me a username" && exit
read -p "Please input your password: " -s passwd  #用户输入的密码不会显示在屏幕上
[ -z "$passwd" ] && echo "I will use default password for you.(default:123456)" && useradd $username && echo $defaultpw|passwd --stdin $username && exit

useradd $username
echo $passwd|passwd --stdin $username
===========================================================================

依次提示用户输入 3 个整数,脚本根据数字大小依次排序输出 3 个数字
read -p "Please input the first number: " num1
read -p "Please input the second number: " num2
read -p "Please input the third number: " num3
expr $num1 - $num2 - $num3 &> /dev/null
result=`echo $?`
if [ $result -eq 0 ];
then
    number=($num1 $num2 $num3)

    for ((i=0;i<=2;i++))
    do
        k=$[ 2-$i ]
        for ((j=0;j<=$k;j++))
        do
            f=$[ $j+1 ]
            if [[ ${number[${j}]} -lt ${number[${f}]} ]];
            then
                tmp=${number[$j]}
                number[$j]=${number[${f}]}
                number[${f}]=$tmp
            fi
        done
    done
echo ${number[*]} && exit
fi
echo "You didn't give me three numbers."
============================================================================
编写脚本,实现人机<石头,剪刀,布>游戏


echo "Choice the numbers!"
read -p "Made your choice rock:1  paper:2  scissors:3 : " Choice



if [[ $Choice =~ [123] ]]; 
then
    computer=$[ $RANDOM%3+1 ]
    if [ $Choice -ne $computer ];
    then
        if [ $Choice -eq 1 ];
        then
            [ $computer -eq 3 ] && echo "Computer is scissors. YOU WIN!" && exit || echo "Computer is paper. YOU LOSE!" && exit
        fi

        if [ $Choice -eq 2 ];
        then
            [ $computer -eq 1 ] && echo "Computer is rock. YOU WIN!" && exit || echo "Computer is scissors. YOU LOSE!" && exit
        fi

        if [ $Choice -eq 3 ];
        then
            [ $computer -eq 2 ] && echo "Computer is paper. YOU WIN!" && exit || echo "Computer is rock. YOU LOSE!" && exit
        fi
    fi  
    echo "Tie!"
fi
echo "You gotta follow my tips like rock:1  paper:2  scissors:3."

=========================================================================================
自动优化 Linux 内核参数

#!/bin/bash   
#脚本针对 RHEL7 
cat >> /usr/lib/sysctl.d/00‐system.conf <<EOF 
fs.file‐max=65535 
net.ipv4.tcp_timestamps = 0 
net.ipv4.tcp_synack_retries = 5 
net.ipv4.tcp_syn_retries = 5 
net.ipv4.tcp_tw_recycle = 1 
net.ipv4.tcp_tw_reuse = 1 
net.ipv4.tcp_fin_timeout = 30 
#net.ipv4.tcp_keepalive_time = 120 
net.ipv4.ip_local_port_range = 1024  65535 
kernel.shmall = 2097152 
kernel.shmmax = 2147483648 
kernel.shmmni = 4096 
kernel.sem = 5010 641280 5010 128 
net.core.wmem_default=262144 
net.core.wmem_max=262144 
net.core.rmem_default=4194304 
net.core.rmem_max=4194304 
net.ipv4.tcp_fin_timeout = 10 
net.ipv4.tcp_keepalive_time = 30 
net.ipv4.tcp_window_scaling = 0 
net.ipv4.tcp_sack = 0 
EOF 
 
sysctl –p 
===============================================================================
切割 Nginx 日志文件(防止单个文件过大,后期处理很困难)


#mkdir  /data/scripts 
#vim   /data/scripts/nginx_log.sh  
#!/bin/bash 
logs_path="/usr/local/nginx/logs/" 
mv ${logs_path}access.log ${logs_path}access_$(date ‐d "yesterday" +"%Y%m%d").log 
kill ‐USR1  `cat /usr/local/nginx/logs/nginx.pid` 
#第二条命令的作用是发送kill -USR1信号给Nginx的主进程号，让Nginx重新生成一个新的日志文件。

 
# chmod +x  /data/scripts/nginx_log.sh 
#crontab  ‐e                    #脚本写完后,将脚本放入计划任务每天执行一次脚本 
0  1  *  *   *   /data/scripts/nginx_log.sh 

# -USR1是Nginx的一个信号，那么还有哪些信号呢，这些信号有什么作用呢？总结如下：
# 主进程可以处理以下的信号：

# TERM, INT	快速关闭
# QUIT	从容关闭
# HUP	重载配置
# 用新的配置开始新的工作进程
# 从容关闭旧的工作进程
# USR1	重新打开日志文件
# USR2	平滑升级可执行程序。
# WINCH	从容关闭工作进程
# 尽管你不必自己操作工作进程，但是，它们也支持一些信号：

# TERM, INT	快速关闭
# QUIT	从容关闭
# USR1	重新打开日志文件
====================================================================
检测 MySQL 数据库连接数量

#!/bin/bash 
#本脚本每 2 秒检测一次 MySQL 并发连接数,可以将本脚本设置为开机启动脚本,或在特定时间段执行 
#以满足对 MySQL 数据库的监控需求,查看 MySQL 连接是否正常 
#本案例中的用户名和密码需要根据实际情况修改后方可使用 
log_file=/var/log/mysql_count.log 
user=root 
passwd=123456 
while : 
do 
        sleep 2 
        count=`mysqladmin  ‐u  "$user"  -p  "$passwd"   status |  awk '{print $4}'` 
        echo "`date +%Y‐%m‐%d` 并发连接数为:$count" >> $log_file  
done
================================================================
根据 md5 校验码,检测文件是否被修改

#!/bin/bash 
#本示例脚本检测的是/etc 目录下所有的 conf 结尾的文件,根据实际情况,您可以修改为其他目录或文件 
#本脚本在目标数据没有被修改时执行一次,当怀疑数据被人篡改,再执行一次 
#将两次执行的结果做对比,MD5 码发生改变的文件,就是被人篡改的文件 
for  i  in  $(ls /etc/*.conf) 
do 
  md5sum "$i" >> /var/log/conf_file.log 
done 

# 可以前后生成两个文件，然后用diff命令进行对比，马上可以知道谁被修改了
# diff file1 file2
============================================================
检测 MySQL 服务是否存活

#!/bin/bash 
#host 为你需要检测的 MySQL 主机的 IP 地址,user 为 MySQL 账户名,passwd 为密码 
#这些信息需要根据实际情况修改后方可使用 
host=127.0.0.1 
user=root 
passwd=123456 
mysqladmin ‐h 127.0.0.1 ‐u root ‐p'$passwd'  ping  &>/dev/null 
if  [  $?  ‐eq  0  ];then 
       echo  "MySQL is UP" 
else 
       echo  "MySQL is down" 
fi 
===================================================================
备份 MySQL 的 shell 脚本(mysqldump 版本)

#!/bin/bash 
#定义变量 user(数据库用户名),passwd(数据库密码),date(备份的时间标签) 
#dbname(需要备份的数据库名称,根据实际需求需要修改该变量的值,默认备份 mysql 数据库) 
 
user=root 
passwd=123456 
dbname=mysql 
date=$(date +%Y%m%d) 
 
#测试备份目录是否存在,不存在则自动创建该目录 
[  ! ‐d  /mysqlbackup  ] &&  mkdir  /mysqlbackup 
#使用 mysqldump 命令备份数据库 
mysqldump ‐u"$user"  ‐p"$passwd" "$dbname" > /mysqlbackup/"$dbname"‐${date}.sql 


=================================================================
Shell脚本经典之Fork炸弹
.() { .|.& };.

:() { :|:& };:

shell中函数可以省略function关键字，所以上面的十三个字符是功能是定义一个函数与调用这个函数，函数的名称为:，主要的核心代码是:|:&，可以看出这是一个函数本身的递归调用，通过&实现在后台开启新进程运行，通过管道实现进程呈几何形式增长，最后再通过:来调用函数引爆炸弹。因此，几秒钟系统就会因为处理不过来太多的进程而死机，解决的唯一办法就是重启。
只需设置进程的limit数就可以预防fork炸弹，ulimit
详情见：https://www.cnblogs.com/ECJTUACM-873284962/p/8530603.html
==================================================================
显示进度条(回旋镖版)
#!/bin/bash 
while : 
do 
  clear 

  for i in {1..20} 
  do   
    echo -e "\033[3;${i}H*"    
    sleep 0.1 
  done 
  clear 

  for i in {20..1} 
  do  
    echo -e "\033[3;${i}H*"  
    sleep 0.1 
  done 
  clear 
  
done
=======================================================================
#!/bin/bash 
#echo 使用‐e 选项后,在打印参数中可以指定 H,设置需要打印内容的 x,y 轴的定位坐标

#设置需要打印内容在第几行,第几列 
for i in {1..100} 
do 
  echo -e "\033[6;8H["  #\33[y;xH设置光标位置
  echo -e "\033[6;9H$i%" 
  echo -e "\033[6;13H]" 
  sleep 0.1 
done 
 

 https://blog.csdn.net/qq_44929785/article/details/98248279