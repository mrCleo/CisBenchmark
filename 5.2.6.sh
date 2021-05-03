#!/bin/sh

sshd -T | grep x11forwarding | grep -q "X11Forwarding\s*no" || exit $?
