#!/bin/bash

# <         stdin
# >         stdout overwrite
# >>        stdout append
# 2>        stderr
# 2>&1      merge
# <<        here-doc
# <<<       here-string
# <( )      process substitution (input)
# >( )      process substitution (output)
# <&        duplicate input FD
# >&        duplicate output FD
# &>        stdout + stderr (bash)


# Перенаправление стандартного вывода
ls -l /bin > ~/test/ls_output.txt

# Добавить вывод в конец существующего файла
ls -l /usr/bin >> ls-output.txt

# Перенаправление стандартного вывода ошибок
ls -l /bin/usr 2> ls-error.txt

# Перенаправление стандартного вывода и стандартного вывода ошибок в один файл
ls -l /bin/usr > ls-output.txt 2>&1
ls -l /bin/usr &> ls-output.txt
ls -l /bin/usr &>> ls-output.txt

# Удаление нежелательного вывода (битоприемник (bit bucket))
ls -l /bin/usr 2> /dev/null

# ===============================================================================

# Перенаправление стандартного ввода
cat < ls-output.txt

# ===============================================================================

# Конвейеры
ls -l /usr/bin | cat
ls /bin /usr/bin | sort | cat


# ===============================================================================

# Here-document (<<) С подстановками
cat <<EOF
User: $USER
Date: $(date)
EOF
# Без подстановок (quoted delimiter)
cat <<'EOF'
User: $USER
$(date)
EOF

# ===============================================================================

# ! не смог воспроизвести
# <<- (strip leading TAB) 
# Удаляются только TAB, не пробелы
cat <<-EOF
    one
     two
EOF

# ===============================================================================

# Here-string (<<<)
# command <<< "text" эквивалентно: printf '%s\n' "text" | command
# это не поток, сначала подготавливется результат команды а затем передается
cat <<< "hello"

while read one; do
  printf '%s\n' "$one"
done <<< $'one\ntwo\nthree'

list=$(ls -l)
while IFS= read -r one; do
  printf '%s\n' "$one"
done <<< "$list"

# -------------------------------------------------------------------------------

# Process Substitution <(...) и >(...)
# настоящий поток байтов, не переменная
while IFS= read -r one; do
  printf '%s\n' "$one"
done < <(ls -l)


# пример
while read user shell; do
  echo "User=$user Shell=$shell"
done < <(awk -F: '{print $1, $7}' /etc/passwd)

# ===============================================================================
# перенаправить вывод команды в другую команду
# Команда читает как файл
cat <(ls -la)
diff <(ls dir1) <(ls dir2)

# ===============================================================================

# Вывод в команду
echo "data" > >(tee file.log)


# ===============================================================================

# Закрытие FD
command 2>&-
# Закрывает stderr.
ls NO_SUCH_FILE 2>&-
ls >/dev/null 2>&-

# ===============================================================================

# Перенаправление в блоках
{
  echo one
  echo two
} > file



exit 0



не понял про это
6. Process Substitution <(...) и >(...)