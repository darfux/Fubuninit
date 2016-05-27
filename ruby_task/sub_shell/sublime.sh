#!/bin/bash

tool_path="$HOME/Tools/SublimeText2"
setting_path="$HOME/.config/sublime-text-2"


if [[ "$1" == "extract" ]]; then
	tar xzf "../bin/sublime/SublimeText2.tar.gz" -C "$HOME/Tools"
	cp "$tool_path/subl.desktop" "$HOME/.local/share/applications"
fi

if [[ "$1" == "gen_bin" ]]; then
	ln -sf "$tool_path/sublime_text" "/usr/bin/subl"
fi

if [[ "$1" == "licence" ]]; then
	cp "$tool_path/License.sublime_license" "$setting_path/Settings"
fi

if [[ "$1" == "package_control" ]]; then
	proxychains wget "https://packagecontrol.io/Package%20Control.sublime-package" \
	-O "$setting_path/Installed Packages/Package Control.sublime-package"
fi

if [[ "$1" == "test" ]]; then
	echo user: $USER
	echo Argu is: $1
fi
