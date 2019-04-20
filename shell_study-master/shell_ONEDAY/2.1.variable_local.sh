#!/usr/bin/env bash
#
# Author: bavduer
# Email: bavduer@163.com
# Date: 2019/03/21
# Usage: variable local.

hello() {
	local VARIABLE="hello world"
	printf "$VARIABLE\n"
}
hello

printf "$VARIABLE\n"


hello() {

	
}
