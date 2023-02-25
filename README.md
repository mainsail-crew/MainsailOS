![downloads](https://img.shields.io/github/downloads/mainsail-crew/MainsailOS/total)
[![discord](https://img.shields.io/discord/758059413700345988?color=%235865F2&label=discord&logo=discord&logoColor=white&style=flat)](https://discord.gg/mainsail)

<p align="center">
<img src=".github/sdcard-logo.png" style="width:40%" >
</p>

# MainsailOS

A Linux Distribution based on

-   [Raspberry Pi OS](https://www.raspberrypi.org/software/) for Raspberry SBC's
-   [Armbian](https://www.armbian.com/) for several SBC's
-   [Orange Pi OS](http://www.orangepi.org/html/softWare/orangePiOS/index.html) for Orange Pi Zero 2

to run your 3D Printers with [mainsail](https://github.com/mainsail-crew/mainsail). \
It includes everything to get started with Klipper Firmware and Mainsail.

Learn more about:

-   [Klipper Firmware](https://www.klipper3d.org/)
-   [Moonraker](https://moonraker.readthedocs.io/en/latest/)
-   [Mainsail](https://docs.mainsail.xyz/)
-   [Crowsnest](https://github.com/mainsail-crew/crowsnest)
-   [Sonar](https://github.com/mainsail-crew/sonar)

## How to install MainsailOS ?

You can find detailed instructions in our [documentation](https://docs.mainsail.xyz/setup/mainsail-os).

We recommend the installation for Raspberry images via [Raspberry Pi Imager](https://docs.mainsail.xyz/setup/mainsailos/pi-imager).

For other images, we recommend [balena-etcher](https://www.balena.io/etcher).

## Currently supported Single Board Computer's (SBC)

| Single Board Computer |                                    OS based on                                     |  32/64bit  |
| :-------------------: | :--------------------------------------------------------------------------------: | :--------: |
|     Raspberry Pi      |           [Raspberry Pi OS lite](https://www.raspberrypi.org/software/)            |  32/64bit  |
|   Orange Pi Zero 2    | [Orange Pi OS server](http://www.orangepi.org/html/softWare/orangePiOS/index.html) | 64bit only |
|    Orange Pi 3 LTS    |                  [Armbian cli minimal](https://www.armbian.com/)                   | 64bit only |
|    Orange Pi 4 LTS    |                  [Armbian cli minimal](https://www.armbian.com/)                   | 64bit only |

_NOTE: Raspberry Pi Models Zero, 2 and 1 are not recommended, even they might run with_

Hopefully, we can improve existing images and add more SBC's.\
Hardware donations for testing and developing are welcome :wink:

## How to get help?

Please join us on [Discord](https://discord.gg/mainsail), if you need additional help.

[![discord](https://img.shields.io/discord/758059413700345988?color=%235865F2&label=discord&logo=discord&logoColor=white&style=flat)](https://discord.gg/mainsail)

Also see the [FAQ](#faq) section.

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
    Using Hardware UART (PL011) for Boards like BTT SKR Mini E3 V3 on Raspberry Pi's
    Using UART5 on Orange Pi Zero2 (/dev/ttyS5)
-   Enabled i2c and SPI for Raspberry and Orange Pi Zero 2
-   Preinstalled Dependencies for Klipper's Input Shaper. \
    You only need to build the [klipper_mcu](https://www.klipper3d.org/RPi_microcontroller.html) and installing the service. \
    See [Klipper documentation](https://www.klipper3d.org/Measuring_Resonances.html) for more information.
-   Preinstalled python3-serial package, needed for [CanBoot](https://github.com/Arksine/CanBoot)

## Screenshots

![screenshot-dashboard](https://github.com/mainsail-crew/docs/raw/master/assets/img/screenshot.png)

# FAQ

**Q:** How do I report a Bug?
**A:** First of all make sure it is _not_ an misconfiguration of

-   moonraker
-   klipper
-   crowsnest
-   sonar

If there is a bug that belongs to the OS itself,
please look first at the official Forum of Raspberry Pi OS.\
MainsailOS is based on Raspberry Pi OS and is only slightly modified to\
carry the basics to run Klipper on your 3D Printer.
Most configuration of the single components is up to you.
We only want to provide an Image as a starting point.

If there is something that is a bug caused due to the misconfiguration of MainsailOS itself, please let us know, and we will take action as soon as possible.
Please use the issue section for that.
Please provide as much information as you can.

**Q:** What is the philosophy behind MainsailOS?
**A:** KISS - Keep it simple and stupid.\
We only do a bit of modification. All other documented things of the Raspberry Foundation apply.

And that's our main goal of staying compatible with existing documentation.
We will provide documentation if something is handled differently than the original documentation.

**Q:** How do I contribute/support?
**A:** There are several ways to contribute or support our work.
Please take a closer look to [CONTRIBUTING.md](https://github.com/mainsail-crew/MainsailOS/blob/develop/CONTRIBUTING.md)

# Build your own / Developing

To prevent you have to deal with an entire build chain setup, \
simply fork this repository.

Enable the workflows in your fork and you are good to go. \
On each push you make, an image is build and uploaded as an artifact.

If you want or need to build locally please visit [CustomPiOS](https://github.com/guysoft/CustomPiOS). \
Especially ["Build a Distro From within Raspbian / Debian / Ubuntu / CustomPiOS Distros"](https://github.com/guysoft/CustomPiOS#build-a-distro-from-within-raspbian--debian--ubuntu--custompios-distros)
