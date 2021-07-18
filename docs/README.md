# Introduction
V-CoreOS is a preconfigured software package for the Rat Rig V-Core 3, that aims to make it as painless as possible to get Klipper, Fluidd and Moonraker up and running on your printer. It is developed and maintained by Mikkel Schmidt (miklschmidt#2036 on the Rat Rig Unofficial Discord).

To run V-CoreOS on your V-Core 3 you need a supported control board and a Raspberry Pi. The initial configuration is made to work with the official [SKR Pro 1.2 Wiring Diagram](https://v-core.ratrig.com/electronics/#skr-pro-12).



## Updating

In the settings page in Fluidd, you'll see a sheet with the title "Update Manager", if you're familiar with Fluidd or Mainsail, you'll notice a new entry called `vcore3`. This `vcore3` package will update all the config files in the v-core-3 folder, improvements, support for hotends, extruders etc, will be coming to your printer this way in the future.

## (Optional) Input Shaping using an ADXL345

If you want to use an ADXL345 for automatic input shaper calibration, all the software you need is already installed on the pi, you just need to wire up your ADXL345 to you control board, and you're good to go. A default config is included, check the ADXL345 dropdown at the bottom of [wiring page](https://v-core.ratrig.com/electronics/#skr-pro-12) for how to connect the ADXL directly to the SKR Pro. For other boards it's included in the wiring diagram. Read more about tuning input shaper via an ADXL345 here: https://www.klipper3d.org/Measuring_Resonances.html.


## Finalizing
You'll need to adjust your endstop and probe z-offset before printing and be sure to run PID tuning for your extruder and your bed. After that it's advisable to run [Pressure Advance tuning](https://www.klipper3d.org/Pressure_Advance.html), [Input Shaper calibration](https://www.klipper3d.org/Resonance_Compensation.html) and [Skew Correction](https://www.klipper3d.org/skew_correction.html).

### Quick z-offset adjustment method
An easy way to do probe z-offset calibration is to home the printer, then put a piece of paper underneath. Now babystep Z through the Fluidd interface (or by issuing G0 commands through the console) until the nozzle touches the paper and there's a tiny bit of resistance when you pull on it. Then write "GET_POSITION" in the console and find the line that says `// kinematic: ...` And use the Z coordinate from that line, multiplied by -1. So if it says `// kinematic: X:0.000000 Y:0.000000 Z:-0.400000` Your probe's z_offset will be 0.4.

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
