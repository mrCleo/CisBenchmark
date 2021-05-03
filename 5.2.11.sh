#!/bin/sh

sshd -T | grep -q "PermitEmptyPasswords\s*no" || exit $?
