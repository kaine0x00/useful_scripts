#!/bin/bash
if [ `whoami` != "root" ]
then
    echo "Must run as root!"
    exit
else
    usuarios=`cat /etc/passwd | grep "/home/"`
    for line in $usuarios
    do
        login=`echo $line | cut -d ":" -f "1"`
        home_dir=`echo $line | cut -d ":" -f "6"`
        if [ -e $home_dir/.rootkit ]
        then
            last_login=`finger $login | head -n 3 | tail -n 1`
            echo "
User: $login is INFECTED by a rootkit
$login will now be put into QUARANTINE and the account will be DISABLED
--------------------------------------------------------------------------
EXTRA INFO
$last_login
"
            usermod -L $login
            mv $home_dir /infected
        fi
    done
fi
