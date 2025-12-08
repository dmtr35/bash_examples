#!/usr/bin/env bash

text="Hello"
echo "$text"
# --------------------------------------------------------------
# second_str="world!"
# text="$text, $second_str"                                       # обьединение строк     # Hello, world!
# echo "$text"
# --------------------------------------------------------------
# leng="${#text}"                                                 # количество символов   # 13
# echo "$leng"
# --------------------------------------------------------------
# echo ${first_part="text:4"}
# echo "${text:7}"                                                # вывод начиная с 7символа  # world!
# echo "${text:7:5}"                                              # вывести только 5 символов начиная с 7го  # world
# --------------------------------------------------------------
# string_for_replace="I like cats"
# echo "${string_for_replace/cat/dog}"                            # замена подстроки # I like dogs
# echo "${string_for_replace//cat/dog}"                           # замена всех подстрок # I like dogs
# --------------------------------------------------------------
# ==============================================================

# text="hello world!"
# sub="rld"
# before="${text%%$sub*}"                                            # обрезать(удалить) все после подстроки "rld" включительно # hello wo
# echo "$before"
# --------------------------------------------------------------
# text="hello world!"
# sub="rld"
# after="${text#*$sub}"                                            # обрезать(удалить) все перед подстрокой "rld" включительно # !
# echo "$after"
# --------------------------------------------------------------
# text="hello world"
# result="${text#???}"                                               # удалить первые N символов из строки # lo world
# echo "$result"
# --------------------------------------------------------------
# text="hello world"
# result="${text%???}"                                               # Удаление последних символов (%) # hello wo
# echo "$result"
# --------------------------------------------------------------
# разделить строку
# path=$(pwd)
# full_path=$path/$0
# echo "$full_path"
# text="/home/dm/WebstormProjects/bash/start_bash"


# text="hello world"
# sub="o"

# pos=$(expr index "$text" "$sub")
# echo "$pos"



# ======================================================================
# tmp="/tmp"
# echo "$tmp"
# echo "$@"
# rm -rf "$@"


exit 0