#!/bin/bash

read -p "Enter the file name: " FILENAME
BASENAME=$(basename "$FILENAME" | cut -f 1 -d '.')

g++ -std=c++20 "$FILENAME" -o "$BASENAME"
chmod +x "$BASENAME"

read -p "Do you want to run the compiled executable? (y/n): " RUN

if [[ $RUN == [Yy] ]]; then
  ./"$BASENAME"
  
  read -p "Do you want to delete the compiled executable? (y/n): " DELETE

  if [[ $DELETE == [Yy] ]]; then
    rm "$BASENAME"
  fi
fi