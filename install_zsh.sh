#!/bin/bash
source ./apt_getw.sh

apt_getw -y install git zsh

set -eux

wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O $TMP_DIR/zsh-install.sh

bash $TMP_DIR/zsh-install.sh --unattended
echo "change to zsh"
chsh -s /usr/bin/zsh

sed -i "s/export PATH=\"\//export PATH=\"\$PATH:\//" ~/.zshrc
sed -i "s/plugins=(git)/plugins=(git ruby rails)/g" ~/.zshrc
