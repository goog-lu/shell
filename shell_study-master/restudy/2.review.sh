#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/25
# Usage: variable.

# weight speed compute：8 bit = 1 byte.

weight=1000
rate=8

let speed=$weight/$rate
printf "speed is: $speed\n"
