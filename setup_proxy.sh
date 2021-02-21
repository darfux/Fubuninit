#!/bin/bash

set -eux

cp -r ./base/shadowsocks ~/Tools

chmod 754 ~/Tools/shadowsocks/shadowsocks-local-linux64-1.1.4

mkdir -p ~/.config/autostart/
cp ./base/shadowsocks/ss_up.desktop ~/.config/autostart/

nohup ~/Tools/shadowsocks/ss_up.sh > /dev/null &

cp -r ./base/proxy/.proxychains ~/

sudo apt-get -y install proxychains

sudo sed -i "s/LD_PRELOAD=libproxychains.so.3/LD_PRELOAD=\/usr\/lib\/x86_64-linux-gnu\/libproxychains.so.3/g" /usr/bin/proxychains

sudo apt-get -y install privoxy
sudo mv /etc/privoxy/config /etc/privoxy/config.bak
sudo cp ./base/proxy/privoxy/config /etc/privoxy/config
sudo systemctl enable privoxy
sudo systemctl restart privoxy

function check_proxy_ok(){
	proxychains curl -vs google.com 2>&1 | grep -q "Could not"
	if [[ $? = 1 ]]; then
		echo proxy ok
	else
		echo Proxy error
		exit 1
	fi
}

check_proxy_ok

#sudo mv /usr/bin/proxychains /usr/bin/proxychains.bak
#sudo cp ./fake_proxychains /usr/bin/proxychains
