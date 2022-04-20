#!/bin/bash
# Script for plot a Faust Block Diagram in a single page 

echo insert the file.dsp for plot the full Block Diagram in a single page -svg
read faustfile
faust -sd -sn -fc 1000 -svg $faustfile 
