#!/bin/bash

# +         Addition
# -         Subtraction
# *         Multiplication
# /         Division
# %         Modulo
# +=        Incrementing by a constant
# -=        Decrementing by a constant

# вычисление с помощью команды "let"
let result="4 * 5"
echo ${result}

# вычислиние с помощью двойных скобок "()"
result=$((5 * 5))
echo ${result}


# вычисление с помощью команды "expr"
result=$(expr 5 + 505)
echo ${result}



exit 0