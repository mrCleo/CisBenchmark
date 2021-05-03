#!/bin/bash

test=$(systemctl is-enabled crond)
if [[ "$test" != *"enabled"* ]]
then
	exit 1
fi
