#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/21
# Usage: copy

cp -rf /opt/* /mnt/
find /mnt -size -20KB -exec cp -rf {} /tmp/ \;
