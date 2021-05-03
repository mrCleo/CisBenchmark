#!/bin/sh



sshd -T | grep loglevel | grep -q "Loglevel\s*INFO" || exit $1
