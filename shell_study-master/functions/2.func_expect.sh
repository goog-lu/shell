#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/26
# Usage: expect in function.

SuiBian() {
/usr/bin/expect <<-ROF
spawn ssh-keygen
expect "*:" { send "\r"}
expect "*:" { send "\r"}
expect "*:" { send "\r"}
expect eof
ROF
}

username="root"
hostip="10.3.145.162"
passwd="1"
DaBian() {
/usr/bin/expect <<-EOF
spawn ssh-copy-id $username@$hostip
expect "*yes/no*" { send "yes\r" }
expect "*password:" { send "$passwd\r" }
expect eof
EOF
}
DaBian
