#!/bin/bash

git config --global user.name "darfux"
git config --global user.email "darfux@163.com"

# http://stackoverflow.com/questions/3659602/bash-script-for-generating-ssh-keys
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
