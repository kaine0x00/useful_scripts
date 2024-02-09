#!/bin/bash
echo -n "Escriba numero 1: "
read num1

echo -n "Escriba numero 2: "
read num2

let avg=($num1+$num2)/2
echo "La media aritmetica es: $avg"
