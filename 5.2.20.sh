#!/bin/bash

test=$(grep '^/s*CRYPTO_POLICY=' /etc/sysconfig/sshd)
if [[ "$test" != *""* ]]
then
	exit 1
fi
