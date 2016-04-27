require './apt_get'


def install_chrome
	return true if package_installed?('google-chrome')

	chrome_download_url = "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
	AptGet.install_deb(chrome_download_url)
end

install_chrome