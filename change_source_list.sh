#!/bin/bash

UBUNTU_VERSION=xenial

sources_name=$UBUNTU_VERSION.sources.list

cp ./sources.list.template ./$sources_name

sed -i "s/{UBUNTU_VERSION}/xenial/g"  ./$sources_name

sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo mv ./$sources_name /etc/apt/sources.list
sudo apt-get update