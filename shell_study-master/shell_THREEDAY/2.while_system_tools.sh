#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/25
# Usage: while system tools.

while 1>0
do
  cat <<-EOF
    +-------------------------------------------------------------------------+
    |                   System_tools V1.0                                     |
    +-------------------------------------------------------------------------+
    |           a. Stop And Disabled Firewalld.                               |
    |           b. Disabled SELinux Secure System.                            |
    |           c. Install Apache Service.                                    |
    |           d. Quit                                                       |
    +-------------------------------------------------------------------------+
EOF

  printf "\e[1;32m请输入你想进行操作的选项(例: "a" or "b" or "c" or "d"): \e[0m" && read var
  case $var in
    a)
      systemctl stop firewalld && systemctl disable firewalld
      ;;
    b)
      sed -ri s/SELINUX=enforcing/SELINUX=disabled/g /etc/selinux/config
      setenforce 0
      ;;
    c)
      yum -y install httpd httpd-tools
      ;;
    d)
      exit
      ;;
    *)
      echo "你个笨蛋！！！"
      ;;
  esac
  if [ $? -eq 0 ];then
    echo " "
  else
    printf "\e[1;31m Warning: Your program exist ERROR!!! \e[0m\n"
    break
  fi
done
