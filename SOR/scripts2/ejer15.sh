#!/bin/bash
n=$#
regulares=0
directorios=0
while [ $# -ne 0 ]
    do
        if [ -f $1 ]
        then
            let regulares=regulares+1
        elif [ -d $1 ]
        then
            let directorios=directorios+1
        else
            echo "El argumento $1 no es ni directorio ni fichero"
        fi
        shift
    done

echo "Se han introducido $n parametros"
echo "$regulares de ellos eran ficheros regulares"
echo "$directorios de ellos eran directorios"
