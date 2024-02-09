#!/bin/bash
if [ $# -ne 2 ]
then
    >&2 echo "Usage: copyright.sh <sourcedir> <license>" 
else
    cd $1
    scripts=`ls *.sh`
    for file in $scripts
    do
        line1=`head -n 1 $file`
        license=`cat $2`
        header="$line1\n$license\n# `date`\n"
        echo -e $header > "tmp$file"
        sed 1d $file >> "tmp$file"
        mv "$file" "borrar.sh"
        rm "borrar.sh"
        mv "tmp$file" "$file"
    done
fi
