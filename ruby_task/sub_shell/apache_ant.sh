#!/bin/bash


if [[ "$1" == "extract" ]]; then
	ant_package=$(find ../bin/apache-ant/apache-ant-* -type f)
	mkdir -p $FUB_TMP_DIR/apache-ant
	tar xvf $ant_package -C $FUB_TMP_DIR/apache-ant
fi


if [[ "$1" == "setup" ]]; then
	mv $(find $FUB_TMP_DIR/apache-ant/* -type d | head -n 1) "/opt/"
	cp ../bin/apache-ant/apache-ant.sh /etc/profile.d/
	chmod 644 /etc/profile.d/apache-ant.sh
fi
