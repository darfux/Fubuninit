def setup_nvm_and_node
	run_bash_file("nvm", "install")
	run_bash_file("nvm", "bower")
end