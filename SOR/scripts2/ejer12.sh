#!/bin/bash
while [ $# -ne 0 ]
    do
       if [ -x $1 ]
       then
           echo "El fichero $1 es ejecutable"
       else
           echo "El fichero $1 no es ejecutable"
       fi
       shift
    done
