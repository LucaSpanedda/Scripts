#!/bin/bash
# Script for download a web page
echo insert the website link:
read link
wget $link
echo the website page has been downloaded