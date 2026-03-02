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
for i in A B C D; do echo $i; done
# подстановка в фигурных скобках
for i in {A..D}; do echo $i; done
# подстановка имен файлов:
# (если не найдет ни одного файла,вернет сам шаблон)
for i in distros*.txt; do echo "$i"; done

# for index in $(seq 1 10); do
#     echo "${index}"
# done

# for ip_address in "$@"; do
#     echo "Taking some action on IP address ${ip_address}"
# done

# for file in $(ls .); do
#     echo "File: ${file}"
# done
# ----------------------------------------------------------------------

for ((i="$delay"; i>=1; i--)); do
    printf "\e[32m%-35s <----\e[0m\r" "Компьютер выключится через $i $(sklonenie $i)       "
    read -t 1 -r input
    if [[ $? -eq 0 ]]; then
      break
    fi
done

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

# case ";;&" продолжает проверку вместо простого завершения после первого найденного совпадения. 
# case4-2: проверка символа

read -n 1 -p "Type a character > "
echo
case "$REPLY" in
    [[:upper:]])    echo "'$REPLY' is upper case." ;;&
    [[:lower:]])    echo "'$REPLY' is lower case." ;;&
    [[:alpha:]])    echo "'$REPLY' is alphabetic." ;;&
    [[:digit:]])    echo "'$REPLY' is a digit." ;;&
    [[:graph:]])    echo "'$REPLY' is a visible character." ;;&
    [[:punct:]])    echo "'$REPLY' is a punctuation symbol." ;;&
    [[:space:]])    echo "'$REPLY' is a whitespace character." ;;&
    [[:xdigit:]])   echo "'$REPLY' is a hexadecimal digit." ;;&
esac
