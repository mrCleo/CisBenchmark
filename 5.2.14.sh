#!/bin/sh

LGT=$(sshd -T | grep logingracetime  | awk {'print $2'})
if [[ $LGT -eq '' || $LGT -gt 60 || $LGT -lt 1 ]]; then
        echo LoginGraceTime is $LGT
        exit 1
fi
