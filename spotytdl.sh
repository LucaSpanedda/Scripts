#!/bin/bash
# Bash Menu Script for download audio from youtube or spotify + file infos

sudo -v

echo "choose between the options:"
printoptions="1) Spotify 2) Youtube 3) Audiofiles Infos 4) Install 5) Exit"
PS3='Please enter your choice with a number: '
options=("Spotify" "Youtube" "Audiofiles Infos" "Install" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Spotify")
            #filename=$1
	    echo insert the file name of the list with links:
	    read filename
	    while read line; do
	    # reading each line
	    	spotdl download $line
	    done < $filename
	    echo "choose between the options:"
	    echo $printoptions
            ;;
        "Youtube")
            #filename=$1
	    echo insert the file name of the list with links:
	    read filename
	    while read line; do
	    # reading each line
	    	youtube-dl --extract-audio --audio-format mp3 $line
	    done < $filename
	    echo "choose between the options:"
	    echo $printoptions
            ;;
        "Files Infos")
            for i in *.mp3; do file "$i" >> audiofile-info.txt; done
	    cat audiofile-info.txt
	    echo "choose between the options:"
	    echo $printoptions
            ;;
        "Install")
            # audio from youtube app	
	    sudo apt-get install youtube-dl -y
	    # and spotify
	    pip install spotdl
	    sudo apt install ffmpeg
	    echo $printoptions
            ;;
        "Exit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
