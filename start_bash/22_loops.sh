#!/bin/bash

# while

# SIGNAL_TO_STOP_FILE="stoploop"

# while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do
#     echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..."
#     echo "Checking again in 2 seconds..."
#     sleep 2
# done

# echo "File was found! Exiting..."

# ======================================================================

# until


FILE="output.txt"
touch "${FILE}"

until [[ -s "${FILE}" ]]; do
    echo "${FILE} is empty..."
    echo "Checking again in 2 seconds..."
    sleep 2
done

echo "${FILE} appears to have some content in it!"
rm "${FILE}"

# ======================================================================

# for



exit 0