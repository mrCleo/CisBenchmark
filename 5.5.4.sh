#!/bin/bash

grep "^root:" /etc/passwd | cut -f4 -d: | grep -qE "^0$" || exit $?
