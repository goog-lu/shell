#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/25
# Usage: compute 1..100 sushu.


for i in {1..100}
do
  for j in {1..100}
  do
    let prime=$i%$j
    if [ $prime -eq 0 ];then
      if [ $i -ne $j ];then
        continue 2
      elif [ $i -eq $j ];then
	printf "$i\n"
      fi
    fi
  done
done
