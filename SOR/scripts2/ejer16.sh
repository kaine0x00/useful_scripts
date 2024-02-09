#!/bin/bash
echo -n "Introduzca un directorio: "
read dir
while true
    do
        if [ -d $dir ]
        then
           regulares=`ls -la $dir | grep "^-.*" | wc -l`
           directorios=`ls -la $dir | grep "^d.*" | wc -l`
           echo "Hay $regulares ficheros regulares y $directorios directorios"
           exit
        else
           echo "El argumento indicado no es un directorio valido, introduzca otro: "
           read dir
        fi
    done
