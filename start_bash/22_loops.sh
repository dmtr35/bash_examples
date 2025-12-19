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


# FILE="output.txt"
# touch "${FILE}"

# until [[ -s "${FILE}" ]]; do
#     echo "${FILE} is empty..."
#     echo "Checking again in 2 seconds..."
#     sleep 2
# done

# echo "${FILE} appears to have some content in it!"
# rm "${FILE}"

# ======================================================================

# for
# for index in $(seq 1 10); do
#     echo "${index}"
# done

# for ip_address in "$@"; do
#     echo "Taking some action on IP address ${ip_address}"
# done

# for file in $(ls .); do
#     echo "File: ${file}"
# done

# ======================================================================

# break and continue

while true; do
    echo "in the loop"
    break
done

echo "This code block will be reached."
# ------------------------------------------------

touch example_file1 example_file2 example_file3
for file in example_file*; do
    if [[ "${file}" == "example_file1" ]]; then
        echo "Skipping the first file"
        continue
    fi
    echo "${RANDOM}" > "${file}"
done

rm example_file1 example_file2 example_file3
# ======================================================================

# case
IP_ADDRESS="192.168.2.100"

case ${IP_ADDRESS} in
    192.168.*)
        echo "Network is 192.168.x.x"
    ;;
    10.0.*)
        echo "Network is 10.0.x.x"
    ;;
    *)
        echo "Could not identify the network"
    ;;
esac

exit 0