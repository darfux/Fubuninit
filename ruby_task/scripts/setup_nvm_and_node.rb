def _setup_nvm_env
	new_contents = []
	profile = "#{ENV['HOME']}/.profile"
	File.open(profile, "r") do |file|
		file.each_line do |l|
			if l=~/Add RVM/
				new_contents << "export NVM_DIR=\"/home/darfux/.nvm\"\n"
				new_contents << "[ -s \"\$NVM_DIR/nvm.sh\" ] && . \"\$NVM_DIR/nvm.sh\" # This loads nvm\n\n"
			end
			new_contents << l
		end
	end

	File.open(profile, "w") do |file|
		file.print new_contents.join
	end
end

def setup_nvm_and_node
	run_bash_file("nvm", "install")
	_setup_nvm_env
	run_bash_file("nvm", "bower")
end
