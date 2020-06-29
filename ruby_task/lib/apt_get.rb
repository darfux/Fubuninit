require_relative './fubuninit'
require_relative './run_bash'

class AptGet
class << self
	def install(*package_names)
		# return true if package_installed?(package_name)
		run_bash!("apt-get -y install #{package_names.join(' ')}")
	end
	
	def install_deb(src, file_name=nil)
		install_file = src
		if (/http(|s):\/\// =~ src)==0
			url = src


			file_name ||= url.split('/').last
			file_name += ".deb" if file_name[-3..-1] != "deb"
			install_file = "#{Fubuninit::TMP_DIR}/#{file_name}"
			
			unless File.exists? install_file
				run_bash("aria2c '#{url}' -d '#{Fubuninit::TMP_DIR}' -o #{file_name}")
			end
			src = install_file
		else
			install_file += ".deb" if install_file[-3..-1] != "deb"
			unless File.exists? install_file
				install_file = "#{Fubuninit::TMP_DIR}/#{install_file}"
			end
		end
		# run_bash("dpkg -I #{chrome_file}")
		run_bash!("gdebi -n #{install_file}")

		0
	end


	def package_installed?(package_name, bin_name=nil)
		bin_name ||= package_name
		["dpkg --get-selections | grep '#{package_name}\\s*[^e]install'", 
		"which #{bin_name}"].each do |cmd|
			`#{cmd}`
			if $?.exitstatus == 0
				puts "#{bin_name||package_name} already installed"
				return true
			end
		end
		false
	end
end
end

