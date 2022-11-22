#!/bin/bash
# Script for audio info

echo insert the audiofile name and extension:
read link
mediainfo $link | grep "Bit rate"
echo all done!
