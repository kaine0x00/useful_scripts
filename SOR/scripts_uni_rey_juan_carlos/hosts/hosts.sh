#!/bin/bash
if [ `whoami` != "root" ]
then
    echo "Must run as root!"
    exit
fi
line_num=`cat /etc/hosts | wc -l`
counter=1
content=""
changed=""
while [ $counter -le $line_num ] 
do
    is_gamma_machine=`head -n $counter /etc/hosts | tail -n 1 | grep "gamma" | wc -l`
    if [ $is_gamma_machine = "1" ]
    then
        NN=`head -n $counter /etc/hosts | tail -n 1 | grep -o "..$"`
        res=`head -n $counter /etc/hosts | tail -n 1 | cut -d$'\t' -f "2"`
        let YY=$NN+40
        content="$content\n192.168.4.$YY\t$res"
        changed="$changed\n192.168.4.$YY\t$res"
    else
        res1=`head -n $counter /etc/hosts | tail -n 1 | cut -d$'\t' -f "1"`
        res2=`head -n $counter /etc/hosts | tail -n 1 | cut -d$'\t' -f "2"`
        content="$content\n$res1\t$res2"
    fi
    ((counter++))
done
echo -e $content > /etc/hosts
#echo -e $content > prueba.txt
echo -e "DATOS CAMBIADOS
------------------------------------------------------
$changed
------------------------------------------------------
