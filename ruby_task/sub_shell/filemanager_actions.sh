#!/bin/bash

if [[ "$1" == "ppa" ]]; then
	add-apt-repository -y ppa:daniel-marynicz/filemanager-actions
	apt install -y filemanager-actions-nautilus-extension
fi
