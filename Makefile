# Makefile
# This file may distributed under GPL v3
# Original written by Raymond Himle, Nomsplease and Paul Greinadus
# revamped by KwadFan


all: build

build: verifyimage
	docker-compose up -d
	docker exec -it mainsailos-build build
	docker-compose down

verifyimage:
	@if [ ! -f "src/image/2021-12-02-raspios-buster-armhf-lite.zip" ]; \
	then echo "Raspberry Pi OS image does not exist. Starting Download..."; \
	curl -J -L  https://downloads.raspberrypi.org/raspios_oldstable_lite_armhf/images/raspios_oldstable_lite_armhf-2021-12-02/2021-12-02-raspios-buster-armhf-lite.zip > src/image/2021-12-02-raspios-buster-armhf-lite.zip; else \
	echo "Raspberry Pi OS image found. Starting checksum verification"; \
	curl -J -L https://downloads.raspberrypi.org/raspios_oldstable_lite_armhf/images/raspios_oldstable_lite_armhf-2021-12-02/2021-12-02-raspios-buster-armhf-lite.zip.sha256 > src/image/2021-12-02-raspios-buster-armhf-lite.zip.sha256; \
	IMAGE_SHA1=`sha256sum src/image/2021-12-02-raspios-buster-armhf-lite.zip | awk '{print $$1}'`; \
	DL_SHA1=`awk '{print $$1}' src/image/2021-12-02-raspios-buster-armhf-lite.zip.sha256`; \
	if [ "$$IMAGE_SHA256" != "$$DL_SHA256" ]; then echo "SHAs do not match."; \
	echo "Got $$IMAGE_SHA256"; echo "Expected $$DL_SHA256"; \
	echo "SHA256 Sums dont match! Aborting"; \
	exit 1; else echo "SHA256 Sums matched! Continue..."; fi; fi

clean:
	rm -rf src/workspace
	rm -f src/build.log
	rm -f src/image/*.zip.sha1

# dist clean should contain clean as usual
distclean:
	rm -rf src/workspace
	rm -f src/build.log
	rm -rf src/image/*.zip

# /src/workspace is blocked by file Permissions from Docker Container and you are not building as root user
cleanfix:
	sudo chmod -R 0777 ./src/workspace

test:
	./run.sh
