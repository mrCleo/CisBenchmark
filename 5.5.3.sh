#!/bin/bash

if [[ $TMOUT -eq "" || $TMOUT -gt 900 ]]; then
        exit 1
fi
