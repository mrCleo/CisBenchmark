#!/bin/sh

sshd -T | grep -q "PermitUserEnvironment\s*no" || exit $?
