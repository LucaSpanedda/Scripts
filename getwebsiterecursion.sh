#!/bin/bash
# Script for download all the link from a website page
echo insert the website link:
read link
echo insert levels of recursion - 1 to ... 0 is inf:
read recursion
wget -r -l$recursion $link
echo the website has been downloaded