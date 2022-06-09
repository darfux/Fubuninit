#!/bin/bash

set -eux
if [[ "$1" == "install" ]]; then
	rm -rf /home/darfux/.nvm
	proxychains bash -c "wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | bash"
	proxychains bash -c ". ~/.nvm/nvm.sh; nvm install node"
	echo "export NVM_DIR=\"/home/darfux/.nvm\"" >> $HOME/.zshrc
	echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && . \"\$NVM_DIR/nvm.sh\" # This loads nvm" >> $HOME/.zshrc
fi


if [[ "$1" == "bower" ]]; then
	bash -c ". ~/.nvm/nvm.sh; npm install -g bower"
fi
