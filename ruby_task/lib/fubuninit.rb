module Fubuninit
	TMP_DIR = '/tmp/fubuninit'
end

if !File.exists?(Fubuninit::TMP_DIR)
	Dir.mkdir Fubuninit::TMP_DIR
end

`chmod 777 #{Fubuninit::TMP_DIR}`
ENV["FUB_TMP_DIR"] = Fubuninit::TMP_DIR