#!/bin/bash
usuarios=`cat /etc/passwd | cut -d ":" -f 1 | grep "alumno"` 
for usuario in $usuarios 
do
    sudo userdel -r $usuario
done
