#!/bin/bash

pkgs=(
    fcitx
    # gnome-user-docs-zh-hans
    fonts-noto-cjk-extra
    fonts-arphic-uming
    hunspell-en-gb
    # gimp-help-en
    firefox-locale-zh-hans
    fonts-arphic-ukai
    language-pack-zh-hans
    language-pack-gnome-zh-hans
)

sudo apt-get install -y ${pkgs[*]}

im-config -c -n fcitx
