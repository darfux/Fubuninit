def change_theme
	AptGet.install("libgtk-3-dev")
	# run_bash_file!("modify_theme", "extract")
	run_bash_file("modify_theme", "change")
	run_bash_file("modify_theme", "gtk")
end
