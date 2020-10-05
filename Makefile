all: build

build: verifyimage
	docker-compose up -d
	docker exec -it mainsailos-build build
	docker-compose down

verifyimage:
	@if [ ! -f "src/image/raspbian_latest-raspbian.zip" ]; then echo "Raspbian image does not exist. Starting Download..."; curl -J -L  https://downloads.raspberrypi.org/raspios_lite_armhf_latest > src/image/raspbian_latest-raspbian.zip; else \
	echo "Raspbian image found. Starting checksum verification"; curl -J -L https://downloads.raspberrypi.org/raspios_lite_armhf_latest.sha1 > src/image/raspbian_latest-raspbian.zip.sha1; \
	IMAGE_SHA1=`sha1sum src/image/raspbian_latest-raspbian.zip | awk '{print $$1}'`; \
	DL_SHA1=`awk '{print $$1}' src/image/raspbian_latest-raspbian.zip.sha1`; \
	if [ "$$IMAGE_SHA1" != "$$DL_SHA1" ]; then echo "SHAs do not match."; echo "Got $$IMAGE_SHA1"; echo "Expected $$DL_SHA1"; echo "Starting image download"; curl -J -L  https://downloads.raspberrypi.org/raspios_lite_armhf_latest > src/image/raspbian_latest-raspbian.zip; else echo "SHAs Matched"; fi; fi

clean:
	rm -rf src/workspace
	rm -f src/build.log
	rm -f src/image/raspbian_latest-raspbian.zip.sha1

distclean:
	rm -rf src/image/*.zip

test:
	./run.sh
