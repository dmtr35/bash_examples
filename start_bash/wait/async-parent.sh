#!/bin/bash

# async-parent : пример асинхронного выполнения (родитель)

echo "Parent: starting..."
echo "Parent: launching child script..."
/home/dm/WebstormProjects/bash/start_bash/wait/async-child.sh &

# $!, всегда содержит идентификатор процесса последнего задания, переведенного в фоновый режим.
pid=$!
echo "Parent: child (PID= $pid) launched."

echo "Parent: continuing..."
sleep 2

echo "Parent: pausing to wait for child to finish..."
# wait приостанавливает выполнение, пока указанный PID не завершится
wait $pid

echo "Parent: child is finished. Continuing..."
echo "Parent: parent is done. Exiting."












exit 0