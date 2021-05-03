#!/bin/sh

sshd -T | grep "HostbasedAuthentication\s*no" || exit $?
