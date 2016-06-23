#!/bin/bash

sudo apt-get -y install aria2
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get -y install build-essential libc6:i386 libncurses5:i386 libstdc++6:i386
