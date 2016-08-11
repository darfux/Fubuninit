#!/bin/bash


if [[ "$1" == "sdk" ]]; then
	sdk_package=$(find ../bin/android_studio/android-sdk* -type f)
	tar -xzvf $sdk_package -C $FUB_TMP_DIR
	platform_tools=$(find ../bin/android_studio/platform-tools* -type f)
	unzip $platform_tools -d $FUB_TMP_DIR/android-sdk-linux/
	echo "export PATH=\"\$PATH:/opt/android-sdk/platform-tools\"" >> ~/.profile
fi


if [[ "$1" == "setup" ]]; then
	mv $FUB_TMP_DIR/android-sdk-linux /opt/android-sdk
	ads_package=$(find ../bin/android_studio/android-studio-ide* -type f)
	unzip $ads_package -d /opt/
	cp ../bin/android_studio/jetbrains-studio.desktop /usr/share/applications/
fi
