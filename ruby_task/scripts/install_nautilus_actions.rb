def install_nautilus_actions
	return true if AptGet.package_installed?('nautilus-actions')

	run_bash("cp ../bin/nautilus-actions/libunique-3.0-0_3.0.2-3_amd64.deb #{Fubuninit::TMP_DIR}/")
	run_bash("cp ../bin/nautilus-actions/nautilus-actions_3.2.3-1build5_amd64.deb #{Fubuninit::TMP_DIR}/")

	AptGet.install_deb("libunique-3.0-0_3.0.2-3_amd64")
	AptGet.install_deb("nautilus-actions_3.2.3-1build5_amd64")
end
