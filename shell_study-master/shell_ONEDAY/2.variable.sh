#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/21
# Usage: variable.

FRUIT="apple"
COUNT=10

echo "we have $COUNT ${FRUIT}s"

hello() {
	VARIABLE="hello world"
	printf "$FRUIT\n"
}
hello

printf "$VARIABLE\n"
