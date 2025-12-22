#!/bin/bash

NAME="${1}"
DOMAIN="${2}"
OUTPUT_FILE="results.csv"


[ "$#" -ne 2 ] && echo "You must provide two arguments to this script." && exit 1

date +%c > "${OUTPUT_FILE}"

if ping -c1 "${DOMAIN}" &> /dev/null; then
    echo "success, ${NAME}, ${DOMAIN}" >> "${OUTPUT_FILE}"
else
    echo "failure, ${NAME}, ${DOMAIN}" >> "${OUTPUT_FILE}"
fi



rm "${OUTPUT_FILE}"
exit 0