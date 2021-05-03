#!/bin/bash

NOW=$(date +%s)
for usr in $(cut -d: -f1 /etc/shadow); do
  [[ \
    $(chage --list $usr | grep '^Last password change' | cut -d: -f2) > $(date)
  ]] \
    && \
    echo "$usr :$(chage --list $usr | grep '^Last password change' | cut -d: -f2)";

        if [[ $usr -gt $NOW ]]; then
                exit 1
        fi
done
