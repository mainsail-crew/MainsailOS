Build OctoPi From within OctoPi / Raspbian / Debian / Ubuntu
OctoPi can be built from Debian, Ubuntu, Raspbian, or even OctoPi. Build requires about 2.5 GB of free space available. You can build it by issuing the following commands:

sudo apt-get install gawk util-linux qemu-user-static git p7zip-full python3

git clone https://github.com/guysoft/CustomPiOS.git
git clone https://github.com/guysoft/OctoPi.git
cd OctoPi/src/image
wget -c --trust-server-names 'https://downloads.raspberrypi.org/raspios_lite_armhf_latest'
cd ..
../../CustomPiOS/src/update-custompios-paths
sudo modprobe loop
sudo bash -x ./build_dist
