![downloads](https://img.shields.io/github/downloads/mainsail-crew/MainsailOS/total)
[![discord](https://img.shields.io/discord/758059413700345988?color=%235865F2&label=discord&logo=discord&logoColor=white&style=flat)](https://discord.gg/mainsail)

<p align="center">
<img src=".github/sdcard-logo.png" style="width:40%; max-width: 300px;" >
</p>

# MainsailOS

MainsailOS is a pre-configured operating system for your 3D printer's
single-board computer (SBC). It simplifies getting started with Klipper and the
[Mainsail](https://github.com/mainsail-crew/mainsail) web interface by providing
everything you need in one ready-to-use package.

Our images are built on stable, well-supported distributions:

-   **Raspberry Pi:** Based on the official [Raspberry Pi OS](https://www.raspberrypi.com/software/).
-   **Other SBCs:** Based on [Armbian](https://www.armbian.com/) or
    vendor-specific OS builds (e.g., [OrangePiOS](https://github.com/orangepi-xunlong/orangepi-build)).

All images come with the necessary software pre-installed and configured, so you
can focus on printing. For a complete list of what's included, see the
[Features & Components](#features--components) section below.

## Documentation

For detailed installation and setup guides, please visit our official
documentation:

**[docs-os.mainsail.xyz](https://docs-os.mainsail.xyz)**

## Community & Support

Have questions or need help with your setup? Join our active community on
Discord!

**[Mainsail Discord Server](https://discord.gg/mainsail)**

[![discord](https://img.shields.io/discord/758059413700345988?color=%235865F2&label=discord&logo=discord&logoColor=white&style=flat)](https://discord.gg/mainsail)

## Features & Components

MainsailOS comes ready to use with a complete software stack and several key
configurations designed to streamline your setup process.

### Core Software Stack

-   **[Klipper](https://github.com/Klipper3d/klipper):** The core 3D printer
    firmware.
-   **[Moonraker](https://github.com/Arksine/moonraker):** The API server for
    Klipper.
-   **[Mainsail](https://github.com/mainsail-crew/mainsail):** Our modern web
    interface for Klipper.
-   **[Crowsnest](https://github.com/mainsail-crew/crowsnest):** A simple and
    effective webcam streamer wrapper.
-   **[Sonar](https://github.com/mainsail-crew/sonar):** A keepalive daemon to
    ensure WiFi stability.
-   **[Nginx](https://nginx.org/):** A high-performance web server and reverse
    proxy to provide Mainsail and proxy the API.

### Key Configurations & Conveniences

-   **Ready-to-use UART:** The serial connection is enabled by default,
    allowing you to directly connect your printer board without a USB cable.
-   **Input Shaper Ready:** All required Python dependencies for Klipper's
    Input Shaper are pre-installed, saving you setup time and letting you start
    tuning right away.
-   **Katapult Support:** The `python3-serial` package is included, which is a
    necessary dependency for flashing firmware via
    [Katapult (formerly CanBoot)](https://github.com/Arksine/katapult).

## Support the Mainsail-Crew

MainsailOS is a passion project developed and maintained by the Mainsail Crew.
We dedicate a significant amount of our free time, almost daily, to keep the
project alive and moving forward.

Your support directly fuels our development efforts. Donations help us cover
essential costs for hardware, such as new SBCs and SD cards, which are crucial
for testing, developing new features, and expanding board compatibility.

If you find MainsailOS useful, please consider supporting our work. Every
contribution, no matter the size, makes a real difference.

- [GitHub Sponsors](https://github.com/sponsors/mainsail-crew)
- [Patreon](https://www.patreon.com/meteyou)
- [Ko-Fi](https://ko-fi.com/mainsail)

## Building & Development

We've streamlined the build process, allowing you to create your own custom
MainsailOS image without needing a complex local development environment.

### How it Works

1.  **Fork** this repository.
2.  **Customize** your settings or add your own modules.
3.  **Push** your changes to your fork.

Our GitHub Actions workflow will then automatically handle the rest.

### Build Outcomes

-   **On every push:** A new image is built and uploaded as a workflow
    `artifact`, perfect for testing.
-   **For a new release:** Manually trigger the `Release` action to publish a
    formal release with your modifications.

### Need Help?

If you need guidance on customizing the build process or developing your own
modules, feel free to connect with the Crew on our
[Discord](https://discord.gg/mainsail) server in the `#public-dev-talk`
channel.
