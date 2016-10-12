#!/bin/sh

if [[ "$1" == "setup" ]]; then
	unzip ../bin/gnome-extensions/maximus-two@wilfinitlike.gmail.com.zip -d /home/darfux/.local/share/gnome-shell/extensions

	gnome-shell-extension-tool -e maximus-two@wilfinitlike.gmail.com



	# networkmanager

	unzip ../bin/gnome-extensions/system-monitor@paradoxxx.zero.gmail.com.zip -d /home/darfux/.local/share/gnome-shell/extensions

	dconf  write  /org/gnome/shell/extensions/system-monitor/memory-display false
	dconf  write  /org/gnome/shell/extensions/system-monitor/net-style "'digit'"

	gnome-shell-extension-tool -e system-monitor@paradoxxx.zero.gmail.com

	gnome-shell-extension-tool -e drive-menu@gnome-shell-extensions.gcampax.github.com

	unzip ../bin/gnome-extensions/mediaplayer@patapon.info.zip -d /home/darfux/.local/share/gnome-shell/extensions

	gnome-shell-extension-tool -e mediaplayer@patapon.info
fi
