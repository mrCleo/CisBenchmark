#!/bin/sh

sshd -T | grep ignorerhosts | grep -q "IgnoreRhosts\s*yes" || exit $?
