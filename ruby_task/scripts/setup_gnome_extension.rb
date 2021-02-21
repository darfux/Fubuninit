def setup_gnome_extension
	AptGet.install("gir1.2-gtop-2.0", "gir1.2-nm-1.0", "gir1.2-clutter-1.0")
	run_bash_file!("gnome_extension", "gnome")
	run_bash_file("gnome_extension", "setup")
end
