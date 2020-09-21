#!/bin/bash
echo "本次配置适用于Redhat7 CentOS7的物理机。公有云不可使用！其他版本系统慎用！"

read -p "请输入你的IP（最后一位即可，默认192.168.186.xxx）: " ip
read -p "请输入你的主机名：" host_name


#添加DNS解析
sed -i '/^nameserver/d' /etc/resolv.conf
echo "nameserver 223.6.6.6" >> /etc/resolv.conf


#配置yum源

yum -y install wget > /dev/null
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo 
yum clean all
yum makecache

#配置epel源
find /etc/yum.repos.d/ -name "epel*"|xargs -i mv {} {}.bak
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
sed -i 's|^#baseurl=https://download.fedoraproject.org/pub|baseurl=https://mirrors.aliyun.com|' /etc/yum.repos.d/epel*
sed -i 's|^metalink|#metalink|' /etc/yum.repos.d/epel*
yum clean all
yum makecache

#永久修改主机名
echo "${host_name}" >/etc/hostname

#永久关闭防火墙 SeLinux
systemctl stop firewalld
systemctl disable firewalld
setenforce 0 >> /dev/null
sed -i.bak 's/enforcing$/disabled/' /etc/selinux/config

#ntp对时
yum -y install ntp-4.2.6p5-29.el7.centos.2.x86_64
ntpdate ntp.aliyun.com

#关闭网络管理
systemctl stop NetworkManager
systemctl disable NetworkManager

#安装必备软件
yum -y install vim
yum -y install bash-completion

#将IP地址修改为静态
sed -i 's/\<dhcp\>/none/' /etc/sysconfig/network-scripts/ifcfg-ens33
sed -i "$ a IPADDR=192.168.186.${ip}\nNETMASK=255.255.255.0\nDNS=223.6.6.6\nGATEWAY=192.168.186.2" /etc/sysconfig/network-scripts/ifcfg-ens33
ifdown ens33;ifup ens33
#是否重启
read -p "初始化完成，部分配置需重启生效。现在重启？[y]" reply
[ ${reply} == "y" ] && reboot || echo "请您稍后手动重启。【reboot】"