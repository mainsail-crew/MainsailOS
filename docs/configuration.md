# Configuring RatOS

RatOS only needs minimal configuration to work, but comes with a lot of optional functionality that you can enable manually.

## Introduction

Once you have completed the initial [setup](installation.md) and opened [http://RatOS.local/](RatOS.local) in your browser, you are almost ready to print. There's a just a few things to go over to make sure the configuration matches your particular setup.

## Mainsail

Mainsail is the control interface for your printer. Mainsail is a web application that talks to Klipper through Moonraker (the Klipper API). Mainsail is what you'll be using to start prints, monitor progress, configure klipper and much more. Mainsail is what you see when you open [http://RatOS.local/](http://RatOS.local/);

![Mainsail](_media/mainsail.png)

?> To learn more about mainsail, [read the mainsail documentation](https://docs.mainsail.xyz/).

## Initial Configuration

In the configuration page in Fluidd (the webinterface you just opened in your browser), there's a list of files, among them is `printer.cfg`. Right click it and choose "Edit". This is where your klipper configuration lives. As you can see, it's prepopulated with some included files which are meant to get you up and running quick and easy. **Follow the instructions in the file to make sure the configuration matches your setup.**

!> RatOS comes preconfigured for the V-Core 3, to use other printers, copy the contents of the printer template from `config/templates/` to your printer.cfg

## Verify Stepper Directions

!> Do NOT use RatOS with other than stock steppers. If you are using different steppers please make sure to check their rating, and configure their currents accordingly ([see Includes & Overrides](#includes-amp-overrides)).

Make sure your steppers are running in the correct direction. To do this, center all your axes by moving the carriage and bed manually, then type `SET_CENTER_KINEMATIC_POSITION` in the console. You can now use the fluidd controls to move the axes. Check that your bed moves down when Z is **increased**. By default, the Z controls in the fluidd interface will increase Z when you click the up arrow. This will lower the bed on a CoreXY machine with a moving bed such as the V-Core 3. If your bed does not move down when you click the up arrow, change the direction of your Z steppers in printer.cfg. There's instructions on how to do that at the top of printer.cfg.

?> If you want to invert the Z behavior in the fluidd interface (ie. making the bed move down when you click the down arrow), click the cog (settings) in the left part of the interface, then tool, and then enable "Invert Z Control". This will **NOT** change your stepper directions, it will only change what gcode the buttons execute.

## Verify Endstops and Z-Probe

Navigate to the tuning tab. In here you can see your bed mesh (once calibrated), and your endstop state. Refresh the endstop state and verify that all endstops are open, and that the state changes to triggered when you manually trigger the endstops or z-probe and refresh the endstop state.

?> To test, debug and/or verify a BLTouch, refer to the [BLTouch klipper documentation](https://www.klipper3d.org/BLTouch.html)

## Z-Offset

An easy way to do probe z-offset calibration is to home the printer, then put a piece of paper underneath the nozzle. Now babystep Z through the Fluidd interface (or by issuing G0 commands through the console) until the nozzle touches the paper and there's a bit of resistance when you pull on it. Then write "GET_POSITION" in the console and find the line that says `// kinematic: ...` And use the Z coordinate from that line, multiplied by -1. So if it says `// kinematic: X:0.000000 Y:0.000000 Z:-0.400000` you need to add 0.4 to your probe's z_offset in printer.cfg.

Alternatively you can use the `PROBE_CALIBRATE` command, read more in the [klipper probe calibration documentation](https://www.klipper3d.org/Probe_Calibrate.html#calibrating-probe-z-offset)

?> The z-offset is the distance in Z between your probe's trigger point and your nozzle in gcode space. This is typically within 0-4mm, if you get a larger value or a negative value, something is wrong, and you should investigate further.

## Includes & Overrides

RatOS uses a modular configuration that heavily takes advantage of the config file include and merge logic in Klipper. For this reason, the order of includes and overrides are very important, do **not** change the order of the configuration unless you know what you're doing.

!> Do **NOT** edit the files inside the `config/` folder. These files are controlled by RatOS and will be updated when the RatOS package is updated.

You can override any setting in RatOS, to do so you just copy the section and the parameter you need to change, and paste it in your printer.cfg after the related config file has been loaded. Let's say we wanted to change the current the extruder motor. If we navigate to `config/printers/v-core-3/steppers.cfg` we'll see this section:

```properties
[tmc2209 extruder]
uart_pin:  e_uart_pin
run_current: 0.5
hold_current: 0.400
stealthchop_threshold: 900

```

We're only interested in the `run_current` and `hold_current` settings, so all we need to do is go back to printer.cfg, scroll down to the `USER OVERRIDES` comment section and put in the following:

```properties
### USER OVERRIDES
# Place all your overrides here

[tmc2209 extruder]
run_current: 0.35
hold_current: 0.200
```

This works for any section (including gcode macros) and any parameter. You only need to override the parts you're interested in. Imagine that each `[include]` section is simply replaced by the contents of the included file. You can have the same section defined multiple times, they will all get merged by klipper when it reads the config, with the last parameters taking precedence. This makes for a super powerful way to build your config! Refer to the [klipper config reference](https://www.klipper3d.org/Config_Reference.html) for all the cool things you can do.

## Finalizing

You'll need to adjust your endstop and probe z-offset before printing and be sure to run

## Tuning

When you've verified that everything works, and you have your [slicer configured](slicers.md) to use the `START_PRINT` and `END_PRINT` macros, you can now start tuning. Refer to the klipper documentation for [PID Tuning](https://www.klipper3d.org/Config_checks.html#calibrate-pid-settings), [Pressure Advance tuning](https://www.klipper3d.org/Pressure_Advance.html), [manual Input Shaper calibration](https://www.klipper3d.org/Resonance_Compensation.html) or [automatic Input Shaper calibration via an ADXL345](https://www.klipper3d.org/Measuring_Resonances.html), and [Skew Correction](https://www.klipper3d.org/skew_correction.html) respectively.

?> See the wiring diagram for you board on how to connect your ADXL345, RatOS uses an SPI connection on the MCU itself instead of the RPi, for ease of use.
