#!/bin/bash

if [[ "$1" == "extract" ]]; then
	tar xvf $(find ../bin/theme -type f) -C $FUB_TMP_DIR
	mv $(find $FUB_TMP_DIR/humanity* -maxdepth 0 -type d)/Humanity* /usr/share/icons
fi

if [[ "$1" == "change" ]]; then
	dconf write /org/gnome/desktop/interface/icon-theme "'Humanity'"
fi

if [[ "$1" == "gtk" ]]; then
	cp ../bin/gtk/gtk.css ~/.config/gtk-3.0/

	#open inspector: GTK_DEBUG=interactive nautilus
	gsettings set org.gtk.Settings.Debug enable-inspector-keybinding true
fi

if [[ "$1" == "favorite" ]]; then
	dconf write /org/gnome/shell/favorite-apps "['google-chrome.desktop', 'atom.desktop', 'org.gnome.Nautilus.desktop', 'git-cola.desktop', 'mysql-workbench.desktop']"
fi
