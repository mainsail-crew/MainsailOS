---
id: installation
title: Installating RatOS
sidebar_label: Installation
sidebar_position: 1
---

# Installation

## Raspberry Pi Installation

Download the newest release (download the RatOS-\*.zip file under the assets dropdown) of [RatOS on github](https://github.com/Rat-Os/RatOS/releases).
Then use [Balena Etcher](https://www.balena.io/etcher/) to write that image to the SD card that goes into your raspberry pi (8GB or larger).

Note: this will destroy all data on the card!

<a class="button button--primary" href="https://github.com/Rat-Os/RatOS/releases">Download RatOS</a>

### WIFI or Ethernet

When the RatOS image has been written to the SD card and you've configured your wifi settings, insert the SD card into the Raspberry Pi and turn on the Pi. After a few minutes the raspberry pi will host a hotspot called "RatOS", join this hotspot on your phone or a PC/Laptop with wifi, the password is "raspberry". When connected, open [http://RatOS.local/configure](http://RatOS.local/configure) or [http://192.168.50.1/configure](http://192.168.50.1/configure) and follow the steps presented there to setup wifi and your printers hostname.

Alternatively, if you're using a pi with Ethernet, you can use an ethernet cable instead.

## Preparing your control board

After completing the setup wizard, wait a couple of minutes, then open [http://RatOS.local/](http://RatOS.local/) in your browser (or whatever hostname you chose during setup). This will present you with the mainsail interface. On the left there's a menu option named "Machine", click on that, and you'll see a list of files and folders. There's a folder here called "firmware_binaries", open that folder. You can download the firmware binary for your board from here. Let's move on to the preparation of the control board.

See the documentation for your specific board.

[BIGTREETECH Octopus v1.1](boards/btt/octopus-11.md)

[BIGTREETECH Octopus Pro 446](boards/btt/octopus-pro-446.md)

[BIGTREETECH Octopus Pro 429](boards/btt/octopus-pro-429.md)

[BIGTREETECH SKR Pro v1.2](boards/btt/skr-pro-12.md)

[BIGTREETECH SKR 2](boards/btt/skr-2-429.md)

[Fysetc Spider v1.1](boards/fysetc/spider-11.md)

## Setup

With the control board connected via USB to your Raspberry Pi and the printer turned on, open your browser and navigate to [http://RatOS.local/](http://RatOS.local) or your chosen hostname and proceed to the [configuration guide](configuration).

## Updating

:::caution
It is important that you **don't** update the klipper package _before_ your board connects correctly, because firmware updates will not compile or flash automatically before your board is properly flashed and connected.
:::

After you've configured your printer.cfg and everything is working, go to the `MACHINE` tab in Mainsail. You'll see a sheet with the title "Update Manager", if you're familiar with Fluidd or Mainsail, you'll notice a new entry called `RatOS`. This `RatOS` package will update all the config files in the config folder, improvements, support for hotends, macros, extruders, new boards etc, will be coming to your printer this way in the future. **Be sure to keep this up to date, especially if you update klipper or moonraker**. Always update the RatOS package first, before updating anything else. This is important because Klipper and Moonraker sometimes make changes that require manual system or configuration changes which RatOS will try to do for you.


In general, it's advisable to keep all your packages up to date, but if you're happy with how your printer works and there's nothing interesting for you in the updates, it's perfectly fine to delay updating until a later time. Klipper is a continually evolving project, that also means that bugs _do happen_. In the rare circumstance that bugs are introduced, they're usually fixed very quickly, but if you have a bunch of important prints coming up, maybe delay the updates till afterwards. Now that we've gotten that out of the way, **please go ahead and update RatOS to the latest version**.
