#!/bin/bash

mkdir html 2> /dev/null
for file in *.md; do pandoc "$file" -o "html/${file%.md}.html"; done
7z a notes.7z html/*
