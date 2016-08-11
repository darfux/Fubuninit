#!/bin/bash

UBUNTU_VERSION=xenial

sources_name=$UBUNTU_VERSION.sources.list

cp ./sources.list.template ./$sources_name

sed -i "s/{UBUNTU_VERSION}/xenial/g"  ./$sources_name

sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo mv ./$sources_name /etc/apt/sources.list




# https://github.com/chef/bento/issues/609
# sudo touch /etc/apt/apt.conf.d/10disable-auto-apt
# sudo bash -c 'echo "APT::Periodic::Enable \"0\";" > /etc/apt/apt.conf.d/10disable-auto-apt'

# sudo sed -i "s/Update\-Package\-Lists \".*\"/Update\-Package\-Lists \"0\"/" /etc/apt/apt.conf.d/10periodic

# sudo sed -i "s/Update\-Package\-Lists \".*\"/Update\-Package\-Lists \"0\"/" /etc/apt/apt.conf.d/20auto-upgrades
# sudo sed -i "s/Unattended\-Upgrade \".*\"/Unattended\-Upgrade \"0\"/" /etc/apt/apt.conf.d/20auto-upgrades



# sudo apt-get update

