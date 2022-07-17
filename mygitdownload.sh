#!/bin/bash
#cloning all the repository of an user

sudo curl -s https://api.github.com/users/LucaSpanedda/repos | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone
