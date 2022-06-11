#!/bin/bash
# Script for convert jpg to scalar svg and eps

echo insert the file name without .jpg extension
read jpgfile
convert $jpgfile.jpg $jpgfile.ppm;
potrace -s $jpgfile.ppm -o $jpgfile.svg;
convert $jpgfile.svg eps3:$jpgfile.eps;
