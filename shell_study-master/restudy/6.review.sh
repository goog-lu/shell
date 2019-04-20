#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/25
# Usage: case.

read -p "" var
case $var in
  1)
    pass;
    ;;
  2)
    pass;
    ;;
  3)
    pass;
    ;;
  *)
    printf "Please redo your choose.\n"
    printf "Input True: 1 or 2 or 3.\n"
    ;;
esac
