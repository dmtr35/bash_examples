#!/bin/bash

# read — чтение значений со стандартного ввода
# read [-параметры] [переменная...]
# "переменная" для сохранения введенного значения (по умолчанию сохраняется в REPLY)

# минимальная конструкция
# read && echo "$REPLY"
# read arg && echo "$arg"

# read-multiple: чтение нескольких значений с клавиатуры
# echo -n "Enter one or more values > "
# read var1 var2 var3 var4 var5
# echo "var1 = '$var1'"
# echo "var2 = '$var2'"
# echo "var3 = '$var3'"
# echo "var4 = '$var4'"
# echo "var5 = '$var5'"           # в последнюю переменную попадают все остальное


# Параметры
# -a arr       Сохранить ввод в указанный массив, начиная с элемента с индексом 0.
read -a arr && echo "${arr[@]}"

# -d            Использовать в качестве признака конца ввода первый символ из строки разделитель, а не символ перевода строки
# -e            Использовать Readline для обработки ввода. Это позволяет редактировать ввод, как в командной строке
# read-default: предложение значения по умолчанию, для ввода которого достаточно нажать клавишу Enter.
read -e -p "What is your user name? " -i $USER
echo "You answered: '$REPLY'"

# -n            Прочитать указанное число символов, а не всю строку
# -p            Показывать указанное приглашение к вводу
read -p "Enter one or more values > "
echo "REPLY = '$REPLY'"

# -r            Режим без промежуточной обработки. Не интерпретировать обратные слеши как экранирующие символы
# -s            Безмолвный режим. Не производить эхо-вывод символов на экран в процессе ввода. Этот режим может пригодиться для организации ввода паролей и другой конфиденциальной информации
# -t            Предельное время ожидания. Завершить ввод по истечении указанного числа секунд. По истечении указанного интервала read вернет ненулевое значение
if read -t 10 -sp "Enter secret passphrase > " secret_pass; then
    echo -e "\nSecret passphrase = '$secret_pass'"
else
    echo -e "\nInput timed out" >&2
    exit 1
fi

# -u            Произвести ввод из файла с указанным дескриптором вместо стандартного ввода

# =============================================================

# IFS (от Internal Field Separator — внутренний разделитель полей)
# read-ifs: чтение полей из файла

FILE=/etc/passwd


read -e -p "Enter a username > " -i $USER  user_name
file_info=$(grep "^$user_name:" $FILE)

if [ -n "$file_info" ]; then
    IFS=":" read user pw uid gid name home shell <<< "$file_info"
    echo "User = '$user'"
    echo "UID = '$uid'"
    echo "GID = '$gid'"
    echo "Full name = '$name'"
    echo "Home Dir. = '$home'"
    echo "Shell = '$shell'"
else
    echo "No such user '$user_name'" >&2
    exit 1
fi




exit 0