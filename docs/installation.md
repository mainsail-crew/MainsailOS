# Installation

## Raspberry Pi Installation

Download the newest release (download the RatOS-\*.zip file under the assets dropdown) of [RatOS on github](https://github.com/Rat-Os/RatOS/releases).
Then follow [The offical raspberry pi guide](https://www.raspberrypi.org/documentation/installation/installing-images/) to write that image to the SD card that goes into your raspberry pi (8GB or larger)

Note: this will destroy all data on the card!

<a class="button" href="https://github.com/Rat-Os/RatOS/releases">Download RatOS</a>

### WIFI (Optional)

!> **Important** Do **NOT** use a textprocessor such as Wordpad, it will mangle the file and your pi won't boot. Notepad, Notepad++, VSCode are all fine.\*

When the process is complete, find the `/boot` volume / folder on the sd card. If you're having trouble finding the boot volume, try reinserting the SD card into your PC. Edit the `vcoreos-wpa-supplicant.txt` file found on the boot volume in a text editor and fill out your wifi information. Note the country code at the bottom of the file.

When that is done reinsert the SD card into the Raspberry Pi, but don't turn on your printer / Raspberry Pi just yet.

## Preparing your control board

See the documentation for your specific board.

[Big Tree Tech Octopus v1.1](boards/btt/octopus-11.md)

[Big Tree Tech SKR Pro v1.2](boards/btt/skr-pro-12.md)

## Setup

With the control board connected via USB to your Raspberry Pi, turn on your printer. After a couple of minutes, open your browser and navigate to [http://RatOS.local/](http://RatOS.local) and proceed to the [configuration guide](configuration.md).

## Updating

!> It is important that you don't update the klipper package _before_ your board connects correctly, because firmware updates will not compile or flash automatically before your board is properly flashed and connected.

After you've configured your printer.cfg and everything is working, go to the `MACHINE` tab in Mainsail. You'll see a sheet with the title "Update Manager", if you're familiar with Fluidd or Mainsail, you'll notice a new entry called `ratos`. This `ratos` package will update all the config files in the config folder, improvements, support for hotends, macros, extruders, new boards etc, will be coming to your printer this way in the future. **Be sure to keep this up to date, especially if you update klipper**. In general, it's advisable to keep all your packages up to date, but if you're happy with how your printer works and there's nothing interesting to you in the updates, it's OK to delay updating until a later time. Klipper is a continually evolving product, that also means that bugs _do happen_, they're usually fixed very quickly, but if you have a bunch of important prints coming up, maybe delay the updates till afterwards. Now we've got that out of the way, please go ahead and update everything to the latest version.
