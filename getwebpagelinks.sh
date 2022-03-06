#!/bin/bash
# Script for download all the link from a website page
echo insert the website link:
read link
echo text file name
read linksname 
lynx -dump -listonly $link >> $linksname.txt
echo all the links have been downloaded into a txt file
