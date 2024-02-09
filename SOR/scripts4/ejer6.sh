#!/bin/bash
if [ $# -lt 1 ]
then
    echo "Uso: ejer6.sh <arg> <arg2> .. <argn>"
    exit
fi
for arg in $*
do
    killall -9 $arg
done
