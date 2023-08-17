#!/bin/bash
echo "----------------------> PORT SCANNER <----------------------

Use this tool to scan your Network for awake Hosts and open ports.
 
------------------------------------------------------------"
cd "$( dirname "${BASH_SOURCE[0]}" )"

echo -n "Please enter a Network IP address: "
read ip_address
nmap -oN scan.txt -sn $ip_address > /dev/null

./extract_ips.py

echo -n "Would you like to scan for ports too?[y/n]: "
read port_scan

if [ "$port_scan" == "y" ]; then
  nmap -oN IPs_ports.txt -iL IPs.txt > /dev/null
  gedit IPs_ports.txt
fi

if [ "$port_scan" == "n" ]; then
  gedit IPs.txt
fi

sleep 1

echo -n "Would you like to save the results?[y/n]: "
read result_save

if [ "$result_save" == "y" ]; then
  echo "OK! QUITTING APP NOW . . ."
  sleep 2
  exit
fi

if [ "$result_save" == "n" ]; then
  rm ./scan.txt ./IPs.txt ./IPs_ports.txt 2> /dev/null
  echo "OK! QUITTING APP NOW . . ."
  sleep 2
  exit
fi
