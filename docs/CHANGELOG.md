# Changelog

## RatOS V1.0 RC3

### Updating from V-CoreOS-RC2

Updating to RatOS v1.0 RC3 requires you to flash the SD Card in your Raspberry Pi, as well as your control board following the usual steps found in the (has to be done manually via SD card transfer) [Installation Section](installation.md). That also means that any changes you've made to your Raspberry Pi setup will be lost unless you make a backup first. If you want to be absolutely sure you don't loose something, you can use a new SD card for RatOS v1.0 RC3. These are common things you'll probably want to backup:

- printer.cfg (you can download this from Fluidd)
- .moonraker_database (located in /home/pi/.moonraker_database on your Raspberry Pi. Download this with SCP/WinSCP)
- Any custom setup you've done.

If you're reuploading your printer.cfg from V-CoreOS-RC2 you'll need to add this to the bottom of printer.cfg (right above the ### USER OVERRIDES section):

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

### General

- Since the future of Fluidd is uncertain, RatOS has migrated to Mainsail!
- KlipperScreen now comes preinstalled.

### Boards

- Fysetc Spider v1.1 support added
- SKR 2 /w STM32F429 support added
- Firmware compilation and flashing is now attempted when the klipper repository is updated.
- Udev symlinks are now automatically updated when the ratos config is updated. That means new boards are mapped automatically.
- RPi MCU added (automatically updated with klipper)
- make-and-flash-mcu.sh now copies the firmware binary into a firmware_binaries folder browsable in mainsail for manual flashing via SD Card.

### Macros

- Macro's now have configurable behavior, the following variables are available: `relative_extrusion`, `preheat_extruder`, `calibrate_bed_mesh`, `nozzle_priming`, `start_print_park_in`, `start_print_park_z_height`, `end_print_park_in`, `pause_print_park_in` and `macro_travel_speed`.
- `START_PRINT` now has 4 hooks: `_START_PRINT_AFTER_HEATING_BED`, `_START_PRINT_BED_MESH`, `_START_PRINT_PARK` and `_START_PRINT_AFTER_HEATING_EXTRUDER`. You can override these in your printer.cfg to further customize the way your `START_PRINT` macro behaves.
- `END_PRINT` now has 2 hooks: `_END_PRINT_AFTER_HEATERS_OFF` and `_END_PRINT_PARK`. You can override these in your printer.cfg to further customize the way your END_PRINT macro behaves.
- `END_PRINT` and PAUSE now moves to a safe Z distance instead of always moving the same distance which could lead to errors.
- `M600` is now supported.

# MainsailOS Changelog

**2021-22-08**

- Date Order corrected in CHANGELOG.md
- Enable spi interface by default

**2021-17-08**

- Added is_req_preinstall Module
  - This installs python-numpy and python-matplotlib to the Image
  - Also numpy will be preinstalled in klipper-env.

**2021-17-07**

- Improved Scripts, Replaced 'pi' with '${BASE_USER}' according to CustomPIOS Variables

**2021-06-07**

- Serialcomm Module improvements.

**2021-05-07**

- Added new Module named "serialcomm".
  - This enables the GPIO Headers by default for Serial Communication with Boards like
    the BTT SKR Mini E3 V2.0 for example.
  - In Printer.cfg's MCU Section **serial: /dev/serial0** should work for most cases.

**2021-03-07**

- Fixed Typo in .service files
- Added udev as Wants= in klipper.service
  - should bring up klipper, when Devices initialized, to prevent connection errors to mcu.

**2021-02-07**

- Updated config to deliver zip compressed image
- Added docs/CHANGELOG.md
- Updated Klipper Module
  - changed config file to be more flexible on changes in Klipper
  - changed install routine according to config changes
  - Updated klipper.service file to be more "robust"
- Changed .gitignore to ignore also .sha1 file (since pulled every "make")
- Updated Moonraker Module
  - changed config file to be more flexible on changes in Moonraker
  - changed install routine according to config changes
  - Updated moonraker.service file to be more "robust"
- Updated mainsail Module
  - Moved folder creation 'gcode_files' to Klipper as Dependency

**2021-01-07**

- Changed run.sh to Kernel 5.4.51-buster like RaspberryOS
- Updated docker-compose.yml to match with CustomPIOS Version 1.4.0
- Added .env file needed for CustomPIOS
- Added, according to docker file, Kernel Image 5.4.51-buster for test environment.
