#!/bin/bash

FILENAME="flow_control_with_if.txt"

# Условное условие для проверки существования файла.
if [ -f "${FILENAME}" ]; then
    echo "${} already exists."
    exit 1
else
    touch "${FILENAME}"
fi

Использование отрицательной проверки 
if [ ! -f "${FILENAME}" ]; then
    touch "${FILENAME}"
fi

rm "${FILENAME}"

# ===========================================================
# сравнение двух строк
VARIABLE_ONE="nostarch"
VARIABLE_TWO="nostarch"

if [ "${VARIABLE_ONE}" = "${VARIABLE_TWO}" ]; then
    echo "They are equal!"
else
    echo "They are not equal!"
fi
# ===========================================================
# сравнение чисел
VARIABLE_ONE="10"
VARIABLE_TWO="20"

if [ "${VARIABLE_ONE}" -gt "${VARIABLE_TWO}" ]; then
    echo "${VARIABLE_ONE} is greater than ${VARIABLE_TWO}"
else
    echo "${VARIABLE_ONE} is less than ${VARIABLE_TWO}"
fi
# ===========================================================
# Использование оператора AND для объединения двух условий проверки файлов
echo "Hello World!" > file.txt

if [ -f "file.txt" ] && [ -s "file.txt" ]; then                         # -s файл больше чем 0 байт; -f файл существует
    echo "2 The file exists and its size is greater than zero."
fi
rm file.txt
# ===========================================================
# существует ли файл или является он каталогом
DIR_NAME="dir_test"
mkdir "${DIR_NAME}"

if [ -f "${DIR_NAME}" ] || [ -d "${DIR_NAME}" ]; then
    echo "${DIR_NAME} is either a file or a directory."
fi
rm "${DIR_NAME}"
# ===========================================================
# Выполнение команд на основе значений кодов завершения.
if touch test123; then
    echo "OK: file created"
    rm test123
fi
# ===========================================================
# Использование операторов if и elif
USER_INPUT="${1}"

if [ -z "${USER_INPUT}" ]; then
    echo "You must provide an argument"
    exit 1
fi

if [ -f "${USER_INPUT}" ]; then
    echo "${USER_INPUT} is a file"
elif [ -d "${USER_INPUT}" ]; then
    echo "${USER_INPUT} is a directory"
else
    echo "${USER_INPUT}" is not a file or a directory
fi
rm "${USER_INPUT}"

exit 0
