#!/bin/bash
# Script for download audio from youtube

echo insert the website link:
read link
echo filename - duration - format
youtube-dl --extract-audio --audio-format best --get-filename --get-duration --get-format $link
mkdir original-youtube-audio
cd original-youtube-audio
youtube-dl --extract-audio --audio-format best $link
cd ..
mkdir mp3-youtube-audio
cd mp3-youtube-audio
youtube-dl --extract-audio --audio-format mp3 $link
cd ..
echo all done!