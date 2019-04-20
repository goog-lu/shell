#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/26
# Usage: 请使用位置变量，写一个函数来检查输入的URL地址的可用性.
# URL: https://www.baidu.com

CheckURL() {
  ping -c3 $1 &>/dev/null
  if [ $? -eq 0 ];then
    printf "您输入的网站是可用的.\n"
  else
    printf "请您检查你输入的地址是否正确.\n"
  fi
}
CheckURL $1
