#!/bin/bash

test=$(sshd -T | grep -i maxsessions)
if [[ "$test" != *"maxsessions 4"* ]]
then
	exit 1
fi
