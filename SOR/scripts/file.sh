#!/bin/bash
echo "hello world"
echo -n "Fecha y hora: "
date
echo -n "Numero de usuarios conectados: "
who | wc -l
echo -n "Directorio actual: "
pwd
echo "Hoy es: `date` :)"
