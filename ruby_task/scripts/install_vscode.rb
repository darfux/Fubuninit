def install_vscode
	return true if AptGet.package_installed?('code')

	run_bash("cp ../bin/vscode/code_1.67.2-1652812855_amd64.deb #{Fubuninit::TMP_DIR}/")
	AptGet.install_deb("code_1.67.2-1652812855_amd64")
end
