#!/bin/bash


if [[ "$1" == "sdk" ]]; then
	sdk_package=$(find ../bin/android_studio/android-sdk* -type f)
	tar -xzvf $sdk_package -C $FUB_TMP_DIR
	echo "export PATH=\"\$PATH:/opt/android-studio-linux/sdk/platform-tools\"" >> ~/.profile
fi


if [[ "$1" == "setup" ]]; then
	mv $FUB_TMP_DIR/android-sdk-linux /opt/
	ads_package=$(find ../bin/android_studio/android-studio-ide* -type f)
	unzip $ads_package -d /opt/
	cp ../bin/android_studio/jetbrains-studio.desktop /usr/share/applications/
fi
