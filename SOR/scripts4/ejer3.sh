#!/bin/bash
if [ $# -ne 1 ]
then
    echo "Uso: ejer3.sh <arg>"
    exit
elif [ -d $1 ]
then
    ls -laR $1
else
    echo "La ruta indicada no pertenece a un directorio"
    exit
fi
