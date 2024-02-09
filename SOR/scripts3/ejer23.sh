#!/bin/bash
while [ $# -ne 0 ]
do
    usu_existe=`cat /etc/passwd | grep -w "$1" | wc -l`
    if [ $usu_existe -eq 1 ]
    then
        echo "El usuario $1 ya existe"
        shift
    else
        echo -n "Indique el grupo principal al que pertenecerá el usuario $1: "
        read grupo
        g_existe=`cat /etc/group | grep -w "$grupo" | wc -l`
        if [ $g_existe -eq 1 ]
        then
            echo "El grupo ya existe, creando usuario $1 dentro del grupo . . ."
            sudo useradd -m -g $grupo $1
            shift
        else
            echo "El grupo no existe, creando grupo $grupo . . ."
            sudo groupadd $grupo
            echo "Creando usuario en el nuevo grupo . . ."
            sudo useradd -m -g $grupo $1
            shift
        fi
    fi
done
