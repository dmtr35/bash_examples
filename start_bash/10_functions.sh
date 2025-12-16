#!/bin/bash
# example:
# say_name(){
#     echo "Black Hat Bash"
# }


# Эта функция проверяет, равен ли текущий идентификатор пользователя нулю.
check_if_root(){
    if [ "${EUID}" -eq "0" ]; then
        return 0
    else
        return 1
    fi
}

if check_if_root; then
    echo "User is root"
else
    echo "User is not root"
fi
# ===========================================================

test="here"
echo "zero_arg: ${0}"
echo "first: ${1}, second: ${2}, third: ${3}"
print_args(){
    echo "${test}"
    echo "zero_arg: ${0}"
    echo "first: ${1}, second: ${2}, third: ${3}"
}

print_args
print_args No Starch Press
# ===========================================================





exit 0