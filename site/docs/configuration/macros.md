# Configuring RatOS Macros

RatOS comes with a bunch of flexible predefined macro's that can be customized via variables. In your printer.cfg at the bottom of the Macro's section, you'll notice this:

```properties
### MACRO CONFIGURATION
[gcode_macro RatOS]
....
```

This is a macro that serves as a place to store variables that all the RatOS macro's refer to when they're executed. Here's a list of the available variables and what they do.

### Relative Extrusion

| Name                        | Possible Values | Default |
| --------------------------- | --------------- | ------- |
| variable_relative_extrusion | True / False    | False   |

Controls which extrusion mode START_PRINT ends in. Which value you use here depends on your slicer configuration, in other words this variable should always correspond to the extrusion mode setting in your slicer. It is recommended to configure your slicer for relative extrusion and set this variable to True.

### Speed

| Name                        | Possible Values | Default |
| --------------------------- | --------------- | ------- |
| variable_macro_travel_speed | number          | 300     |
| variable_macro_z_speed      | number          | 10      |

Travel speed to use for gcode moves in RatOS Macro's in mm/s.

### Homing

| Name                  | Possible Values   | Default  | Description                                                                         |
| --------------------- | ----------------- | -------- | ----------------------------------------------------------------------------------- |
| variable_safe_home_x  | "middle" / number | "middle" | The x coordinate for where to return the toolhead to when homing Z                  |
| variable_safe_home_y  | "middle" / number | "middle  | The y coordinate for where to return the toolhead to when homing Z                  |
| variable_homing_z_hop | number            | 15       | How much to raise the toolhead after homing Z. Probe configs may change this value. |

### Heating

| Name                                       | Possible Values | Default | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| ------------------------------------------ | --------------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| variable_preheat_extruder                  | True / False    | True    | Enables or disables preheating of the nozzle to 150 degrees during the START_PRINT macro. There are several benefits to preheating the nozzle. 1) Gives the bed additional time to diffuse the heat. 2) Softens plastic that may be stuck in the nozzle so it doesn't block your probe from triggering. 3) If using a non thermally compensated inductive probe, it makes the temperature and thus the offset of the probe more predictable and consistent. |
| variable_start_print_heat_chamber_bed_temp | Number          | 115     | The bed temperature to use when heating the chamber when the `CHAMBER_TEMP` parameter is supplied to the `START_PRINT` macro.                                                                                                                                                                                                                                                                                                                               |

### Bed Mesh Calibration

| Name                        | Possible Values | Default |
| --------------------------- | --------------- | ------- |
| variable_calibrate_bed_mesh | True / False    | True    |

Whether or not to calibrate a bed mesh before each print. If you prefer calibrating your bed mesh manually instead of on each print, you can disable it by setting this to False. With bed meshing disabled you must have a mesh saved under the "ratos" profile, use BED_MESH_CALIBRATE PROFILE=ratos and SAVE_CONFIG to calibrate and save a mesh.
If you want to implement additional mesh handling logic you can override the `_START_PRINT_BED_MESH` macro in your printer.cfg `USER OVERRIDES` section.

### Nozzle Priming

| Name                            | Possible Values                   | Default     | Description                                                                                                                                                                                                                                                                                                                                                                 |
| ------------------------------- | --------------------------------- | ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| variable_nozzle_priming         | "primeline" / "primeblob" / False | "primeblob" | Whether or not to prime the nozzle during the START_PRINT macro. "primeline" will make START_PRINT draw a short line to prime the nozzle. "primeblob" will put a small blob at the edge of the bed that is intended to wrap around the nozzle, then lifts the toolhead out of it while extruding a small line, effective for cleaning the nozzle and it's easy to clean up. |
| variable_nozzle_prime_start_x   | "min" / "max" / number            | "max"       | Where to place the primeline or blob in X. "min" starts the blob or line at x=0 + some safety margin. "max" starts the blob or line at x=max - some safety margin. If set to a number, that number will be used as the starting x coordinate of the line or blob.                                                                                                           |
| variable_nozzle_prime_start_y   | "min" / "max" / number            | "min"       | Where to place the primeline or blob in Y. "min" starts the blob or line at y=0 + some safety margin. "max" starts the blob or line at y=max - some safety margin. If set to a number, that number will be used as the starting y coordinate of the line or blob.                                                                                                           |
| variable_nozzle_prime_direction | "auto" / "forwards" / "backwards  | "auto"      | The direction to draw the line or blob in, if "backwards" the toolhead will move toward the front of the printer, if "forwards" it will move towards the back. When set to "auto" it will move towards the middle regardless of `variable_nozzle_prime_start_y`.                                                                                                            |

### Parking

| Name                               | Possible Values             | Default   | Description                                                                 |
| ---------------------------------- | --------------------------- | --------- | --------------------------------------------------------------------------- |
| variable_start_print_park_in       | "back" / "center" / "front" | "back"    | Where to park the toolhead during final nozzle heating.                     |
| variable_start_print_park_x        | number / undefined          | undefined | Custom X coordinate to park the toolhead during final nozzle heating.       |
| variable_start_print_park_z_height | number                      | 50        | The z height at which to park the toolhead during final nozzle heating.     |
| variable_end_print_park_in         | "back" / "center" / "front" | "back"    | Where to park the toolhead after ending or canceling a print.               |
| variable_end_print_park_x          | number / undefined          | undefined | Custom X coordinate to park the toolhead after ending or canceling a print. |
| variable_end_print_park_z_hop      | number                      | number    | How many mm to lift the nozzle when after ending or cancelling a print.     |
| variable_pause_print_park_in       | "back" / "center" / "front" | "back"    | Where to park the toolhead when pausing a print.                            |
| variable_pause_print_park_x        | number / undefined          | undefined | Custom X coordinate to park the toolhead when pausing a print.              |

### Stowable probes

These variables are only relevant when using a stowable probe such as Euclid or Klicky. Use these to customize and finetune the deployment and stowing procedures.

| Name                                       | Possible Values | Default   | Description                                                                                                                               |
| ------------------------------------------ | --------------- | --------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| variable_stowable_probe_position_preflight | Tuple           | undefined | The coordinates to move the toolhead to before the probe deployment routine. Example: `[30, 60]`                                          |
| variable_stowable_probe_position_side      | Tuple           | undefined | The coordinates to move the toolhead to before entering the dock during deployment, or exiting the dock while stowing. Example: `[30, 0]` |
| variable_stowable_probe_position_dock      | Tuple           | undefined | The coordinates of the toolhead when it's positioned perfectly inside the dock for pickup. Example: `[0, 0]`                              |
| variable_stowable_probe_position_exit      | Tuple           | undefined | The coordinates to move the toolhead to when exiting the dock while deploying or entering the dock while stowing. Example: `[0, 60]`      |

### Skew profile

| Name                  | Possible Values     | Default   | Description                                                                                                                                                                       |
| --------------------- | ------------------- | --------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| variable_skew_profile | string or undefined | undefined | Use this if you have calibrated and saved a skew profile that you want to load in the START_PRINT macro. To activate it, set the variable to the name of your saved skew profile. |
