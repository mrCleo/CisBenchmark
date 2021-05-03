#!/bin/sh
sshd -T | grep -qE "^Banner\s+"  || exit $?
