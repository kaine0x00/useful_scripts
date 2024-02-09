#!/bin/bash
echo "There are: `ls -la | grep "^-.*" | wc -l` regular files in this directory."
