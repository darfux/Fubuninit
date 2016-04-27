require './fubuninit'
require './run_bash'

class AptGet
class << self
	def install_deb(src)
		if (/http(|s):\/\// =~ src)==0
			url = src
			install_file = "#{Fubuninit::TMP_DIR}/#{url.split('/').last}"
			
			unless File.exists? install_file
				run_bash("proxychains wget #{url} -O #{install_file}")
			end
			src = install_file
		end
		# run_bash("dpkg -I #{chrome_file}")
		run_bash("dpkg -i #{install_file}")
		run_bash("apt-get -y install -f")
	end

	def package_installed?(bin_name)
		`which #{bin_name}`
		if $?.exitstatus == 0
			puts "#{bin_name} already installed"
			return true
		end
		false
	end
end
end

