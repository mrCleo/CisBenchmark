#!/bin/bash

PMD=$(authselect current | grep with-faillock | wc -l)

if [[ $PMD -eq 3 ]]; then
        exit 1
fi
