---
sidebar_label: Initial Configuration
sidebar_position: 2
---

# Configuring RatOS

RatOS only needs minimal configuration to work, but comes with a lot of optional functionality that you can enable manually.

## Introduction

Once you have completed the initial [setup](installation) and opened [http://RatOS.local/](http://RatOS.local/) in your browser, you are almost ready to print. There's a just a few things to go over to make sure the configuration matches your particular setup.

## Initial Configuration

On the dashboard of Mainsail you'll see a macro group called "Installation", which consists of buttons that will install a specific printer configuration when you click them.

![Initial Config Macros](/img/initial-macros.png)

Click on the button that corresponds to your printer to install the configuration.

:::tip
If you accidentally clicked the wrong button you can install another printer config by copying the contents of the template found in `config/templates/` and pasting it into printer.cfg. You can also do this to reset your configuration to the latest template file.
:::

:::tip Don't freak out if you get errors
At this point we haven't told klipper anything about our hardware, if you're not using the default control board for your particular config, you'll get an MCU error. This is normal, continue below.
:::

Now navigate to the `Machine` page in Mainsail (the webinterface you just opened in your browser), there's a list of files, among them is `printer.cfg`. Right click it and choose "Edit". This is where your klipper configuration lives. As you can see, it's prepopulated with all you need to get your printer up and running quick and easy. **Follow the instructions in the file to make sure the configuration matches your setup.**

:::info Are you still getting errors?
If you're getting errors after going through printer.cfg, you either messed up the syntax (like, missing a `[section header]`), or your wiring isn't correct. If you get any MCU errors, turn off your MCU and go over your wiring again, you may be shorting something. **You already verified that your board is working and connecting when you flashed it in the RatOS configurator**.
:::

## Verify Stepper Directions

:::caution Only use supported steppers
Do NOT use RatOS with other than supported steppers (will be listed in printer.cfg). If you are using different steppers please make sure to check their rating, and configure their currents accordingly ([see Includes & Overrides](#includes-amp-overrides)).
:::

Make sure your steppers are running in the correct direction. To do this, center all your axes by moving the carriage and bed manually, then type `SET_CENTER_KINEMATIC_POSITION` in the console. You can now use the Mainsail controls to move the axes. Check that your bed moves down when Z is **increased**. By default, the Z controls in the Mainsail interface will increase Z when you click the up arrow. This will lower the bed on a CoreXY machine with a moving bed such as the V-Core 3, and raise the X gantry on a bedslinger such as the V-Minion or V-Cast. If your bed does not move down (or your x gantry doesn't raise) when you click the up arrow, change the direction of your Z steppers in printer.cfg. There's instructions on how to do that at the top of printer.cfg.

:::info
If you want to invert the Z behavior in the Mainsail interface (ie. making the bed move down when you click the down arrow), click the cogs (settings) in the upper right part of the interface, then "control", and then enable "Invert Z Control". This will **NOT** change your stepper directions, it will only change what gcode the buttons execute.
:::

## Verify Endstops and Z-Probe

Navigate to the Machine tab. In here you can see your endstop state. Refresh the endstop state and verify that all endstops are open, and that the state changes to triggered when you manually trigger the endstops or z-probe and refresh the endstop state.

:::info
To test, debug and/or verify a BLTouch, refer to the [BLTouch klipper documentation](https://www.klipper3d.org/BLTouch.html)
:::

## Z-Offset

An easy way to do probe z-offset calibration is to home the printer, then put a piece of paper underneath the nozzle. Now babystep Z through the Mainsail interface by using the machine controls (or by issuing G0 commands through the console) until the nozzle touches the paper and there's a bit of resistance when you pull on it. If you reach `Z=0` and the nozzle hasn't touched the paper yet, you can use the z-offset panel to adjust your offset until the nozzle lightly touches the paper. If the nozzle is touching the paper before your hit `Z=0` you can adjust your offset in the positive direction to counteract your Z coordinate, ie. if Z is 0.4 when your nozzle touches the paper, adjust your z-offset in the positive direction by 0.4mm. Then proceed to babystep Z towards zero, repeat until the nozzle touches the paper at `Z=0`. When you're done, click the save button in the z-offset dialog, and you're done.

Alternatively you can use the `PROBE_CALIBRATE` command, read more in the [klipper probe calibration documentation](https://www.klipper3d.org/Probe_Calibrate.html#calibrating-probe-z-offset). You should also refer to this documentation in case you use a non EVA standard toolhead, which might have a different probe offset than the RatOS defaults.

:::warning
If you're using a third party printer (ie. not Rat Rig), you should calibrate your probe's x/y offset, refer to the [klipper probe calibration documentation](https://www.klipper3d.org/Probe_Calibrate.html#calibrating-probe-z-offset).
:::

:::info
The z-offset is the distance in Z between your probe's trigger point and your nozzle in gcode space. This is typically within 0-4mm, if you get a larger value or a negative value, something is wrong, and you should investigate further.
:::

## Tuning

When you've verified that everything works, and you have your [slicer configured](slicers) to use the `START_PRINT` and `END_PRINT` macros, you can now start tuning. Refer to the klipper documentation for [PID Tuning](https://www.klipper3d.org/Config_checks.html#calibrate-pid-settings), [Pressure Advance tuning](https://www.klipper3d.org/Pressure_Advance.html), [manual Input Shaper calibration](https://www.klipper3d.org/Resonance_Compensation.html) or [automatic Input Shaper calibration via an ADXL345](https://www.klipper3d.org/Measuring_Resonances.html), and [Skew Correction](https://www.klipper3d.org/Skew_Correction.html) respectively.

### Using an accelerometer (ADXL345)

:::info
See the wiring diagram for your board on how to connect your ADXL345, RatOS primarily uses an SPI connection on the MCU itself instead of the RPi, for ease of use. Some printers may require more than one ADXL345, and in that case a config for the ADXL345 connected to the Raspberry Pi is also available.
:::

If you want to use an ADXL345 for automatic input shaper calibration, all the software you need is already preinstalled in RatOS you just need to wire up your ADXL345, and you're good to go.

To enable resonance testing, uncomment the `[resonance_tester]` header, along with the coordinates for your printer in the `PRINTER CONFIGURATION` section in printer.cfg. To verify that your ADXL is properly connected, write MEASURE_AXES_NOISE in the Mainsail console, if the values are below 100, you're good to go. To calibrate input shaper, write SHAPER_CALIBRATE in the console. If you're using a CoreXY machine, you may find the `MEASURE_COREXY_BELT_TENSION` macro handy for checking if your belts are equally tensioned (the peaks in the resulting graphs should line up with each other). You can also use `GENERATE_SHAPER_GRAPHS` to generate resonance graphs on all printers for deeper analysis of your printers resonance profile.

For more information on automatic input shaper calibration, check out the official klipper documentation.
