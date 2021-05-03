#!/bin/sh

egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/password-auth | grep sha512 || exit $?

egrep '^password\s+sufficient\s+pam_unix.so' /etc/pam.d/system-auth | grep sha512 || exit $?
