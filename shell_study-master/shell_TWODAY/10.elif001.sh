#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/22
# Usage: elif.

n=100
if [ $n -gt 200 ];then
  printf "n more than 2.\n"
elif [ $n -gt 3 ];then
  printf "n more than 3.\n"
elif [ $n -gt 4 ];then
  printf "n more than 4.\n"
else
  printf "n less than 2\n"
fi
