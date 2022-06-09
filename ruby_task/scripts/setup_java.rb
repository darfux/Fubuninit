def setup_java
	AptGet.install("default-jdk")
	# run_bash_file("java", "extract")
	# run_bash_file!("java", "setup")
end
