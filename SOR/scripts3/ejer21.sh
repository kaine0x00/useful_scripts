#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Uso: ejer21 <arg>"
    exit
fi
case $1 in
    cafe|CAFE|Cafe|café)
        echo "Su café estara listo en un momento"
        ;;
    te|TE|Te|té)
        echo -n "Quiere su té con leche?[s/n]: "
        read leche
        while true
        do
            if [ $leche = "s" ]; then
                echo "Enseguida le traigo su té con leche"
                exit
            elif [ $leche = "n" ]; then
                echo "Enseguida le traigo su té solo"
                exit
            else
                echo "por favor, responda correctamente [s/n]:"
                read leche
            fi
        done
        ;;
    chocolate|CHOCOLATE|Chocolate)
        echo "Buena eleccion, ya vera como le encanta"
        ;;
    *)
        echo "Lo siento, pero no servimos esta bebida"
        ;;
esac
