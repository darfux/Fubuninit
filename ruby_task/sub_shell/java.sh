#!/bin/bash
# http://stackoverflow.com/questions/16263556/installing-java-7-on-ubuntu


if [[ "$1" == "extract" ]]; then
	java_package=$(find ../bin/java/jdk* -type f)
	mkdir -p $FUB_TMP_DIR/java
	tar xzf $java_package -C $FUB_TMP_DIR/java
	cp ../bin/java/use_java ~/bin/
fi


if [[ "$1" == "setup" ]]; then
	jvm_path="/usr/lib/jvm/"
	mkdir -p /usr/lib/jvm
	mv $(find $FUB_TMP_DIR/java/* -type d | head -n 1) $jvm_path
	~/bin/use_java oracle
fi
