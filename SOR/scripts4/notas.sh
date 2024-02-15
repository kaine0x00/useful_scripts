#!/bin/bash
if [ $# -ne 1 ]
then
    echo "Uso: notas.sh <arg>"
    exit
fi
aprobados=0
echo -n "" > resultados.txt
line_num=`cat $1 | wc -l`
counter=1
while [ $counter -le $line_num ]
do
    login=`head -n $counter $1 | tail -n 1 | cut -d " " -f "1"`
    nota=`head -n $counter $1 | tail -n 1 | cut -d " " -f "2"`
#    echo "Login $login nota $nota loop $counter"
    if [ $nota -ge 5 ]
    then
        echo "$login apto $nota" >> resultados.txt
        ((aprobados++))
    else
        echo "$login no apto $nota" >> resultados.txt
    fi
    ((counter++))
done
counter=1
while [ $counter -le $line_num ]
do
    login=`head -n $counter resultados.txt | tail -n 1 | cut -d " " -f "1"`
    if [ `head -n $counter resultados.txt | tail -n 1 | cut -d " " -f "2"` = "no" ]
    then 
        aptitud=`head -n $counter resultados.txt | tail -n 1 | cut -d " " -f "2 3"`
        nota=`head -n $counter resultados.txt | tail -n 1 | cut -d " " -f "4"`
    else
        aptitud=`head -n $counter resultados.txt | tail -n 1 | cut -d " " -f "2"`
        nota=`head -n $counter resultados.txt | tail -n 1 | cut -d " " -f "3"`
    fi
    
    echo "
Enviando mail a $login@pantuflo.es
----------------------------------------------
$login $aptitud con la nota: $nota
Presentados: $line_num
Aprobados: $aprobados
    "
    
    echo "
$login $aptitud con la nota: $nota
Presentados: $line_num
Aprobados: $aprobados
    " | mail -s "RESULTADOS" "$login@pantuflo.es"

    ((counter++))
done
