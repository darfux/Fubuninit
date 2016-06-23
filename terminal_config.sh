#!/bin/bash


dconf write /org/gnome/terminal/legacy/default-show-menubar false 
dconf_profile_path=/org/gnome/terminal/legacy/profiles:/
dconf_profile=${dconf_profile_path}$(dconf list $dconf_profile_path)

# https://developer.gnome.org/glib/stable/gvariant-text.html
dconf write ${dconf_profile}use-theme-colors false
dconf write ${dconf_profile}login-shell true
dconf write ${dconf_profile}background-color "'rgb(48,10,36)'"
dconf write ${dconf_profile}foreground-color "'rgb(255,255,255)'"
dconf write ${dconf_profile}visible-name "'darfux'"
