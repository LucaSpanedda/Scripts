#!/bin/bash
<<+
Luca Spanedda's OS main configuration script

start the script with the following command:
$ bash spanedda_os_mainconfig.sh | tee report.txt

+
<<+
# redirect stdout/stderr to a file
# exec > report.txt 2>&1 
+

echo "						"   
echo "						"   
echo "       .   *    ..            '		"
echo "              *          .		"
echo "                   *       '		"
echo "              *                *		"
echo "      *      *        *            	"
echo "              				"
echo "		.    *    .      *  .  .	"
echo "   *   '*		.    *    .      *  	"
echo "           *				"
echo "               *'				"
echo "    .    *    .      *  .  .            	"
echo "              '				"
echo "                   *'  .   *    ..	"
echo "        .   *    .	      		"
echo "						"     
echo "						"                   
echo "	personal script for all the software" 
echo "		installations and configurations" 
echo "						"   
echo "						"   

# start here

#  sudo update and upgrade
sudo apt-get update && sudo apt-get upgrade -y

# git
sudo apt-get install git -y

# curl 
sudo apt-get install curl -y

# desktop app icons
sudo apt install gnome-shell-extension-manager -y

# chrome - and install wget
sudo apt install wget
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# snap store
sudo snap install snap-store 

# zoom
sudo snap install zoom-client 
 
# python
sudo apt-get install python3 -y
sudo apt install python3-pip -y
pip install numpy
pip install scipy
pip install -U matplotlib

# pure data
sudo add-apt-repository ppa:pure-data/pure-data -y
sudo apt update
sudo apt install puredata -y

# faust
sudo apt-get install faust

# LaTex
sudo apt-get install texlive-full -y

# texmaker
sudo apt-get install texmaker -y

# zotero
sudo snap install zotero-snap

# lilypond
sudo apt-get install lilypond -y

# inkscape
sudo add-apt-repository universe
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt-get update
sudo apt install inkscape

# download Github User repo
mkdir Gitrepo
cd Gitrepo
mkdir LucaSpanedda
cd LucaSpanedda
sudo curl -s https://api.github.com/users/LucaSpanedda/repos | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone
cd ..
cd ..
echo repositories downloaded

# end here

echo "						"   
echo "						"   
echo "       .   *    ..            '		"
echo "              *          .		"
echo "                   *       '		"
echo "              *                *		"
echo "      *      *        *            	"
echo "              				"
echo "		.    *    .      *  .  .	"
echo "   *   '*		.    *    .      *  	"
echo "           *				"
echo "               *'				"
echo "    .    *    .      *  .  .            	"
echo "              '				"
echo "                   *'  .   *    ..	"
echo "        .   *    .	      		"
echo "						"   
echo "						"     
echo "all done! - see report.txt for more info -" 
echo "						"   
echo "						"   
