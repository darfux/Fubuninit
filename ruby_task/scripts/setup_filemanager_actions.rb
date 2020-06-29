def setup_filemanager_actions
	run_bash_file!("filemanager_actions", "ppa")
	run_bash_file("filemanager_actions", "configFR")
end
