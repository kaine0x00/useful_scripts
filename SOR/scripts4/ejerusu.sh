#!/bin/bash
cat /etc/passwd | sort | cut -d ":" -f "1,6,7"
