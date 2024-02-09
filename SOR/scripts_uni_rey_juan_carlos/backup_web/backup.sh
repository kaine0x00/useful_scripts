#!/bin/bash
if [ `whoami` != "root" ]
then
    echo "Must run as root!"
    exit
else
    usuarios=`cat /etc/passwd | grep "/home/al-03-04"`
    for line in $usuarios
    do
        login=`echo $line | cut -d ":" -f "1"`
        logged=`finger $login | head -n 3 | tail -n 1 | grep "Never logged in." | wc -l`
        if [ $logged = "1" ]
        then
            echo "user:$login inactive, DELETING . . ."
            userdel -r $login
        else
            echo "user:$login active, creating BACKUP in /var/tmp/$login"
            mkdir -p "/var/tmp/$login"
            cd "/var/tmp/$login"
            wget -m "http://localhost/~$login" 2>/dev/null
        fi
    done
fi
