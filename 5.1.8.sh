#!/bin/bash

if [[ -f /etc/cron.deny || -f /etc/at.deny ]]; then
        echo /etc/cron.deny and /etc/at.deny must not exist
        exit 1
fi

stat -L -c " %u %g" /etc/cron.allow | grep -q " 0 0$" || exit $?

stat -L -c " %u %g" /etc/at.allow | grep -q " 0 0$" || exit $?
