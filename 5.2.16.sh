#!/bin/bash

test=$(sshd -T | grep -i usepam)
if [[ "$test" != *"usepam yes"* ]]
then
	exit 1
fi
