#!/bin/bash

first_name="${1}"
second_name="${2}"

date +%d-%m-%Y > output.txt
echo "${first_name}" "${second_name}" >> output.txt

cp output.txt backup.txt

cat output.txt
exit 0