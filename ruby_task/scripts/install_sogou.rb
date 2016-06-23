def install_sogou
	return true if AptGet.package_installed?('sogou-qimpanel')

	# download_url = "http://pinyin.sogou.com/linux/download.php?f=linux&bit=64"
	run_bash("cp ../bin/sogou/sogoupinyin_2.0.0.0078_amd64.deb #{Fubuninit::TMP_DIR}/")

	if AptGet.install_deb("sogoupinyin_2.0.0.0078_amd64")==0
		sleep 1
		pid = Process.fork
		if pid.nil? then
			`sudo -EH -u #{ENV['SUDO_USER'].chomp} bash -c 'fcitx > /dev/null'`
			exit
		else
			Process.detach(pid)
		end
		loop do
			break if File.exists? "#{ENV['HOME']}/.config/fcitx/profile"
			puts "waiting for profile create"
			sleep 0.2
		end
		`kill #{pid}`
		sleep 1
		`sed  -i "s/sogoupinyin:False/sogoupinyin:True/g" #{ENV['HOME']}/.config/fcitx/profile`
		`sudo -EH -u #{ENV['SUDO_USER'].chomp} bash -c 'fcitx-remote -r  > /dev/null'`
	end
	puts "Sogou over"
end
