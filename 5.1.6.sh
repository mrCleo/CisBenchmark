#!/bin/sh

stat -L -c " %u %g" /etc/cron.monthly | grep -q " 0 0$" || exit $?
