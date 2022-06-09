def install_chrome
	return true if AptGet.package_installed?('google-chrome')

	# TODO: change to download
	run_bash("cp ../bin/chrome/google-chrome-stable_current_amd64.deb #{Fubuninit::TMP_DIR}/")
	# download_url = "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
	AptGet.install_deb("google-chrome-stable_current_amd64")
end
