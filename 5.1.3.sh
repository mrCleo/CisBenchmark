#!/bin/bash

stat -L -c " %u %g" /etc/cron.hourly | grep -q " 0 0$" || exit $?

