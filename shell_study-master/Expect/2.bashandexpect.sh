#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/26
# Usage: sshd + expect + bash


rpm -qa | grep expect
if [ $? -eq 0 ];then
  echo "Expect is installed on this computer."
else
  yum -y install expect
fi

export username="root"
export hostip="10.3.145.162"
export passwd="1"
/usr/bin/expect <<-EOF
spawn ssh-keygen
expect "(/root/.ssh/id_rsa):" { send "\r" }
expect "(empty for no passphrase):" { send "\r" }
expect "*again:" { send "\r" }

spawn ssh-copy-id $username@$hostip
expect "*yes/no*" { send "yes\r" }
expect "*password:" { send "$passwd\r" }
expect eof
EOF









