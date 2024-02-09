#!/bin/bash
# instrucciones de uso
if [ $# -eq 0 ] 2>/dev/null
then
    echo "Uso: ejer09.sh fich"
    exit
elif [ -e $1 ] 
then
    chmod +x $1
else
    echo "El fichero no existe"
fi
