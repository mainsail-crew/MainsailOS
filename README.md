![downloads](https://img.shields.io/github/downloads/mainsail-crew/MainsailOS/total)
[![discord](https://img.shields.io/discord/758059413700345988?color=%235865F2&label=discord&logo=discord&logoColor=white&style=flat)](https://discord.gg/skWTwTD) 

# MainsailOS

![Mainsail Logo](https://github.com/meteyou/mainsail/raw/master/docs/assets/img/logo.png?raw=true)

A [Raspberry Pi OS](https://www.raspberrypi.org/software/) based distribution for 3d Printers. It includes everything to get started with Klipper Firmware and Mainsail.

Learn More about...   
Klipper Firmware: https://www.klipper3d.org/   
Moonraker: https://moonraker.readthedocs.io/en/latest/   
Mainsail: https://docs.mainsail.xyz/   

## Installing

See the installation instructions on the Mainsail documentation page:   
https://docs.mainsail.xyz/setup/mainsail-os

## Community

For additional help, join us in the [Mainsail Discord](https://discord.gg/skWTwTD).   

[![discord](https://img.shields.io/discord/758059413700345988?color=%235865F2&label=discord&logo=discord&logoColor=white&style=flat)](https://discord.gg/skWTwTD) 

## What is included?

Here a list of included and preinstalled Software:
* [Klipper (3D Printer Firmware)](https://github.com/KevinOConnor/klipper) 
* [Moonraker (API Web Server for Klipper)](https://github.com/Arksine/moonraker)
* [Mainsail (Web interface for Klipper/Moonraker)](https://github.com/meteyou/mainsail)
* [Mjpeg-streamer (Webcam streaming)](https://github.com/jacksonliam/mjpg-streamer)
* [Nginx (Webserver & Proxy)](https://nginx.org/en/)
* [FFMPEG (upcoming features)](https://www.ffmpeg.org/)

## Screenshots
![screenshot-dashboard](https://raw.githubusercontent.com/mainsail-crew/docs/master/assets/img/screenshot.png)

# Build your own / Developing

## Requirements
- [qemu-arm-static](http://packages.debian.org/sid/qemu-user-static)
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

## Build your own Image of MainsailOS
```bash
git clone https://github.com/mainsail-crew/MainsailOS.git
cd MainsailOS/
make
```

### Other make options
```bash
make clean - Clean all previous build items except the source raspian image
make distclean - Clean up the source image and trigger a new download
make cleanfix - If your build fails you, sometimes, have no Permission to clean. This will chmod to 0777 to grant full access.
```

### Build layout
MainsailOS/emulation - Contains dependencies for emulation testing  
MainsailOS/src/image - Will contain an Raspberry Pi OS Image and according sha1 checksum file
MainsailOS/src/workspace - Created during build, and output for compiled Images


---

## Credits
We want to give a shoutout to [jottr](https://github.com/jottr) for mentioning a naming convention problem.\
In the past we used 'raspbian' at some points for names.\
But this isn't technicaly true.\
MainsailOS is based of Raspberry Pi OS, not raspbian.
