require './fubuninit'
require './run_bash'


def change_theme
	run_bash_file!("modify_theme", "extract")
	run_bash_file("modify_theme", "change")
	run_bash_file("modify_theme", "gtk")
end

change_theme
