#!/bin/bash
multiplo=1
if [ $# -ne 1 ]; then
    echo "Uso: ejer18 <arg>"
    exit
fi
while [ $multiplo -lt 11 ]
do
    let res=$multiplo*$1
    echo "$1 * $multiplo = $res"
    let multiplo=$multiplo+1
done
