#!/bin/bash

set -eux

gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# With proxy:
proxychains curl -sSL https://get.rvm.io | tail -n +2 | proxychains bash -s stable

# \curl -sSL https://get.rvm.io | bash -s stable
set +eux
source /home/darfux/.rvm/scripts/rvm
set -eux

proxychains rvm install ruby --latest

/bin/zsh --login -c "rvm use ruby --latest --default"

/bin/zsh --login -c "ruby -v"

echo "export rvmsudo_secure_path=1" >> ~/.bashrc
echo "export rvmsudo_secure_path=1" >> ~/.zshrc

echo "gem: --no-document" >> ~/.gemrc
echo "rvm_silence_path_mismatch_check_flag=1" >> ~/.rvmrc
