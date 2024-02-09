#!/bin/bash
if [ $# -ne 2 ]
then
    echo "Uso: ejer14.sh <fichero> <palabra>"
    exit
elif [ ! -r $1 ]
then
    echo "El fichero indicado no existe"
    exit
elif [$2 -e ""] 2>/dev/null
then
    echo "Introduzca una cadena de texto no vacia"
    exit
else
    match=`cat $1 | grep ".*$2.*" | wc -l`
    if [ $match -ne 0 ]
    then
        echo "La cadena se encuentra en el fichero"
    else
        echo "La cadena no se encuentra en el fichero"
    fi
fi
