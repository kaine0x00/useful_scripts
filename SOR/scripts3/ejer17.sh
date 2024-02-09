#!/bin/bash
if [ $# -ne 2 ] 
then
    echo "Uso: ejer17.sh <arg1> <arg2>"
    exit
elif [ $1 -lt $2 ]
then
    let suma=$1+$2
    echo "Suma es igual a $suma"
else
    let resta=$1-$2
    echo "Resta es igual a $resta"
fi
