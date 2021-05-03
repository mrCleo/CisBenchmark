#!/bin/bash

test=$(sshd -T | grep -i maxstartups)
if [[ "$test" != *"maxstartups 10:30:60"* ]]
then
	exit 1
fi
