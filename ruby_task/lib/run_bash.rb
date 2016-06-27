require 'open3'

class BashError < Exception
end

def current_user
	(ENV['SUDO_USER'] || ENV['USER']).chomp
end

def _pipe_handler
	lambda do |stdin, stdout, stderr, wait_thr|
		info = ""
		loop do
			output = stdout.gets
			puts output
			break if output.nil?
			info << output
			yield output if block_given?
		end

		err = ""
		loop do
			output = stderr.gets
			break if output.nil?
			err << output
		end
		stdin.close
		stdout.close
		stderr.close
		[wait_thr.value, info, err]
	end
end

def run_bash!(cmd, prefix: nil, with_e: true)
	opt_e = with_e ? "-e" : ""
	ret, info, err = (
		case cmd
		when String
			Open3.popen3("#{prefix} bash #{opt_e} -c '#{cmd}'", &_pipe_handler)
		when Array
			Open3.popen3("#{prefix} bash #{opt_e} #{cmd.join(" ")}", &_pipe_handler)
		end
	)

	if with_e && ret.exitstatus != 0
		puts err
		raise BashError.new
	end
end

def run_bash(cmd)
	prefix = "sudo -EH -u #{current_user}"
	run_bash!(cmd, prefix: prefix)
end

def run_bash_file(cmd_file, *args)
	cmd = ["sub_shell/#{cmd_file}.sh"]+args
	run_bash(cmd)
end

def run_bash_file!(cmd_file, *args)
	cmd = ["sub_shell/#{cmd_file}.sh"]+args
	run_bash!(cmd)
end