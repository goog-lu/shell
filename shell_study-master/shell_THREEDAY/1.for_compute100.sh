#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/25
# Usage: compute 1..100 sum.

for i in {1..100}
do
  let sum=$sum+$i
  if [ $i -eq 100 ];then
	printf "sum is: $sum\n"
  fi
done

#第一次循环：
#sum=($sum=0)+($i=1)
#sum=1
#
#第二次循环：
#sum=($sum=0+1)+($i=2)
#sum=1+2
#
#第三次循环：
#sum=($sum=0+1+2)+($i=3)
#sum=1+2+3
#
#....
#第一百次循环：
#sum=($sum=0+1+2+3+4+5+6+7+8+9+...+99)+($i=100)
#sum=5050
