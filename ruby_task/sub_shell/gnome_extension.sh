#!/bin/sh
set -eux
if [[ "$1" == "gnome" ]]; then
	apt-get install -y gnome-session gnome-shell-extensions chrome-gnome-shell gdm3

	# https://itsfoss.com/vanilla-gnome-ubuntu/
	# update-alternatives  --set gdm3.css /usr/share/gnome-shell/theme/gnome-shell.css

	# https://help.gnome.org/admin/system-admin-guide/stable/session-user.html.en
	cp ../bin/gdm/darfux /var/lib/AccountsService/users/darfux
fi

if [[ "$1" == "setup" ]]; then
	rm -rf /home/darfux/.local/share/gnome-shell/extensions/pixel-saver@deadalnix.me
	unzip ../bin/gnome-extensions/pixel-saverdeadalnix.me.v23.shell-extension.zip -d /home/darfux/.local/share/gnome-shell/extensions/pixel-saver@deadalnix.me

	# https://askubuntu.com/questions/1230157/how-to-remove-title-bar-from-terminal-on-the-new-ubuntu-20-04
	gnome-shell-extension-tool -e pixel-saver@deadalnix.me
	gsettings set org.gnome.Terminal.Legacy.Settings headerbar false

	# networkmanager
	rm -rf /home/darfux/.local/share/gnome-shell/extensions/system-monitor@paradoxxx.zero.gmail.com
	unzip ../bin/gnome-extensions/system-monitorparadoxxx.zero.gmail.com.v39.shell-extension.zip -d /home/darfux/.local/share/gnome-shell/extensions/system-monitor@paradoxxx.zero.gmail.com

	dconf  write  /org/gnome/shell/extensions/system-monitor/memory-display false
	dconf  write  /org/gnome/shell/extensions/system-monitor/net-style "'digit'"
	dconf  write  /org/gnome/shell/extensions/system-monitor/disk-usage-style "'bar'"
	dconf  write  /org/gnome/shell/extensions/system-monitor/fan-show-menu false
	dconf  write  /org/gnome/shell/extensions/system-monitor/gpu-show-menu true
	dconf  write  /org/gnome/shell/extensions/system-monitor/net-show-menu false
	dconf  write  /org/gnome/shell/extensions/system-monitor/swap-show-menu false

	gnome-shell-extension-tool -e system-monitor@paradoxxx.zero.gmail.com

	gnome-shell-extension-tool -e drive-menu@gnome-shell-extensions.gcampax.github.com

	# unzip ../bin/gnome-extensions/mediaplayer@patapon.info.zip -d /home/darfux/.local/share/gnome-shell/extensions

	# gnome-shell-extension-tool -e mediaplayer@patapon.info

	dconf write /org/gnome/terminal/legacy/default-show-menubar false
	dconf_profile_path=/org/gnome/terminal/legacy/profiles:/
	dconf_profile=${dconf_profile_path}:$(gsettings get org.gnome.Terminal.ProfilesList default  | sed s/\'//g )/

	# https://developer.gnome.org/glib/stable/gvariant-text.html
	dconf write ${dconf_profile}use-theme-colors false
	dconf write ${dconf_profile}login-shell true
	dconf write ${dconf_profile}background-color "'rgb(48,10,36)'"
	dconf write ${dconf_profile}foreground-color "'rgb(255,255,255)'"
	dconf write ${dconf_profile}visible-name "'darfux'"

	dconf write  /org/gnome/desktop/interface/icon-theme "'Humanity'"
	dconf write  /org/gnome/desktop/interface/monospace-font-name "'Ubuntu Mono 13'"

	dconf write /org/gnome/desktop/sound/input-feedback-sound "false"
fi
