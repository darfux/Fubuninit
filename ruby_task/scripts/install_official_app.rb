def install_official_app
	app_list= YAML.load(File.read("app_list.yaml"))

	app_list.each do |app|
		next true if AptGet.package_installed?(app)
		AptGet.install(app)
		puts "#{app} over"
	end
end
