#!/bin/sh

stat -L -c " %u %g" /etc/cron.weekly | grep -q " 0 0$" || exit $?
