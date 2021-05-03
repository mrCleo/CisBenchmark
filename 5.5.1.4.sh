#!/bin/bash

test=$(useradd -D | grep INACTIVE | cut -d= -f2)
if [[ "$test" != *"30"]];
then
	exit 1
fi
