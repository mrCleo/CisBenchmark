#!/bin/bash

stat -L -c " %u %g" /etc/crontab | grep -q " 0 0$" || exit $?
