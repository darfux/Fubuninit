#!/bin/bash
source ./apt_getw.sh

sudo dpkg --add-architecture i386
apt_getw update
apt_getw -y install curl aria2 gdebi build-essential libc6:i386 libncurses5:i386 libstdc++6:i386
