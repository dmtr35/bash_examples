#!/bin/bash

FILENAME=$(date +%m_%d_%Y_%H-%M-%S)

if [[ ! -d ~/sessions ]]; then
    mkdir ~/sessions
fi

# Запуск сессии скрипта
if [[ -z $SCRIPT ]]; then
    export SCRIPT="/home/dm/sessions/${FILENAME}"
    script -q -f "${SCRIPT}"
fi


exit 0

