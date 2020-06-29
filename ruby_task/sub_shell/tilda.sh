#!/bin/bash

mkdir -p ~/.config/tilda
cp ../bin/tilda/config_0 ~/.config/tilda
mv ~/.config/tilda/config_0 ~/.config/tilda/config_0.bak
cp ../bin/tilda/config_0 ~/.config/tilda
cp ../bin/tilda/tilda_reset ~/bin/
chmod +x ~/bin/tilda_reset
cp /usr/share/applications/tilda.desktop ~/.config/autostart/
