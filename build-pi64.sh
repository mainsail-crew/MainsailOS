#!/usr/bin/env bash
set -e

if [[ -f "./src/config.local" ]]; then
	rm "./src/config.local"
fi
cat "./config/default" >> ./src/config
cat "./config/raspberry/default" >> ./src/config
cat "./config/raspberry/rpi64" >> ./src/config
source ./src/config
echo "Downloading image..."
aria2c -d ./src/image --seed-time=0 $DOWNLOAD_URL_IMAGE
pushd ./src
sudo bash -x ./build_dist
popd
rm "./src/config"
