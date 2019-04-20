#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/25
# Usage: test computer alive.

netduan="10.3.145"
for i in {2..254}
do
  {
  ping -c1 $netduan.$i
  if [ $? -eq 0 ];then
    echo "$netduan.$i" >>/opt/ip_alive.txt
  fi
  } &
done
wait
echo "finish...ok!!!"
