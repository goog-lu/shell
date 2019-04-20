#!/usr/bin/env bash
#
# Author: bavdu
# Email: bavduer@163.com
# Github: https://github.com/bavdu
# Date: 2019/**/**

printf "Hello world"  # 故意少写了一个字母
echo `date +%Y-%m-%d_%k:%M:%S` >>/var/log/date_daemon01.log
