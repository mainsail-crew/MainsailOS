# Troubleshooting

## My steppers are running backwards!

Refer to the stepper section at the top of printer.cfg, you can add or remove `!` in front of the dir_pin to reverse the direction of that particular stepper.

## Everytime i update my changes are gone.

You're not supposed to change _any_ files inside the config/ folder. You should _only_ change your printer.cfg, if you need to change settings refer to the [Configuration: overrides](configuration.md#overrides) section.

## Klipper says the MCU is unable to connect

Double check your USB connection, try another cable (the one that comes with the board usually works), and check that your firmware was flashed correctly (refer to the guide for your board).

## I updated klipper and now i get an error!

When you update klipper you might see an error that looks like this:

![Firmware version mismatch between host and guest](_media/firmware_version_mismatch.png)

This is because klipper made changes to a part of the MCU firmware that we use. Klipper is telling us that the version of klipper running on the Pi is newer than the version running on the MCU. To fix this, we have to flash the board with a new version of the firmware. For convenience, and ease of use, the newest firmware is compiled and uploaded to the latest [RatOS Release](https://github.com/Rat-OS/RatOS/releases) on a regular basis, you can use this to flash your MCU the same way you did initially. RatOS also supplies a script that you can run on your Pi, which will compile the firmware and flash the board for you, refer to the RatOS documentation for your board if you want to go that route. The benefit of using the script is that you are not dependent on the RatOS developers uploading a new version of the firmware.

## Get help

For further support check out the RatOS-support and klipper channels on Discord. Use the invite link below to join.

<a href="https://discord.gg/D62e8XNeYa" class="button">Join the Unnofficial RatRig Discord Community</a>
