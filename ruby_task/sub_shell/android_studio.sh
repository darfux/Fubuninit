#!/bin/bash

if [[ "$1" == "setup" ]]; then
	ads_package=$(find ../bin/android_studio/android-studio-ide* -type f)
	sdk_package=$(find ../bin/android_studio/android-sdk* -type f)
	unzip $ads_package -d /opt/
	unzip $sdk_package -d /opt/android-studio
	mv /opt/android-studio/android-sdk-linux /opt/android-studio/sdk
	cp ../bin/android_studio/jetbrains-studio.desktop /usr/share/applications/
	echo "export PATH=\"\$PATH:/opt/android-studio/sdk/platform-tools\"" >> ~/.profile
fi
