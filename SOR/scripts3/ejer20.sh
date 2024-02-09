#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Uso: ejer20 <arg>"
    exit
fi
case $1 in
    cafe|CAFE|Cafe|café)
        echo "Su café estara listo en un momento"
        ;;
    te|TE|Te|té)
        echo "Enseguida le traigo su té"
        ;;
    chocolate|CHOCOLATE|Chocolate)
        echo "Buena eleccion, ya vera como le encanta"
        ;;
    *)
        echo "Lo siento, pero no servimos esta bebida"
        ;;
esac
