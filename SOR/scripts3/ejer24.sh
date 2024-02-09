#!/bin/bash
while true 
do
echo -n "
SCRIPT 24 | ELIJA UNA OPCION
-----------------------------------------------------------------------
> 1) Ver los procesos en ejecucion 
> 2) Ver los dispositivos montados
> 3) Comprobar si un paquete esta instalado
> 4) Salir
ACCION: "
read accion
case $accion in
    1)
        ps aux
        ;;
    2)
        findmnt
        ;;
    3)
        echo -n "Escriba el paquete a comprobar: "
        read package
        existe=`dpkg -l | cut -d " " -f 3 | grep -w "$package" | wc -l`
        if [ $existe -ge 1 ]
        then
            echo "El paquete esta instalado"
        else
            echo "El paquete no existe o no esta instalado"
        fi
        ;;
    4)
        echo "Saliendo . . ."
        exit
        ;;
    *)
        echo "ERROR: Accion fuera de rango"
        ;;
esac
done
