![downloads](https://img.shields.io/github/downloads/mainsail-crew/MainsailOS/total)
[![discord](https://img.shields.io/discord/758059413700345988?color=%235865F2&label=discord&logo=discord&logoColor=white&style=flat)](https://discord.gg/mainsail)

<p align="center">
<img src=".github/sdcard-logo.png" style="width:40%" >
</p>

# MainsailOS

A [Raspberry Pi OS](https://www.raspberrypi.org/software/) based distribution for 3D Printers. \
It includes everything to get started with Klipper Firmware and Mainsail.

Learn more about:

-   [Klipper Firmware](https://www.klipper3d.org/)
-   [Moonraker](https://moonraker.readthedocs.io/en/latest/)
-   [Mainsail](https://docs.mainsail.xyz/)

## How to install MainsailOS ?

You can find detailed instructions in our [documentation](https://docs.mainsail.xyz/setup/mainsail-os).

We recommend the installation via [Raspberry Pi Imager](https://docs.mainsail.xyz/setup/mainsailos/pi-imager).

## Community

For additional help, join us on [Discord](https://discord.gg/mainsail).

[![discord](https://img.shields.io/discord/758059413700345988?color=%235865F2&label=discord&logo=discord&logoColor=white&style=flat)](https://discord.gg/mainsail)

## What is included?

Here a list of included and preinstalled Software:

-   [Klipper (3D Printer Firmware)](https://github.com/KevinOConnor/klipper)
-   [Moonraker (API Web Server for Klipper)](https://github.com/Arksine/moonraker)
-   [Mainsail (Web interface for Klipper/Moonraker)](https://github.com/meteyou/mainsail)
-   [Crowsnest (Webcam streaming)](https://github.com/mainsail-crew/crowsnest)
-   [Sonar (Keepalive daemon)](https://github.com/mainsail-crew/sonar)
-   [Nginx (Webserver & Proxy)](https://nginx.org/en/)

## also includes

-   Enabled Serial Connection by default. \
    Using Hardware UART (PL011) for Boards like BTT SKR Mini E3 V3
-   Preinstalled Dependencies for Klipper's Input Shaper. \
    You only need to build the [klipper_mcu](https://www.klipper3d.org/RPi_microcontroller.html) and installing the service. \
    See [Klipper documentation](https://www.klipper3d.org/Measuring_Resonances.html) for more information.
-   Preinstalled python3-serial package, needed for [CanBoot](https://github.com/Arksine/CanBoot)

## Screenshots

![screenshot-dashboard](https://github.com/mainsail-crew/docs/raw/master/assets/img/screenshot.png)

# Build your own / Developing

To prevent you have to deal with an entire build chain setup, \
simply fork this repository.

Enable the workflows in your fork and you are good to go. \
On each push you make, an image is build and uploaded as an artifact.

If you want or need to build locally please visit [CustomPiOS](https://github.com/guysoft/CustomPiOS). \
Especially ["Build a Distro From within Raspbian / Debian / Ubuntu / CustomPiOS Distros"](https://github.com/guysoft/CustomPiOS#build-a-distro-from-within-raspbian--debian--ubuntu--custompios-distros)
