#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/25
# Usage: compute 1..100 /2.

for i in {1..100}
do
  let num=$i%3
  if [ $num -eq 0 ];then
    printf "$i\n"
  fi
done
