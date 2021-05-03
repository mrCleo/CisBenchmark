#!/bin/bash


grep pam_wheel.so /etc/pam.d/su | 
grep -qE "^auth\s*required\s*pam_wheel.so\s*use_uid\s*$" || exit $?
