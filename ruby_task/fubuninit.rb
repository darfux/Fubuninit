module Fubuninit
	TMP_DIR = '/tmp/fubuninit'
end

if !File.exists?(Fubuninit::TMP_DIR)
	Dir.mkdir Fubuninit::TMP_DIR
end