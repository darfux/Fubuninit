require './fubuninit'
require './run_bash'


def install_chrome
	`which google-chrome`
	if $?.exitstatus == 0
		puts "Chrome already installed"
		return
	end
	chrome_download_url = "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
	chrome_file = "#{Fubuninit::TMP_DIR}/#{chrome_download_url.split('/').last}"
	unless File.exists? chrome_file
		run_bash("proxychains wget #{chrome_download_url} -O #{chrome_file}")
	end
	# run_bash("dpkg -I #{chrome_file}")
	run_bash("dpkg -i #{chrome_file}")
	run_bash("apt-get -y install -f")
end

install_chrome