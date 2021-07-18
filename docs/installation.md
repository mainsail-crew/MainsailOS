# Installation

## Raspberry Pi Installation

Download the newest release (includes a firmware.bin and a vcoreos-*.zip file under the assets dropdown) of [VCoreOS on github](https://github.com/Rat-Rig/V-CoreOS/releases).
Then follow [The offical raspberry pi guide](https://www.raspberrypi.org/documentation/installation/installing-images/) to write that image to the SD card that goes into your raspberry pi (8GB or larger) 

Note: this will destroy all data on the card!

<a class="button" href="https://github.com/Rat-Rig/V-CoreOS/releases">Download V-CoreOS</a>

### WIFI (Optional)

!> **Important** Do **NOT** use a textprocessor such as Wordpad, it will mangle the file and your pi won't boot. Notepad, Notepad++, VSCode are all fine.*

When the process is complete, find the `/boot` volume / folder on the sd card. If you're having trouble finding the boot volume, try reinserting the SD card into your PC. Edit the `vcoreos-wpa-supplicant.txt` file found on the boot volume in a text editor and fill out your wifi information. Note the country code at the bottom of the file.

When that is done reinsert the SD card into the Raspberry Pi, but don't turn on your printer / Raspberry Pi just yet.

## Preparing your control board

See the documentation for your specific board.

[Big Tree Tech Octopus v1.1](boards/btt/octopus-11.md)

[Big Tree Tech SKR Pro v1.2](boards/btt/skr-pro-12.md)

## Setup

With the control board connected via USB to your Raspberry Pi, turn on your printer. After a couple of minutes, open your browser and navigate to [http://v-coreos.local/](http://v-coreos.local)


## Updating

In the settings page in Fluidd, scroll to the bottom (or click "Software Updates") and you'll see a sheet with the title "Software Updates", if you're familiar with Fluidd or Mainsail, you'll notice a new entry called `v-coreos`. This `v-coreos` package will update all the config files in the config folder, improvements, support for hotends, macros, extruders, new boards etc, will be coming to your printer this way in the future. Be sure to keep this up to date, especially if you update klipper.