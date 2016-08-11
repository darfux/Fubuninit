def setup_apache_ant
	run_bash_file("apache_ant", "extract")
	run_bash_file!("apache_ant", "setup")
end
