#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/22
# Usage: if number.

read -p "Please input your frist number: " num01
read -p "Please input your second number: " num02

if [ $num01 -gt $num02 ];then
  printf "num01 more than num02\n"
else
  printf "num01 less than num02\n"
fi
