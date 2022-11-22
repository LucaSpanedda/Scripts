#!/bin/bash
# Script for plot a Faust Block Diagram in a single page 
# Then convert as pdf with rsvg
# Install: sudo apt-get install librsvg2-bin
 
echo insert the file name without .dsp extension and plot the full Block Diagram
read faustfile
faust -sd -sn -fc 1000 -svg $faustfile.dsp

cd $faustfile-svg
rsvg-convert -f pdf -o process.pdf process.svg
cd .. 
