# Configuring V-CoreOS

V-CoreOS only needs minimal configuration to work, but comes with a lot of optional functionality that you can enable manually.

## Introduction
?> V-CoreOS comes preconfigured for the V-Core 3, to use other printers, copy the contents of the printer template from `config/templates/` to your printer.cfg

Once you have completed the initial [setup](installation.md) and opened [http://v-coreos.local/](v-coreos.local) in your browser, you are almost ready to print. There's a just a few things to go over to make sure the configuration matches your particular setup.
## Fluidd
In the configuration page in Fluidd (the webinterface you just opened in your browser), there's a list of files, among them is `printer.cfg`. Right click it and choose "Edit". This is where your klipper configuration lives. As you can see, it's prepopulated with some included files which are meant to get you up and running quick and easy. **Follow the instructions in the file to make sure the configuration matches your setup.**
## Overrides

!> Do **NOT** edit the files inside the `config/` folder. These files are controlled by v-coreos and will be updated when the v-coreos package is updated. 

You can override any setting in V-CoreOS, to do so you just copy the section and the parameter you need to change, and paste it in your printer.cfg after the related config file has been loaded. Let's say we wanted to change the current the extruder motor. If we navigate to `config/printers/v-core-3/steppers.cfg` we'll see this section:
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

This works for any section (including gcode macros) and any parameter. You only need to override the parts you're interested in. You can have the same section defined multiple times, they will all get merged by klipper when it reads the config, with the last parameters taking precedence. This makes for a super powerful way to build your config! Refer to the [klipper config reference](https://www.klipper3d.org/Config_Reference.html) for all the cool things you can do.

## Finalizing
You'll need to adjust your endstop and probe z-offset before printing and be sure to run PID tuning for your extruder and your bed. After that it's advisable to run [Pressure Advance tuning](https://www.klipper3d.org/Pressure_Advance.html), [Input Shaper calibration](https://www.klipper3d.org/Resonance_Compensation.html) and [Skew Correction](https://www.klipper3d.org/skew_correction.html).

?> **Quick z-offset adjustment method**<br/>
An easy way to do probe z-offset calibration is to home the printer, then put a piece of paper underneath the nozzle. Now babystep Z through the Fluidd interface (or by issuing G0 commands through the console) until the nozzle touches the paper and there's a bit of resistance when you pull on it. Then write "GET_POSITION" in the console and find the line that says `// kinematic: ...` And use the Z coordinate from that line, multiplied by -1. So if it says `// kinematic: X:0.000000 Y:0.000000 Z:-0.400000` Your probe's z_offset will be 0.4.