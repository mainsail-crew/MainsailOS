<p align="center">
<img src=".github/sdcard-logo.png" style="width:40%">
</p>

# G1OS

A [Raspberry Pi OS](https://www.raspberrypi.org/software/) based distribution designed specifically for the **Ginger G1** 3D Printer. It includes all the necessary software and optimizations to get started with **Klipper Firmware** and **Mainsail** for 3D printing with **pellet extrusion** technology.

This project is a **fork of [MainsailOS](https://github.com/mainsail-crew/MainsailOS)**, tailored for the unique requirements of pellet-based 3D printing with the Ginger G1.

## Learn more about:

-   [Klipper4Pellet (Firmware for Pellet 3D Printing)](https://github.com/gingeradditive/klipper4pellet)
-   [Moonraker (API Web Server for Klipper)](https://github.com/Arksine/moonraker)
-   [Mainsail (Web Interface for Klipper)](https://github.com/mainsail-crew/mainsail)

<!-- ## How to install G1OS?

Detailed installation instructions can be found in our [documentation](https://docs-os.mainsail.xyz), with a section dedicated to the **Ginger G1**. We recommend using the [Raspberry Pi Imager](https://docs-os.mainsail.xyz/getting-started/raspberry-pi-os-based) for installation. -->
<!-- 
## Need help?

Join our community on [Discord](https://discord.gg/mainsail) for support. You can also check the FAQ below for common issues. -->

[![discord](https://img.shields.io/discord/758059413700345988?color=%235865F2&label=discord&logo=discord&logoColor=white&style=flat)](https://discord.gg/mainsail)

## What's included?

G1OS comes with the following pre-installed and configured software:

-   [Klipper4Pellet (Customized Klipper Firmware for Pellet 3D Printing)](https://github.com/gingeradditive/klipper4pellet)
-   [Moonraker (API for Klipper)](https://github.com/Arksine/moonraker)
-   [Mainsail (Klipper Web Interface)](https://github.com/mainsail-crew/mainsail)
-   [Crowsnest (Webcam Streaming)](https://github.com/mainsail-crew/crowsnest)
-   [Sonar (Keepalive Daemon)](https://github.com/mainsail-crew/sonar)
-   [Nginx (Web Server & Proxy)](https://nginx.org/en/)

## G1OS also includes:

-   **Preconfigured Serial Connection** for the Ginger G1 using Hardware UART (PL011).
-   **Preinstalled Dependencies** for Klipper's Input Shaper. Simply build the [klipper_mcu](https://www.klipper3d.org/RPi_microcontroller.html) and install the service. See [Klipper documentation](https://www.klipper3d.org/Measuring_Resonances.html) for more info.
-   **Preinstalled Python3-serial package**, required for [CanBoot](https://github.com/Arksine/CanBoot).

## Screenshots

![screenshot-dashboard](https://github.com/mainsail-crew/docs/raw/master/assets/img/screenshot.png)

# FAQ

**Q:** How do I report a bug?  
**A:** Please ensure it's not a configuration issue with:

-   Klipper
-   Moonraker
-   Crowsnest
-   Sonar

If the issue is specific to the **G1OS** setup or the Ginger G1 printer, report it via the **G1OS** GitHub Issues section. Provide detailed information to help us resolve the problem quickly.

**Q:** What is the philosophy behind G1OS?  
**A:** We maintain a **KISS** principle—Keep It Simple and Straightforward. G1OS is built on the same foundation as **MainsailOS**, but optimized for pellet printing with the Ginger G1. We aim to keep things as close to the Raspberry Pi OS and MainsailOS documentation as possible, providing extra documentation only where needed.

**Q:** How can I contribute?  
**A:** Contributions are always welcome! Please check out the [CONTRIBUTING.md](https://github.com/mainsail-crew/MainsailOS/blob/develop/CONTRIBUTING.md) for ways to support the project or submit code.

# Build your own / Development

To build your own version of **G1OS**, simply fork this repository, enable workflows, and each push will trigger an automated image build.

For more information on local builds, please refer to [CustomPiOS](https://github.com/guysoft/CustomPiOS) and the guide ["Build a Distro From within Raspbian/Debian/Ubuntu/CustomPiOS Distros"](https://github.com/guysoft/CustomPiOS#build-a-distro-from-within-raspbian--debian--ubuntu--custompios-distros).
