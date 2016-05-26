require './apt_get'


def install_chrome
	return true if AptGet.package_installed?('google-chrome')

	download_url = "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
	AptGet.install_deb(download_url)
end

install_chrome