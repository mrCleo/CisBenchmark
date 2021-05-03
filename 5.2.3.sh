#!/bin/bash

MDP=$(find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec stat {} \; | egrep "^Access:\s+\S+(0600|0700)\/\S+" | wc -l)

if [[ $MDP -ne 0 ]]; then
        exit 1
fi
