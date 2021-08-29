# MainsailOS

![Mainsail Logo](https://github.com/meteyou/mainsail/raw/master/docs/assets/img/logo.png?raw=true)

A [Raspberry Pi](https://www.raspberrypi.org/) distribution for 3d Printers. It includes everything to get started with Klipper Fimware and Mainsail.

Learn More about...   
Klipper Firmware: https://www.klipper3d.org/   
Moonraker: https://moonraker.readthedocs.io/en/latest/   
Mainsail: https://docs.mainsail.xyz/   

## Installing

See the installation instructions on the Mainsail documentation page:   
https://docs.mainsail.xyz/setup/mainsail-os

## Community

For additional help, join us in the [Mainsail Discord](https://discord.gg/skWTwTD).

## Screenshots
![screenshot-dashboard](https://github.com/meteyou/mainsail/raw/master/docs/assets/img/screenshot.png?raw=true)

# Build your own / Developing

## Requirements
- [qemu-arm-static](http://packages.debian.org/sid/qemu-user-static)
- [CustomPiOS](https://github.com/guysoft/CustomPiOS)
- [Downloaded Raspbian Image](http://www.raspbian.org/)
- Bash
- Git
- [Docker](https://docs.docker.com/engine/install/ubuntu/)
- [Docker-Compose](https://docs.docker.com/compose/install/)
- QEMU for emulation
- About 5GB of free diskspace for the build

### Packages for Ubuntu 18.04/20.04
** Dekstop variants are known to cause issues during build due to snaps takeing up loop mounts **
```bash
sudo apt-get install gawk make build-essential util-linux \
qemu-user-static qemu-system-arm \
git p7zip-full python3 curl
```

## Compiling source
```bash
git clone https://github.com/raymondh2/MainsailOS.git
cd MainsailOS/
make build
```

### Other make options
```bash
make clean - Clean all previous build items except the source raspian image
make distclean - Clean up the source image and trigger a new download
```

### Build layout
MainsailOS/emulation - Contains dependencies for emulation testing  
MainsailOS/src/image - Contains our base raspbian image  
MainsailOS/src/workspace - Created during build, and output for compiled images
