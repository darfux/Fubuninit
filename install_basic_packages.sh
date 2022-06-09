#!/bin/bash
source ./apt_getw.sh

sudo dpkg --add-architecture i386
# TODO: move this to grub customizer install scripts
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
apt_getw update
apt_getw -y install curl aria2 git gdebi build-essential cmake gnupg2 libc6:i386 libncurses5:i386 libstdc++6:i386
