#!/bin/bash

read -p "Enter the file name: " FILENAME

# Extract the file name without extension
BASENAME=$(basename "$FILENAME" | cut -f 1 -d '.')

# Compile the C# code into an executable
mcs -out:"$BASENAME.exe" "$FILENAME"

# Prompt to run the compiled executable
read -p "Do you want to run the compiled executable? (y/n): " RUN

if [[ $RUN == [Yy] ]]; then
  mono "$BASENAME.exe"
  
  # Prompt to delete the compiled executable
  read -p "Do you want to delete the compiled executable? (y/n): " DELETE

  if [[ $DELETE == [Yy] ]]; then
    rm "$BASENAME.exe"
  fi
fi
