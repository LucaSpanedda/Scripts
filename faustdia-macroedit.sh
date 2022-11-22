#!/bin/bash
# Script for change faust diagrams

echo insert the faust diagram folder name with svg files:
read folder
cd $folder
echo the folder is:
pwd
echo starting the diagram editing with inkscape ...:
for i in *.svg; do inkscape --batch-process --actions="select-all:all;
                                    org.inkscape.color.desaturate.noprefs;
                                    export-filename:$i;
                                    export-do;" $i; done
echo all done!
