#!/bin/bash

SHELL=/bin/sh               # Создание переменной оболочки
export SHELL                # Помещение переменной в среду процесса оболочки
# env | grep "SHELL"
# ---------------------------------------
# bash
# SHELL=/bin/bash bash        # ИМЯ=значение программа   

# env -i /bin/bash            # ignore environment
# env -i USER=dm /bin/bash    # Запуск с ОДНОЙ переменной
USER=dm /bin/bash           # добавляет/переопределяет переменную