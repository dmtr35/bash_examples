#!/bin/bash
echo -e "\n"

# Operator        Description
# >               Перенаправляет stdout в файл
# >>              Перенаправляет stdout в файл, добавляя его к существующему содержимому
# &> or >&        Перенаправляет stdout и stderr в файл
# &>>             Перенаправляет stdout и stderr в файл добавляя его к существующему содержимому
# <               Перенаправляет input на команду
# <<              Называется «here document» или "heredoc", перенаправляет несколько строк ввода в команду
# |               Перенаправить output команды в качестве ввода для другой команды


# перенаправляем stdout в файл
echo "Hello World!" > output.txt
cat output.txt

# добавить stdout в файл
echo "Goodbye!" >> output.txt
cat output.txt

# перенаправить оба, stdout и stderr в файл (добавлять &>>)
(lzl; ls -l /) &> stdout_and_stderr.txt
cat stdout_and_stderr.txt

# перенаправить stdout и stderr в разные файлы
(lzl; ls -l /) 1> stdout.txt 2> stderr.txt
cat stdout.txt stderr.txt
#----------------------------------------------------

# передать содержимое файла output.txt в качестве входных данных для команды cat
cat < output.txt

# перенаправить несколько строк в команду
cat << EOF
Black Hat Bash
by No Starch Press
EOF
#----------------------------------------------------

# pipe
ls -l / | grep "bin"


rm output.txt stdout_and_stderr.txt stdout.txt stderr.txt
exit 0