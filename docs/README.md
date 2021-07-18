# Introduction
V-CoreOS is a preconfigured software package for the Rat Rig V-Core 3, that aims to make it as painless as possible to get Klipper, Fluidd and Moonraker up and running on your printer. It is developed and maintained by Mikkel Schmidt (miklschmidt#2036 on the Rat Rig Unofficial Discord).

To run V-CoreOS on your V-Core 3 you need a supported control board and a Raspberry Pi. The initial configuration is made to work with the official [SKR Pro 1.2 Wiring Diagram](https://v-core.ratrig.com/electronics/#skr-pro-12).



# Troubleshooting
If klipper won't connect, try restarting your raspberry pi. Make sure the SKR Pro is connected to the Pi via USB, that both are powered, and that the firmware.bin has been properly flashed. You can verify the last part by checking if the firmware.bin file has been changed to firmware.CUR on the SD card. If you have trouble flashing the motherboard (a green light should flash while booting, indicating the firmware has been flashed succefully), try disconnecting your endstops, if these are wired incorrectly the board will not boot properly.

If any of your axes are inverted, tripple check your wiring. It's important to note that this config is made specifically for the SKR Pro 1.2 and the 48mm LDO's that ship optionally with the V-Core 3. For other steppers, you'll have to check the stepper pinout and potentially move pins on your cable, or you can override the stepper dir_pins as needed in your printer.cfg after the steppers.cfg file has been included, like so:
```
[stepper_x]
dir_pin: PF1
```

For further support check out the v-coreos and klipper channels on the [Unnofficial RatRig Discord Community](https://v-core.ratrig.com/community/#unofficial-community-on-discord).

# Software Credits

V-CoreOS is based on [Klipper](https://www.klipper3d.org/), [Fluidd](https://docs.fluidd.xyz/), [MainsailOS](https://github.com/raymondh2/MainsailOS) and [FluiddPi](https://github.com/cadriel/FluiddPI), without these and the amazing people behind them, V-CoreOS would not have been possible.
