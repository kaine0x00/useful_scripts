#!/bin/bash
echo -n "Input subnet: "
read subnet
for arg in $*
do
    ping -w 2 "$subnet.$arg" > /dev/null
    if [ $? = "0" ]
    then
        echo "La IP $subnet.$arg responde"
    else
        echo "La IP $subnet.$arg no responde"
    fi
done
