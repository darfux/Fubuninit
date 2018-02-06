def install_tidy_html5
	return true if AptGet.package_installed?('tidy')

	# download_url = "http://pinyin.sogou.com/linux/download.php?f=linux&bit=64"
	run_bash("cp ../bin/tidy-html5/tidy-5.4.0-64bit.deb #{Fubuninit::TMP_DIR}/")

	AptGet.install_deb("tidy-5.4.0-64bit")
end