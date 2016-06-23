require 'yaml'
Dir.glob("lib/*") { |file| require "./#{file}" }
Dir.glob("scripts/*") { |file| require "./#{file}" }

install_chrome
install_grub_customizer
install_sogou
setup_sublime
install_official_app
setup_apps
config_git

setup_java
setup_android_studio

change_theme
setup_gnome_extension
config_favorite
setup_template
