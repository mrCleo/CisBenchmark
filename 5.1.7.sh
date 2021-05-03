#!/bin/sh

stat -L -c " %u %g" /etc/cron.d | grep -q " 0 0$" || exit $?
