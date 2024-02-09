#!/bin/bash
multiplo=1
if [ $# -ne 1 ]; then
    echo "Uso: ejer19 <arg>"
    exit
fi
until [ $multiplo -gt 10 ]
do
    let res=$multiplo*$1
    echo "$1 * $multiplo = $res"
    let multiplo=$multiplo+1
done
