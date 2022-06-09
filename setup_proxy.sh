#!/bin/bash

set -eux

if ! ps -ef | grep [s]hadow; then
    cp -r ./base/shadowsocks ~/Tools/
    chmod 754 ~/Tools/shadowsocks/shadowsocks-local-linux64-1.1.5
    mkdir -p ~/.config/autostart/
    cp ./base/shadowsocks/ss_up.desktop ~/.config/autostart/
    nohup bash ~/Tools/shadowsocks/ss_up.sh > /dev/null &
fi

if ! command -v proxychains; then
    sudo apt-get -y install proxychains
    sudo sed -i "s/LD_PRELOAD=libproxychains.so.3/LD_PRELOAD=\/usr\/lib\/x86_64-linux-gnu\/libproxychains.so.3/g" /usr/bin/proxychains
fi
rm -rf ~/.proxychains
cp -r ./base/proxy/.proxychains ~/

sudo apt-get -y install privoxy
sudo mv /etc/privoxy/config /etc/privoxy/config.bak.$(date +%s)
sudo cp ./base/proxy/privoxy/config /etc/privoxy/config
sudo chmod 644 /etc/privoxy/config
sudo systemctl enable privoxy
sudo systemctl restart privoxy

function check_proxy_ok(){
	if proxychains curl -vs google.com; then
		echo proxy ok
	else
		echo Proxy error
		exit 1
	fi
}

check_proxy_ok

#sudo mv /usr/bin/proxychains /usr/bin/proxychains.bak
#sudo cp ./fake_proxychains /usr/bin/proxychains
