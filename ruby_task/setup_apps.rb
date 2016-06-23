require './fubuninit'
require './run_bash'


def setup_apps
	run_bash_file("filezilla")
	run_bash_file("tilda")
end

setup_apps
