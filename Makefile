all: build

build: raspbian_latest-raspbian.zip
	docker-compose up -d 
	docker exec -it mainsailos-build build
	docker-compose down

raspbian_latest-raspbian.zip:
	cd src/image
	curl -J -L  http://downloads.raspberrypi.org/raspbian_latest > src/image/raspbian_latest-raspbian.zip

clean:
	rm -rf src/image/*.zip
	rm -rf src/workspace
	rm -f src/build.log

test:
	echo "Soon.. soon"