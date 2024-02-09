#!/bin/bash
echo -n "Introduzca un numero: "
read num
if [ $num -ge 10 ]
then
    echo "Tu numero es mayor o igual a 10"
else
    echo "Tu numero es menor que 10"
fi
