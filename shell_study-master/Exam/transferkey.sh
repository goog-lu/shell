#!/usr/bin/env bash
# 
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/0/273
# Usage: tranfer sshkey remote.

function Createkey() {

	rpm -qa | grep expect
	if [ $? -ne 0 ];then
		yum -y install ecpect
	fi

	/usr/bin/expect <<-EOF
		spawn ssh-keygen
		expect "*:" { send "\r" }
		expect "*:" { send "\r" }
		expect "*:" { send "\r" }
		expect eof
EOF
}

function Transferkey() {
	local USERNAME=root
	local PASSWD="1"
	/usr/bin/expect <<-EOF
	spawn ssh-copy-id $USERNAME@$HOSTIP
	expect "*yes/no*" { send "yes\r" }
	expect "*password:" { send "$PASSWD\r" }
EOF
}

while :
do
	cat <<-EOF
			+---------------------------------------+
					Transfer Key Version@1.0
						a. Create ssh key.
						b. Transfer key.
						c. Quit
			+---------------------------------------+
EOF
	read -p "Please your choose optins: " VAR
	case $VAR in
		a)
			if [ ! -f ~/.ssh/id_rsa.pub ];then
				Createkey
			fi
			;;
		b)
			read -p "Please input your remote HOSTIP: " HOSTIP
			Transferkey
			;;
		c)
			exit
			;;
		*)
			printf "\e[1;31m[ERROR]: Your Input Is Wrong.\e[0m"
	esac
done
