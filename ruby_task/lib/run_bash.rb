def current_user
	(ENV['SUDO_USER'] || ENV['USER']).chomp
end

def _pipe_handler
	lambda do |f|
		loop do
			output = f.gets
			puts output
			break if output.nil?
			yield output if block_given?
		end
	end
end

def run_bash!(cmd)
	IO.popen(cmd, &_pipe_handler)
end

def run_bash(cmd)
	prefix = "sudo -EH -u #{current_user} bash"
	case cmd
	when String
		IO.popen("#{prefix} -c '#{cmd}'", &_pipe_handler)
	when Array
		IO.popen("#{prefix} #{cmd.join(" ")}", &_pipe_handler)
	end
end

def run_bash_file(cmd_file, *args)
	cmd = ["sub_shell/#{cmd_file}.sh"]+args
	run_bash(cmd)
end

def run_bash_file!(cmd_file, *args)
	cmd = ["sub_shell/#{cmd_file}.sh"]+args
	run_bash!(cmd)
end