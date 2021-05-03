#!/bin/sh

sshd -T | grep -q "PermitRootLogin\s*no" || exit $?
