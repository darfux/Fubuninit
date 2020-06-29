
if ENV['USER']!="root"
	puts "YOU NEED RVMSUDO TO RUN THIS!"
	exit
end

require 'yaml'
Dir.glob("lib/*") { |file| require "./#{file}" }
Dir.glob("scripts/*") { |file| require "./#{file}" }



# test

command_list = [
	#:install_chrome,
	#:install_atom,
	#:install_grub_customizer,
	#:install_sogou,
	:setup_sublime,
	:install_official_app,
	:setup_apps,
	:config_git,

	:setup_java,
	:setup_apache_ant,
	:setup_android_studio,

	#:change_theme,
	:setup_gnome_extension,
	:config_favorite,
	:setup_template,
	:config_language_selector,

	#:install_nautilus_actions,
	:setup_compress_fr,

	:setup_nvm_and_node,
]

if ARGV.length > 0
	command_list = command_list & ARGV.collect{ |cmd| cmd.to_sym }
end

command_list.each do |cmd|
	flag_file = "#{Fubuninit::LOG_DIR}/#{cmd}.done"
	unless !File.exists?(flag_file)
		puts "#{cmd} has been done, skip."
		next
	end
	send(cmd)
	File.open(flag_file, "w") {  }
end
