#!/bin/bash

# Устанавливает массив
IP_ADDRESSES=(192.168.2.1 192.168.2.100 192.168.2.110)
# напечатать все элементы массива
echo "${IP_ADDRESSES[*]}"
# напечатать только первый элемент массива
echo "${IP_ADDRESSES[0]}"

# удалить элемент из массива
unset IP_ADDRESSES[1]

# заменить один элемент массива на другой
IP_ADDRESSES[0]="192.168.2.111"

echo "${IP_ADDRESSES[*]}"
echo "${IP_ADDRESSES[0]}"



exit 0
