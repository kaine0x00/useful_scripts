#!/bin/bash
if [ $# -eq 0 ] 2>/dev/null
then
    echo "There are: `ls -la | grep "^-.*" | wc -l` regular files in this directory."
elif [ -e $1 ]
then
    echo "There are: `ls -la $1 | grep "^-.*" | wc -l` regular files in this directory."
else
    echo "El fichero no existe"
fi
