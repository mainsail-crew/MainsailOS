#!/usr/bin/env bash
set -e

if [[ -f "./src/config" ]]; then
	rm "./src/config"
fi
cat "./config/default" >> ./src/config
cat "./config/raspberry/default" >> ./src/config
cat "./config/raspberry/rpi64" >> ./src/config
source ./src/config
IMGCOUNT=$(ls ./src/image/*raspios-bullseye-arm64*.img.xz | wc -l)
if [ $IMGCOUNT -eq 0 ]; then
	echo "Downloading image..."
	rm -f ./src/image/*
	aria2c -d ./src/image --seed-time=0 $DOWNLOAD_URL_IMAGE
fi
exit 0
pushd ./src
sudo bash -x ./build_dist
popd
rm "./src/config"
