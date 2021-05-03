#!/bin/bash

test=$(sshd -T | grep -i allowtcpforwarding)
if [[ "$test" != *"AllowTcpForwarding no"* ]]
then
	exit 1
fi
