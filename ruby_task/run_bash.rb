def run_bash(cmd)
	IO.popen(cmd) do |f|
		loop do
			output = f.gets
			puts output
			break if output.nil?
			yield output if block_given?
		end
	end
end