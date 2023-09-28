#!/bin/bash

sudo apt install samba
smbpasswd -a $(whoami) 
systemctl start smb
systemctl enable smb
firewall-cmd --add-service=samba --permanent

