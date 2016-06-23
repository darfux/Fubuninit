require './fubuninit'
require './run_bash'

def setup_template
	run_bash("mkdir ~/Templates")
	run_bash("touch ~/Templates/Text")
end

setup_template