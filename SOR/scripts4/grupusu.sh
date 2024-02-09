#!/bin/bash
exists=`cat /etc/group | grep -w "^$1" | wc -l`
if [ $# -ne 1 ]
then
    echo "Uso: grupusu.sh <arg>"
elif [ $exists = "1" ]
then
    gid=`cat /etc/group | grep -w $1 | cut -d ":" -f "3"`
    echo "
Usuarios con el grupo $1 como grupo principal:
------------------------------------------------------------"
    cat /etc/passwd | grep ".*:.*:$gid:.*" | sort | cut -d ":" -f "1"
    echo "
Usuarios con el grupo $1 como grupo secundario:
------------------------------------------------------------"
    secundarios=`cat /etc/group | grep "$1" | cut -d ":" -f "4" | sed 's/,/\n/g'`
    echo $secundarios
else
    echo "El grupo indicado no existe"
fi
