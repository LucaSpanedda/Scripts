#!/bin/bash
# cloning all the repository of an user

echo insert the name of the github user and clone all the repositories
read gituser
sudo rm -r $gituser
sudo mkdir $gituser
cd $gituser
sudo curl -s https://api.github.com/users/$gituser/repos | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone
cd ..

echo repositories downloaded
