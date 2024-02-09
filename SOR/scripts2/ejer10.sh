#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Uso: ejer10.sh <fichero>"
elif [ -r $1 ]
then
    cat $1
else
    echo "El fichero no tiene permisos de lectura"
    exit
fi
