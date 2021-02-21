def install_atom
	return true if AptGet.package_installed?('atom')

	run_bash("cp ../bin/atom/atom-amd64.deb #{Fubuninit::TMP_DIR}/")
	AptGet.install_deb("atom-amd64")

	# run_bash_file("atom")
end
