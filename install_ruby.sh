#!/bin/bash

sudo apt-get -y install curl

proxychains gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# With proxy:
proxychains curl -sSL https://get.rvm.io | tail -n +2 | proxychains bash -s stable

# \curl -sSL https://get.rvm.io | bash -s stable
source /home/darfux/.rvm/scripts/rvm

proxychains rvm install ruby --latest

/bin/zsh --login -c "rvm use ruby --latest --default"

/bin/zsh --login -c "ruby -v"

echo "export rvmsudo_secure_path=1" >> ~/.bashrc
echo "export rvmsudo_secure_path=1" >> ~/.zshrc

echo "gem: --no-document" >> ~/.gemrc
