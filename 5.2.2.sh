#!/bin/sh

grep -qE "^AllowUsers|^AllowGroups|^DenyUsers|^DenyGroups" /etc/ssh/sshd_config || exit $?
