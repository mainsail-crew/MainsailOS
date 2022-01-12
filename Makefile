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
	@if [ ! -f "src/image/oldstable-raspios-lite.zip" ]; then \
	echo -e "\nRaspberry Pi OS image does not exist. Starting Download...\n"; \
	curl https://downloads.raspberrypi.org/raspios_oldstable_lite_armhf_latest \
	-JLo src/image/oldstable-raspios-lite.zip; fi;

	@if [ ! -f "src/image/oldstable-raspios-lite.zip.sha256" ]; then \
	echo -e "Get sha256 Checksum file\n"; \
	curl https://downloads.raspberrypi.org/raspios_oldstable_lite_armhf_latest.sha256 \
	-JLo src/image/oldstable-raspios-lite.zip.sha256; fi; \

	@echo -e "Starting checksum verification\n"
	@IMAGE_SHA256=`sha256sum src/image/oldstable-raspios-oldstable-lite.zip | awk '{print $$1}'` ; \
	DL_SHA256=`awk '{print $$1}' ./src/image/oldstable-raspios-lite.zip.sha256` ; \
	if [ $$IMAGE_SHA256 != $$DL_SHA256 ]; then echo -e "SHAs do not match.\n"; \
	echo -e "Image has checksum:\t $$IMAGE_SHA256"; \
	echo -e "Expected checksum:\t $$DL_SHA256"; \
	echo -e "\nSHA256 Sums dont match! Aborting\n"; exit 1; \
	else echo -e "SHA256 Sums matched! Continue...\n"; fi;

clean:
	rm -rf src/workspace
	rm -f src/build.log
	rm -f src/image/*.zip.sha*

# dist clean should contain clean as usual
distclean:
	rm -rf src/workspace
	rm -f src/build.log
	rm -rf src/image/*.zip

# /src/workspace is blocked by file Permissions from Docker Container and you are not building as root user
cleanfix:
	sudo chmod -R 0777 src/workspace

test:
	./run.sh
