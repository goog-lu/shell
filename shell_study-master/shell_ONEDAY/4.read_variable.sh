#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/21
# Usage: variable read.

#FRUIT=apple/orange

read -p "你想买的水果是: " FRUIT
read -p "你想买多少个数: " COUNT

JJ=5

let TOTAL=$COUNT*$JJ
printf "你应该付款:$TOTAL元.\n"
