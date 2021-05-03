#!/bin/sh

stat -L -c " %u %g" /etc/cron.daily | grep -q " 0 0$" || exit $?
