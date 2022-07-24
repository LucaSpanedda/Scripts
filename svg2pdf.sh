#!/bin/bash
# Script for convert svg to pdf
 
echo convert svg to pdf
echo insert the name of the file you want to convert without  extension
read firstfile
echo insert the converted file name without extension
read secondfile

rsvg-convert -f pdf -o $secondfile.pdf $firstfile.svg
