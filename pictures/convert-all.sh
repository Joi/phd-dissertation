#!/bin/bash
for file in *.jpg; do
    convert "$file" "eps/${file%.jpg}.eps"
done
