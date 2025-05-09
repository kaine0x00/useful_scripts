#!/bin/bash

yay -Qe | awk '{print $1}' | while read pkg; do
    yay -Qi "$pkg" | awk -v name="$pkg" '
    /^Installed Size/ {
        size=$4; unit=$5;
        if (unit=="KiB") size_kib=size;
        else if (unit=="MiB") size_kib=size*1024;
        else if (unit=="GiB") size_kib=size*1024*1024;
        printf "%.0f KiB %s\n", size_kib, name;
    }'
done | sort -n -r -k1 > size.txt
