dconf_profile=/org/gnome/terminal/legacy/profiles:/
dconf write ${dconf_profile}$(dconf list $dconf_profile)login-shell true
