#!/bin/bash

PWA=$(grep -E "^PASS_WARN_AGE" /etc/login.defs | awk {'print $2'})

if [[ $PWA -eq '' || $PWA -lt 7 ]]; then
        echo PASS_WARN_AGE = $PWA
        exit 1
fi

for i in $(egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1 ); do
        UPA=$(chage --list $i | grep "Number of days of warning before password expires" | cut -d: -f2)
        if [[ $UPA -lt 7 ]]; then
                echo $i password warn age = $UPA
                exit 1
        fi
done
