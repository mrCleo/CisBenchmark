#!/bin/sh

stat -L -c "%a %u %g" /etc/ssh/sshd_config | grep -q "600 0 0$" || exit $?
