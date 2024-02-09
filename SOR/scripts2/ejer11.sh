#!/bin/bash
for argument in "$@"
    do
       if [ -x $argument ]
       then
           echo "El fichero $argument es ejecutable"
       else
           echo "El fichero $argument no es ejecutable"
       fi
    done
