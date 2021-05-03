#!/bin/bash



PMD=$(authselect current | egrep "sudo|faillock|nullok" | wc -l)

if [[ $PMD -ne 0 ]]; then
        exit 1
fi
