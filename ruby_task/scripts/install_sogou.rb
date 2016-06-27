def install_sogou
	return true if AptGet.package_installed?('sogou-qimpanel')

	# download_url = "http://pinyin.sogou.com/linux/download.php?f=linux&bit=64"
	run_bash("cp ../bin/sogou/sogoupinyin_2.0.0.0078_amd64.deb #{Fubuninit::TMP_DIR}/")

	if AptGet.install_deb("sogoupinyin_2.0.0.0078_amd64")==0
		sleep 1
		pid = Process.fork
		if pid.nil? then
			run_bash("fcitx > /dev/null")
			exit
		else
			Process.detach(pid)
		end
		loop do
			break if File.exists? "#{ENV['HOME']}/.config/fcitx/profile"
			puts "waiting for profile create"
			sleep 0.2
		end
		run_bash!("kill #{pid}")
		sleep 1
		run_bash("sed  -i \"s/sogoupinyin:False/sogoupinyin:True/g\" #{ENV['HOME']}/.config/fcitx/profile")
		run_bash("fcitx-remote -r  > /dev/null")
		run_bash("xdg-open  ../bin/sogou/Default_black.ssf")
	end
end
