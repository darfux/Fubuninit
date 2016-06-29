module Fubuninit
	TMP_DIR = '/tmp/fubuninit'
	VAR_DIR = '/var/fubuninit'
	LOG_DIR  = VAR_DIR
end

if !File.exists?(Fubuninit::TMP_DIR)
	Dir.mkdir Fubuninit::TMP_DIR
end

if !File.exists?(Fubuninit::VAR_DIR)
	Dir.mkdir Fubuninit::VAR_DIR
end

`chmod 777 #{Fubuninit::TMP_DIR}`
`chmod 777 #{Fubuninit::LOG_DIR}`
ENV["FUB_TMP_DIR"] = Fubuninit::TMP_DIR
ENV["FUB_VAR_DIR"] = Fubuninit::VAR_DIR
ENV["FUB_LOG_DIR"] = Fubuninit::LOG_DIR
