#!/bin/bash
# example of usage $ bash faustplot.sh -double IR_Tests.dsp 88200

echo "Generating Faust Plot...";
# $1 = precision: -single -double -quad 
# $2 = faust-file.dsp
# $3 = number of samples

# file without extension ".dsp" 
file_w_e=$(echo $2 | sed 's/\.dsp$//')

# faust 2 CSV Plot 
faust2csvplot $1 $2 && ./$file_w_e -n $3 >> $file_w_e-IR.txt

# remove the first line from the .txt
tail -n +2 $file_w_e-IR.txt >> $file_w_e-IR-$3.txt
rm -r $file_w_e-IR.txt
echo "Done!";