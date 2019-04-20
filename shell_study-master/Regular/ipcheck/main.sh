#!/usr/bin/env bash
#
# Author: bavdu
# Email: bavduer@163.com
# Date: 2019/03/27
# Usage: check ip address.

function GetOnlineHost() {
  for i in {2..254}
  do
    {
    	ping -c1 $HOST.$i &>/dev/null
    	if [ $? -eq 0 ];then
    		echo "$HOST.$i" >>/opt/onlineipaddress.txt
    	fi
    }&
  done
  wait
  echo "finish check ip address complete."
}

while :
do
	cat <<-ROF
		+--------------------------+
			Get IP Address Tools
			 1. Get IP Address.
			 2. Quit
		+--------------------------+
	ROF
	read -p "Please Choose Your Options: " VAR
	case $VAR in
		1)
			ping -c1 www.baidu.com &>/dev/null
			if [ $? -ne 0 ];then
				echo "Please Check Your NetWork."
				exit
			else
				read -p "Please Input your Network locations(example: 10.3.145):" HOST
				GetOnlineHost
			fi
			;;
		2)
			exit
			;;
		*)
			echo "\e[1;31mPlease Check Yuor Choose Options!\e[0m"
			;;
	esac
done
