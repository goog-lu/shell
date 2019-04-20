#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/25
# Usage: compute 1..100 /2.

for i in {1..100}
do
  let num01=$i%2
  let num02=$i%3
  if [ $num01 -eq 0 ];then
    if [ $num02 -eq 0 ];then
      printf "$i--"
    fi
  fi
done
