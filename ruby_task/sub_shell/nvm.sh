#!/bin/bash


if [[ "$1" == "install" ]]; then
	proxychains bash -c "wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash"
	proxychains bash -c ". ~/.nvm/nvm.sh; nvm install 4.4.7"
fi


if [[ "$1" == "bower" ]]; then
	proxychains bash -c ". ~/.nvm/nvm.sh; npm install -g bower"
fi
