def install_grub_customizer
	deb_file = Dir.glob("../bin/grub_customizer/*.deb").first
	AptGet.install_deb(deb_file)
end

