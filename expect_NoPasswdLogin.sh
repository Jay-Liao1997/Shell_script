写法一：
#!/bin/bash
rpm -qa|grep expect &>/dev/null
[ "$(echo $?)" != "0" ] && yum -y install expect &>/dev/null && echo "expect install successfully"

#result=`find /root -name .ssh`
#[ -n "${result}" ] && echo "sshkey existed" && exit

/usr/bin/expect <<EOF
set timeout 30
spawn ssh-keygen
expect "/root/.ssh/id_rsa"
send "\n"
expect {
        "already" { send "yes\n"; }
        "passphrase" { send "\n"; exp_continue }
        "again" { send "\n" }
} 

spawn ssh-copy-id -i 192.168.186.158
expect {
        "yes/no" { send "yes\n"; exp_continue }
        "password" { send "123456\n" }
}
expect eof
EOF


写法二：
#!/bin/bash

rpm -qa|grep expect &>/dev/null
[ "$(echo $?)" != "0" ] && yum -y install expect &>/dev/null && echo "expect install successfully"

result=`find /root -name .ssh`
[ -n "${result}" ] && echo "sshkey existed"


/usr/bin/expect <<EOF
set timeout 30
spawn ssh-keygen
expect "/root/.ssh/id_rsa"
send "\n"
expect "passphrase"
send "\n"
expect "again"
send "\n"

spawn ssh-copy-id -i 192.168.186.158
expect {
        "yes/no" { send "yes\n"; exp_continue }
        "password" { send "123456\n" }
}
expect eof
EOF