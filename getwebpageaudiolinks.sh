#!/bin/bash
# Script for download all the link from a website page and extract the extension
# and commands for the downloads
echo insert the website link:
read link
# from lynx every links from a page in a .txt
lynx -dump -listonly $link >> sitelinks.txt;
# with grep extract every extension 
grep '.aiff\|.aif\|.wav\|.mp3\|.ogg\|.flac\|.m4a' sitelinks.txt >> sitetabextensions-1.txt;
# print the commands for the download
awk '{ print "curl", $2 $3 $4 $5, "-o", $1"file.aiff",  ";"}' sitetabextensions-1.txt >> 0_downloadsitefiles.txt;
echo all the links have been downloaded into a file