module Fubuninit
	TMP_DIR = '/tmp/fubuninit'
	LOG_DIR = '/var/fubuninit'
end

if !File.exists?(Fubuninit::TMP_DIR)
	Dir.mkdir Fubuninit::TMP_DIR
end

if !File.exists?(Fubuninit::LOG_DIR)
	Dir.mkdir Fubuninit::LOG_DIR
end

`chmod 777 #{Fubuninit::TMP_DIR}`
`chmod 777 #{Fubuninit::LOG_DIR}`
ENV["FUB_TMP_DIR"] = Fubuninit::TMP_DIR
ENV["FUB_LOG_DIR"] = Fubuninit::TMP_DIR
