def setup_sublime
	run_bash_file("sublime", "extract")
	t = Thread.new do
		run_bash("$HOME/Tools/SublimeText2/sublime_text")
	end
	sleep 1
	`pkill sublime_text`
	run_bash_file("sublime", "licence")
	run_bash_file("sublime", "package_control")
	run_bash_file!("sublime", "gen_bin")
end
