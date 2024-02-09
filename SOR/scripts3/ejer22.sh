#!/bin/bash
existe=`cat /etc/passwd | grep -w "$1" | wc -l`
if [ $# -ne 1 ]; then
    echo "Uso: ejer22 <arg>"
    exit
elif [ $existe -eq 1 ]; then
    sudo tar -vcf /tmp/$1.tar /home/$1
else
    echo "El usuario indicado no existe"
fi
