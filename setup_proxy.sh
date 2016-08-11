#!/bin/bash

cp -r ./base/shadowsocks ~/Tools

chmod 754 ~/Tools/shadowsocks/shadowsocks-local-linux64-1.1.4

mkdir -p ~/.config/autostart/
cp ./base/shadowsocks/shadowsocks-local-linux64-1.1.4.desktop ~/.config/autostart/

nohup ~/Tools/shadowsocks/shadowsocks-local-linux64-1.1.4 > /dev/null & 

cp -r ./base/proxy/.proxychains ~/

sudo apt-get -y install proxychains

sudo sed -i "s/LD_PRELOAD=libproxychains.so.3/LD_PRELOAD=\/usr\/lib\/x86_64-linux-gnu\/libproxychains.so.3/g" /usr/bin/proxychains

sudo apt-get -y install polipo

sudo cp base/polipo/config /etc/polipo 

sudo service polipo restart

