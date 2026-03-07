#!/bin/bash
# Группы команд и подоболочки

ls -l > output.txt
echo "Listing of foo.txt" >> output.txt
cat foo.txt >> output.txt

# можно заменить с помощью группировки:
{ ls -l; echo "Listing of foo.txt"; cat foo.txt; } > output.txt
# Подоболочка:
(ls -l; echo "Listing of foo.txt"; cat foo.txt) > output.txt

# конвейеры из команд
{ ls -l; echo "Listing of foo.txt"; cat foo.txt; } | lpr

# ===============================================================
# Подстановка процессов
# для процессов, отправляющих результаты в стандартный вывод:
# <(список)

read < <(echo "foo")
echo $REPLY                 # > "foo"

# вывод подоболочки передается через файл с именем /dev/fd/63:
echo <(echo "foo")          # /dev/fd/63

while read attr links owner group size date time filename; do
    cat <<- EOF
        Filename:       $filename
        Size:           $size
        Owner:          $owner
        Group:          $group
        Modified:       $date $time
        Links:          $links
        Attributes:     $attr
EOF
done < <(ls -l | tail -n +2)

# и для процессов, принимающих данные через стандартный ввод:
# >(список)

# ===============================================================
# Ловушки (trap)
# trap аргумент сигнал [сигнал...]

trap-demo : простой пример обработки сигналов
trap "echo 'I am ignoring you.'" SIGINT SIGTERM
for i in {1..5}; do
    echo "Iteration $i of 5"
    sleep 5
done
# ----------------------------------------------------------------
# trap-demo2 : простой пример обработки сигналов
exit_on_signal_SIGINT () {
    echo "Script interrupted." 2>&1
    # exit 0
}
exit_on_signal_SIGTERM () {
    echo "Script terminated." 2>&1
    # exit 0
}
trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM
for i in {1..5}; do
    echo "Iteration $i of 5"
    sleep 5
done

# ===============================================================
# временные файлы
tempfile=/tmp/$(basename $0).$$.$RANDOM
echo $tempfile              # > "/tmp/bash.1280796.24681"

tempfile=$(mktemp /tmp/foobar.$$.XXXXXXXXXX)
echo $tempfile              # > "/tmp/foobar.1280796.IG6OPxclS9"

cd $(mktemp -d)
[[ -d $HOME/tmp ]] || mkdir $HOME/tmp

# ===============================================================
set -x          # дебагинг
set -u          # считать обращение к неустановленной переменной ошибкой
set -e          # завершить скрипт сразу, если любая команда вернёт ненулевой код выхода.


exit 0