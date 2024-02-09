#!/bin/bash
# instrucciones de uso
if [ $# -eq 0 ] 2>/dev/null
then
    echo "Uso: ejer07.sh fich"
    exit
fi

# compruebo si el primer argumento es ejecutable
if [ -x $1 ]
then
    echo "fich es ejecutable"
else
    echo "fich no es ejecutable"
fi
