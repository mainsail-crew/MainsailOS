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

### WIFI (Optional)

:::danger Important

Do **NOT** use a textprocessor such as Wordpad, it will mangle the file and your pi won't boot. Notepad, Notepad++, VSCode are all fine.

:::

When the process is complete, find the `/boot` volume / folder on the sd card. If you're having trouble finding the boot volume, try reinserting the SD card into your PC. Edit the `ratos-wpa-supplicant.txt` file found on the boot volume in a text editor and fill out your wifi information. **Remember to change the country code at the bottom of the file.**

## Preparing your control board

When the RatOS image has been written to the SD card and you've configured your wifi settings, insert the SD card into the Raspberry Pi and turn on the Pi. Wait a couple of minutes, then open [http://RatOS.local/](http://ratos.local/) in your browser. This will present you with the mainsail interface. On the left there's a menu option named "Machine", click on that, and you'll see a list of files and folders. There's a folder here called "firmware_binaries", open that folder. You can download the firmware binary for your board from here. Let's move on to the preparation of the control board.

See the documentation for your specific board.

[BIGTREETECH Octopus v1.1](/docs/boards/btt/octopus-11)

[BIGTREETECH Octopus Pro 446](/docs/boards/btt/octopus-pro-446)

[BIGTREETECH Octopus Pro 429](/docs/boards/btt/octopus-pro-429)

[BIGTREETECH SKR Pro v1.2](/docs/boards/btt/skr-pro-12)

[Fysetc Spider v1.1](/docs/boards/fysetc/spider-11)

## Setup

With the control board connected via USB to your Raspberry Pi and the printer turned on, open your browser and navigate to [http://RatOS.local/](http://RatOS.local) and proceed to the [configuration guide](configuration).

## Updating

:::caution
It is important that you **don't** update the klipper package _before_ your board connects correctly, because firmware updates will not compile or flash automatically before your board is properly flashed and connected.
:::

After you've configured your printer.cfg and everything is working, go to the `MACHINE` tab in Mainsail. You'll see a sheet with the title "Update Manager", if you're familiar with Fluidd or Mainsail, you'll notice a new entry called `RatOS`. This `RatOS` package will update all the config files in the config folder, improvements, support for hotends, macros, extruders, new boards etc, will be coming to your printer this way in the future. **Be sure to keep this up to date, especially if you update klipper**. In general, it's advisable to keep all your packages up to date, but if you're happy with how your printer works and there's nothing interesting for you in the updates, it's OK to delay updating until a later time. Klipper is a continually evolving product, that also means that bugs _do happen_. In the rare circumstance that bugs are introduced, they're usually fixed very quickly, but if you have a bunch of important prints coming up, maybe delay the updates till afterwards. Now we've got that out of the way, **please go ahead and update everything to the latest version**.
