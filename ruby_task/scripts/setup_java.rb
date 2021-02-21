def setup_java
	AptGet.install("openjdk-14-jdk")
	run_bash_file("java", "extract")
	run_bash_file!("java", "setup")
end
