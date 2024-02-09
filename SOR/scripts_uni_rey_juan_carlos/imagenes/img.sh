#!/bin/bash
if [ $# -ne 1 ]
then
    echo "Uso: img.sh <directorio>"
else
    cd $1
    ficheros=`ls *.jpg`
    converted=0
    deleted=0
    skipped=0
    for file in $ficheros
    do
        is_jpg=`file $file | grep -w "JPEG" | wc -l`
        if [ $is_jpg = "1" ]
        then
            echo "file $file is OK. reducing and publishing . . ."
            sudo convert -geometry 800x600 $file /var/www/$file
            ((converted++))
        else
            echo -n "file $file is CORRUPTED. Delete $file? [y/n]: "
            flag="false"
            until [ $flag = "true" ]
            do
                read delete
                if [ $delete = "y" ]
                then
                    sudo rm $file
                    echo "file: $file DELETED"
                    ((deleted++))
                    flag="true"
                elif [ $delete = "n" ]
                then
                    echo "SKIPPING file $file"
                    ((skipped++))
                    flag="true"
                else
                    echo -n "ERR Format. Delete file? [y/n]: "
                fi
            done
        fi
    done
    echo "
$converted files were OK -> converted and published
$deleted files were CORRUPTED and DELETED
$skipped files were detected as CORRUPTED but SKIPPED by user
    "
fi
