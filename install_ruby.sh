#!/bin/bash

set -eux
set -o pipefail

if [[ ! -f /home/darfux/.rvm/bin/rvm ]]; then
    gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | tail -n +2 | bash -s stable
fi

# \curl -sSL https://get.rvm.io | bash -s stable
set +eux
source /home/darfux/.rvm/scripts/rvm
echo "ruby_url=https://cache.ruby-china.com/pub/ruby" > ~/.rvm/user/db
unset http_proxy
unset https_proxy

rvm requirements
rvm install 3.1.2

/bin/zsh --login -c "rvm use ruby 3.1.2 --default"
/bin/zsh --login -c "ruby -v"
set -eux

echo "export rvmsudo_secure_path=1" >> ~/.bashrc
echo "export rvmsudo_secure_path=1" >> ~/.zshrc

echo "gem: --no-document" >> ~/.gemrc
echo "rvm_silence_path_mismatch_check_flag=1" >> ~/.rvmrc

gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
gem install bundler
bundle config mirror.https://rubygems.org https://gems.ruby-china.com
