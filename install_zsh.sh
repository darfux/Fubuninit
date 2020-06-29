#!/bin/bash
source ./apt_getw.sh

apt_getw -y install git zsh


wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O zsh-install.sh

sed -i "s/env zsh -l//g" zsh-install.sh
sed -i "s/chsh -s/whoami | xargs sudo chsh -s/g" zsh-install.sh

bash zsh-install.sh

rm zsh-install.sh

sed -i "s/export PATH=\"\//export PATH=\"\$PATH:\//" ~/.zshrc
sed -i "s/plugins=(git)/plugins=(git ruby rails)/g" ~/.zshrc
