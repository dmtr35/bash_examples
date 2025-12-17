#!/bin/bash

# обьявление
declare -A user

# заполнение
user[name]="dm"
user[age]=47
user[role]="admin"

# чтение
echo "${user[@]}"                           # все значения
echo "${user[name]}"                        # чтение по значению
echo "${!user[@]}"                          # все ключи
echo "${#user[@]}"                          # количество элементов
# ===============================================================

user[role]="root"                           # замена значения
echo "${user[@]}"
unset user[age]                             # удаление элемента
echo "${user[@]}"

# ===============================================================

# проверка на существование ключа
[[ -v user[name] ]] && echo "exists"
# ===============================================================

# поиск по значению
for i in "${!user[@]}"; do
    [[ "${user[$i]}" == "dm" ]] && echo "key: $i"
done
# ===============================================================

# очистка массива
# unset user
# declare -A user

# ===============================================================

# копирование ассоциативного массива
declare -A copy
for i in "${!user[@]}"; do
    copy[$i]="${user[$i]}"
done
echo "${copy[@]}"

# ===============================================================

# дебаг массива
declare -p copy         # вывод: declare -A copy=([role]="root" [name]="dm" )

# существует ли переменная и какого она типа
declare -p copy 2>/dev/null
echo "$?"
declare -p VAR 2>/dev/null
echo "$?"

# Сериализация / восстановление переменных
declare -p copy > state.sh
unset copy
echo "${copy[@]}"
# позже
source state.sh
echo "${copy[@]}"
rm state.sh

# Проверка типа переменной (идиоматично)
if declare -p copy 2>/dev/null | grep -q 'declare \-A'; then
    echo "indexed array"
fi



exit 0