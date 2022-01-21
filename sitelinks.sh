#!/bin/bash
# Script for download all the link from a website page
echo insert the website link:
read link
lynx -dump -listonly $link >> sitelinks.txt
echo all the links have been downloaded into a file

