#!/bin/bash

test=$(grep "umask" /etc/profile /etc/profile.d/*.sh | grep "umask" /etc/bashrc)
if [[ "$test" != *"umask 027"* ]]
then
	exit 1
fi
