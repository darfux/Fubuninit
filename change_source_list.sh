#!/bin/bash

UBUNTU_VERSION=$(lsb_release -c -s)

sources_name=$UBUNTU_VERSION.sources.list

cp ./sources.list.template $TMP_DIR/$sources_name

sed -i "s/{UBUNTU_VERSION}/$UBUNTU_VERSION/g"  $TMP_DIR/$sources_name

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo mv $TMP_DIR/$sources_name /etc/apt/sources.list




# https://github.com/chef/bento/issues/609
# sudo touch /etc/apt/apt.conf.d/10disable-auto-apt
# sudo bash -c 'echo "APT::Periodic::Enable \"0\";" > /etc/apt/apt.conf.d/10disable-auto-apt'

# sudo sed -i "s/Update\-Package\-Lists \".*\"/Update\-Package\-Lists \"0\"/" /etc/apt/apt.conf.d/10periodic

# sudo sed -i "s/Update\-Package\-Lists \".*\"/Update\-Package\-Lists \"0\"/" /etc/apt/apt.conf.d/20auto-upgrades
# sudo sed -i "s/Unattended\-Upgrade \".*\"/Unattended\-Upgrade \"0\"/" /etc/apt/apt.conf.d/20auto-upgrades



# sudo apt-get update
