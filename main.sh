#!/bin/bash

if [[ ! -z $SUDO_USER ]]; then
	echo "Don't run this in sudo!"
	exit 1
fi

bash setup_directory.sh
bash change_source_list.sh
bash setup_proxy.sh
bash install_zsh.sh
bash install_ruby.sh
bash install_basic_packages.sh
bash dconf_setup.sh
