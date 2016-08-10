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
		run_bash(%Q{ sed -i s/"#SwitchPreedit=CTRL_ALT_P"/"SwitchPreedit="/g #{ENV['HOME']}/.config/fcitx/config })
		run_bash("fcitx-remote -r  > /dev/null")


		sleep 1
		pid = Process.fork
		if pid.nil? then
			run_bash("sogou-qimpanel > /dev/null")
			exit
		else
			Process.detach(pid)
		end
		loop do
			break if File.exists? "#{ENV['HOME']}/.config/sogou-qimpanel/main.conf"
			puts "waiting for sogou-qimpanel create"
			sleep 1
		end
		sleep 1
		run_bash!("kill #{pid}")
		run_bash("cp  -r ../bin/sogou/Default_black #{ENV['HOME']}/.config/sogou-qimpanel/skin/")
		run_bash("cp  ../bin/sogou/main.conf #{ENV['HOME']}/.config/sogou-qimpanel/")

	end
end
