#!/usr/bin/env bash
set -e

if [[ -f "./src/config.local" ]]; then
	rm "./src/config.local"
fi
cat "./config/default" >> ./src/config
cat "./config/raspberry/default" >> ./src/config
cat "./config/raspberry/rpi32" >> ./src/config
source ./src/config
IMG_FILENAME=$(basename $DOWNLOAD_URL_CHECKSUM)
if [[ ! -f $IMG_FILENAME ]]; then
	echo "Image not found. Downloading..."
	aria2c -d ./src/image --seed-time=0 $DOWNLOAD_URL_IMAGE
fi
pushd ./src
sudo bash -x ./build_dist
popd
rm "./src/config.local"
