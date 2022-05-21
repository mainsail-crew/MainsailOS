![downloads](https://img.shields.io/github/downloads/mainsail-crew/MainsailOS/total)
[![discord](https://img.shields.io/discord/758059413700345988?color=%235865F2&label=discord&logo=discord&logoColor=white&style=flat)](https://discord.gg/skWTwTD)

# MainsailOS

![Mainsail Logo](https://github.com/meteyou/mainsail/raw/master/docs/assets/img/logo.png?raw=true)

A [Raspberry Pi OS](https://www.raspberrypi.org/software/) based distribution for 3d Printers. \
It includes everything to get started with Klipper Firmware and Mainsail.

Learn More about... \
Klipper Firmware: https://www.klipper3d.org/ \
Moonraker: https://moonraker.readthedocs.io/en/latest/ \
Mainsail: https://docs.mainsail.xyz/

## Installing

See the installation instructions on the Mainsail documentation page:
https://docs.mainsail.xyz/setup/mainsail-os

## Community

For additional help, join us on [Discord](https://discord.gg/skWTwTD).

[![discord](https://img.shields.io/discord/758059413700345988?color=%235865F2&label=discord&logo=discord&logoColor=white&style=flat)](https://discord.gg/skWTwTD)

## What is included?

Here a list of included and preinstalled Software:

-   [Klipper (3D Printer Firmware)](https://github.com/KevinOConnor/klipper)
-   [Moonraker (API Web Server for Klipper)](https://github.com/Arksine/moonraker)
-   [Mainsail (Web interface for Klipper/Moonraker)](https://github.com/meteyou/mainsail)
-   [Crowsnest (Webcam streaming)](https://github.com/mainsail-crew/crowsnest)
-   [Sonar (Keepalive daemon)](https://github.com/mainsail-crew/sonar)
-   [Nginx (Webserver & Proxy)](https://nginx.org/en/)

## Screenshots

![screenshot-dashboard](https://raw.githubusercontent.com/mainsail-crew/docs/master/assets/img/screenshot.png)

# Build your own / Developing

To prevent you have to deal with an entire build chain setup, \
simply fork this repository.

Enable the workflows in your fork and you are good to go. \
On every push you make, it will build an Image and upload it as artifact.

If you want or need to build locally please visit [CustomPiOS](https://github.com/guysoft/CustomPiOS). \
Especially ["Build a Distro From within Raspbian / Debian / Ubuntu / CustomPiOS Distros"](https://github.com/guysoft/CustomPiOS#build-a-distro-from-within-raspbian--debian--ubuntu--custompios-distros)
