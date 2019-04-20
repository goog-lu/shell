#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/22
# Usage: if嵌套.

number=100
if [ $number -lt 201 ];then
  if [ $number -lt 99 ];then
    printf "less than 99.\n"
  else
    printf "more than 99"
  fi
else
  if [ $number -gt 301 ];then
    printf "太大了\n"
  else
    printf "less than 301.\n"
  fi
fi
