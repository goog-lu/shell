#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/26
# Usage: use function.

abs() {
  printf "hello world.\n"
  a=1
  b=3
  printf "a is:$a and b is:$b\n"
  c=$a
  a=$b
  b=$c
  printf "a is:$a and b is:$b\n"
}
abs
