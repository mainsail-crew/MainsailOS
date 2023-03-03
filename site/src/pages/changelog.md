# Changelog

## RatOS V2.0

**RatOS v2 is not backwards compatible with RatOS v1, you will have to reflash your Raspberry Pi and start over with a new configuration template. Use your old printer.cfg for reference values.**

### Major new features

- Now based on bullseye
- The RatOS configurator will now help you flash your controlboard and toolboards.
- Toolboards are now supported.
- Stowable probes like euclid and klicky are now support.
- Unified homing: everything is now handled through a single homing override. Sensorless homing now requires no tinkering with homing macros (you still need to tweak current and sensitivities). Including a stowable probe config automatically enables deploying and stowing. Axes can now use individual homing procedures, such as sensorless on X and endstops on Y.
- MainsailOS has been merged which brings timelapse and crowsnest.
- Preinstalled: https://github.com/worksasintended/klipper_linear_movement_analysis
- Klipper now runs Python 3
- Experimental BTT CB1 support
- RatOS notifications in Mainsail.

### Minor new features

- A bunch of new macro variables to tweak the RatOS macros (see http://os.ratright.com/docs/configuration/macros), including end park z hop, prime positions, etc etc.
- Configurator now maintains klipper and moonraker extension symlinks (will automatically restore in case of a hard reset, can also be triggered automatically through the configurator actions menu at RatOS.local/configure)
- Configurator now in charge of flashing all connected boards when klipper is updated.
- `START_PRINT` can now use the hotend to measure chamber temp. For example to wait for chamber to reach 40 degrees, use `START_PRINT CHAMBER_TEMP=40`. The bed temperature during chamber heating is configurable via the macro variable `variable_start_print_heat_chamber_bed_temp`.

### Minor changes

- Primeblob has changed sides for stowable probe support.
- The toolhead now moves along the edge of the buildplate when navigating to the primeline/primeblob start position, and only lowers the nozzle when it has arrived.
- config repository directory has been renamed to RatOS.

### Bug fixes

- IPv6 has been disabled (hopefully no more issues with RatOS.local / moonraker not working on IPv6 capable networks).

### New supported printers

- Voron V2.4 support (Experimental)
- Voron V0.1 Support (Experimental)
- Prusa Mini (Experimental)
- Prusa MK3S (Experimental)

### New supported boards

- BTT Manta M8P
- BTT Manta M4P
- BTT Manta E3EZ
- BTT SKR 3
- BTT SKR 3 EZ
- BTT SKR Mini E3 3.0
- BTT SKRat 1.0
- BTT Octopus Pro H723

### New supported toolboards

- BTT EBB42 v1.0
- BTT EBB42 v1.1
- BTT EBB42 v1.2
- BTT EBB36 v1.0
- BTT EBB36 v1.1
- BTT EBB36 v1.2
- Mellow Fly SHT42 v1
- Mellow Fly SHT36 v1

### Bug fixes

- IPv6 has been disabled (no more issues with RatOS.local / moonraker not working on some IPv6 capable networks).
- Automatic flashing is now more resilient and will detect and attempt to recover if the board gets stuck in DFU mode.
- Configurator now correctly restarts on updates.
- Since the initial flashing is now done via the configurator, the issues with broken firmware should now be eliminated.

## RatOS V1.2

This release adds a wifi connection configurator and hotspot functionality so users no longer have to edit the wpa-supplicant files, the syntax of which has been challenging for many. The hotspot also enables printing in areas with no wifi or ethernet connectivity.

## RatOS V1.1

This release mainly revolves around the new stepper/stepper driver setting recommendations from Klipper. `hold_current` has been removed, stealthchop is now entirely disabled by default, interpolation has been disabled and microsteps have been increased to 64 to counteract the additional noise. V-Minion template has now been optimized for the final hardware in the release kit. Keep reading to see the complete list of changes.

### KlipperScreen

- KlipperScreen now correctly installed as Pi user. This makes KlipperScreen.conf (next to your printer.cfg) work again. **This change requires flashing RatOS V1.1 to your Pi.**

### General

- Stepper motors, drivers and speed limits have now been made more modular, allowing for easier configuration of, for example, 48V steppers. See [Advanced Stepper Configuration](/docs/configuration/advanced-stepper-configuration) for more information.
- Driver / Stepper settings now adopt the new recommended klipper defaults. This also means that your steppers might make a bit more noise than they did before, since the stealthchop_threshold has been set to 0. You can manually set stealthchop_threshold back to 1 if that's unacceptable to you, just be aware that it will reduce the stepper's positional accuracy.
- Rapido and Dragonfly configs added.
- LGX Lite config added.
- Printer templates have been improved for better organization and now includes the new stepper configurations.
- SKR2 Documentation added
- V-Minion printer template optimized for the release of V-Minion full kit.

### Updating from RatOS V1.0

Generally you don't have to do anything to use RatOS v1.1, unless you use sensorless homing.

#### Sensorless homing

If you are using sensorless homing, you'll now need to remove the HOLDCURRENT parameters from you SET_TMC_CURRENT commands. This has no effect on functionality, it didn't do anything useful before. However, if you include the new stepper configs you may have to retune your currents and sensitivity settings.

#### Stepper Motors

On V-Core 3 and V-Core Pro printers using the stock 48mm steppers on all axes add `[include RatOS/steppers/ldo/42sth48-2504ac/2209/24v-1.6a-*.cfg]` (cooled drivers) or `[include RatOS/steppers/ldo/42sth48-2504ac/2209/24v-1.1a-*.cfg]` (uncooled drivers) to your USER OVERRIDES section. You can skip this step if you're migrating your printer.cfg (see below).
If you only use the stock steppers on some axes, or want different currents, voltages etc you can include the stepper config for specific steppers like this:

```properties
[include RatOS/steppers/ldo/42sth48-2504ac/2209/24v-1.6a-x.cfg]
[include RatOS/steppers/ldo/42sth48-2504ac/2209/24v-1.6a-y.cfg]
[include RatOS/steppers/ldo/42sth48-2504ac/2209/24v-1.1a-z.cfg]
[include RatOS/steppers/ldo/42sth48-2504ac/2209/24v-1.1a-z1.cfg]
[include RatOS/steppers/ldo/42sth48-2504ac/2209/24v-1.1a-z2.cfg]
```

These stepper specific configs have their DRIVER\_\* settings tuned for the given driver, voltage and amperage. Take a look in the config/steppers folders to see which options are available.

If you want to go back to the way it was in v1.0 (stealthchop_threshold: 1) simply add this to your user overrides section:

```properties
[tmc2209 stepper_x]
stealthchop_threshold: 1
interpolate: True

[tmc2209 stepper_y]
stealthchop_threshold: 1
interpolate: True

[tmc2209 extruder]
interpolate: True
stealthchop_threshold: 1

[tmc2209 stepper_z]
interpolate: True
stealthchop_threshold: 1

[tmc2209 stepper_z1]
interpolate: True
stealthchop_threshold: 1

[tmc2209 stepper_z2]
interpolate: True
stealthchop_threshold: 1
```

Be aware that this comes with disadvantage of less precise motion, and it will not work at all with Fysetc and Mellow drivers.

#### New Templates (Optional)

RatOS v1.1 comes with new improved and reorganized templates. If you want the new templates but don't want to reflash your Pi, you can migrate manually. To do so, start by making a backup of your printer.cfg (download it, and put it somewhere safe), then replace printer.cfg with the contents of config/templates/\[your-printer\]-printer.template.cfg. Go through your new printer.cfg and use your old config as a reference for the values you need. You can copy / paste the klipper config block at the bottom to your new printer.cfg to retain all the settings you've saved via `SAVE_CONFIG`.

## RatOS V1.0

### Updating from V-CoreOS-RC2

Updating to RatOS v1.0 requires you to flash the SD Card in your Raspberry Pi, as well as your control board following the usual steps (has to be done manually via SD card transfer) found in the [Installation Section](docs/installation). That also means that any changes you've made to your Raspberry Pi setup will be lost unless you make a backup first. If you want to be absolutely sure you don't loose something, you can use a new SD card for RatOS v1.0. These are common things you'll probably want to backup:

- printer.cfg (you can download this from Fluidd)
- .moonraker_database/\* (located in /home/pi/.moonraker_database on your Raspberry Pi. Download data.mdb and lock.mdb with SCP/WinSCP then upload them to that same location after installation of RatOS v1.0)
- Any custom setup you've done, that isn't replaced with native RatOS functionality.

If you're reuploading your printer.cfg from V-CoreOS-RC2 you can (optionally) add this to the bottom of printer.cfg (right above the ### USER OVERRIDES section):

```properties
### MACRO CONFIGURATION
[gcode_macro RatOS]
# Use relative extrusion mode
# Set to False to use absolute extrusion mode
variable_relative_extrusion: True
# Wait for extruder to reach 150 so an inductive probe (if present) is at a predictable temp.
# Also allows the bed heat to spread a little, and softens any plastic that might be stuck to the nozzle.
# Set to False to disable
variable_preheat_extruder: True
# Calibrate the bed mesh in the START_PRINT macro.
# Set to false to skip BED_MESH_CALIBRATE, it will still load the BED_MESH
# with the name "ratos", be sure to save your bed_mesh profile with that name.
# or override the _START_PRINT_BED_MESH macro to implement your own mesh handling logic.
variable_calibrate_bed_mesh: True
# Print a prime line at the end of the START_PRINT macro
# set to False to disable nozzle_priming.
variable_nozzle_priming: "primeline"
# Park in the back when waiting for the extruder to heat up
# set to "front" to park in the front, or "center" to park in the center.
variable_start_print_park_in: "back"
# Height to park it when waiting for extruder to heat.
variable_start_print_park_z_height: 50
# Skew profile to load before starting the print
# uncomment this to use your calibrated skew correction profile.
#variable_skew_profile: "my_skew_profile"
# Park in the back after the print has ended or was cancelled.
# set to "front" to park in the front, or "center" to park in the center.
variable_end_print_park_in: "back"
# Park in the back when the print is paused.
# set to "front" to park in the front, or "center" to park in the center.
variable_pause_print_park_in: "back"
# Set the speed for travel moves in RatOS Macros in mm/s.
variable_macro_travel_speed: 150
```

If the section is not present in your printer.cfg the default values will be used. See [Macro Configuration](/docs/configuration/macros) for information on how to use the variables.

### General

- Since the future of Fluidd is uncertain, RatOS has migrated to Mainsail.
- KlipperScreen now comes preinstalled.
- Picking your printer is now done via Macros on first startup.

### Printers

- Add V-Core Pro 1.3 support

### Boards

- Firmware compilation has been automated! Firmware compilation and flashing is now attempted when the klipper repository is updated.
- Fysetc Spider v1.1 support added
- SKR 2 /w STM32F429 support added
- Udev symlinks are now automatically updated when the ratos config is updated. That means new boards are mapped automatically.
- RPi MCU added (automatically updated with klipper)
- make-and-flash-mcu.sh now copies the firmware binary into a firmware_binaries folder browsable in mainsail for manual flashing via SD Card if needed.

### Macros

- gcode_shell_command.py has been added.
- Added `INSTALL_VCORE_THREE_CONFIG`, `INSTALL_VCORE_PRO_CONFIG`, `INSTALL_VMINION_CONFIG` macro's for initial setup.
- Added COMPILE_BINARIES macro to compile binaries for all supported boards in case the user got himself into a bad situation and needs the newest firmware.
- Added GENERATE_SHAPER_GRAPHS which runs resonance test and generates graphs which are placed in the `input_shaper` folder.
- Macro's now have configurable behavior, the following variables are available: `relative_extrusion`, `preheat_extruder`, `calibrate_bed_mesh`, `nozzle_priming`, `start_print_park_in`, `start_print_park_z_height`, `end_print_park_in`, `pause_print_park_in` and `macro_travel_speed`.
- `START_PRINT` now has 4 hooks: `_START_PRINT_AFTER_HEATING_BED`, `_START_PRINT_BED_MESH`, `_START_PRINT_PARK` and `_START_PRINT_AFTER_HEATING_EXTRUDER`. You can override these in your printer.cfg to further customize the way your `START_PRINT` macro behaves.
- `END_PRINT` now has 2 hooks: `_END_PRINT_AFTER_HEATERS_OFF` and `_END_PRINT_PARK`. You can override these in your printer.cfg to further customize the way your END_PRINT macro behaves.
- `END_PRINT` and PAUSE now moves to a safe Z distance instead of always moving the same distance which could lead to errors.
- `M600` is now supported.
