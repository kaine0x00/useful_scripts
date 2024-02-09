#!/bin/bash
if [ $# -lt 2 ]
then
    echo "Necesitas al menos dos argumentos"
    exit
fi
n=$#
suma=0
while [ $# -ne 0 ]
    do
        let suma=suma+$1
        shift
    done

echo "La suma de los $n numeros indicados es: $suma"
