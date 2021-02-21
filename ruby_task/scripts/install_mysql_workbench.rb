def install_mysql_workbench
	return true if AptGet.package_installed?('mysql-workbench-community')

	run_bash("cp ../bin/mysql-workbench/mysql-workbench-community_8.0.23-1ubuntu20.04_amd64.deb #{Fubuninit::TMP_DIR}/")
	# download_url = "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
	AptGet.install_deb("mysql-workbench-community_8.0.23-1ubuntu20.04_amd64")
end
