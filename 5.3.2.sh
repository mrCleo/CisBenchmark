#!/bin/bash

PMD=$(authselect current | grep "Profile ID:" | wc -l)

if [[ $PMD -eq 3 ]]; then
        exit 1
fi
