#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/22
# Usage: if yum.

rpm -qa | grep $1
if [ $? -eq 0 ];then
  printf "已经有这个包啦！ 你装啥玩意！～"
else
  yum -y install $1
fi
