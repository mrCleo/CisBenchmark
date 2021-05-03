#!/bin/sh

R=$(egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/password-auth | grep "remember" | sed 's/.*remember=\([0-9]*\).*/\1/g')
if [[ $R -lt 5 ]] ; then
        exit 1
fi

R=$(egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/system-auth |grep "remember" | sed 's/.*remember=\([0-9]*\).*/\1/g')
if [[ $R -lt 5 ]] ; then
        exit 1
fi
