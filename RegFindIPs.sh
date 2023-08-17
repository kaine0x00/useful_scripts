#!/bin/bash

echo "What is the text file you want to scan for IPs?: "
read FILE 
grep -E '([0-9]{1,3}\.){3}[0-9]{1,3}' ./$FILE
exit