# Configuring RatOS Macros

RatOS comes with a bunch of flexible predefined macro's that can be customized via variables. In your printer.cfg at the bottom of the Macro's section, you'll notice this:

```properties
### MACRO CONFIGURATION
[gcode_macro RatOS]
....
```

### Relative Extrusion

| Name                        | Possible Values | Default |
| --------------------------- | --------------- | ------- |
| variable_relative_extrusion | True / False    | False   |

Controls which extrusion mode START_PRINT ends in. Which value you use here depends on your slicer configuration, in other words this variable should always correspond to the extrusion mode setting in your slicer. It is recommended to configure your slicer for relative extrusion and set this variable to True.

### Preheat Extruder

| Name                      | Possible Values | Default |
| ------------------------- | --------------- | ------- |
| variable_preheat_extruder | True / False    | True    |

Enables or disables preheating of the nozzle to 150 degrees during the START_PRINT macro. There are several benefits to preheating the nozzle.

- Gives the bed additional time to diffuse the heat
- Softens plastic that may be stuck in the nozzle so it doesn't block your probe from triggering.
- If using a non thermally compensated inductive probe, it makes the temperature and thus the offset of the probe more predictable and consistent.

### Bed Mesh Calibration

| Name                        | Possible Values | Default |
| --------------------------- | --------------- | ------- |
| variable_calibrate_bed_mesh | True / False    | True    |

Whether or not to calibrate a bed mesh before each print. If you prefer calibrating your bed mesh manually instead of on each print, you can disable it by setting this to False.
If you want to implement additional mesh handling logic you can override the `_START_PRINT_BED_MESH` macro in your printer.cfg `USER OVERRIDES` section.

### Nozzle Priming

| Name                    | Possible Values     | Default |
| ----------------------- | ------------------- | ------- |
| variable_nozzle_priming | "primeline" / False | True    |

Whether or not to prime the nozzle during the START_PRINT macro. "primeline" will make START_PRINT draw a short line to prime the nozzle. If you want a more agressive priming procedure you can override the `PRIME_LINE` macro.

### Parking

| Name                               | Possible Values             | Default   | Description                                                                 |
| ---------------------------------- | --------------------------- | --------- | --------------------------------------------------------------------------- |
| variable_start_print_park_in       | "back" / "center" / "front" | "back"    | Where to park the toolhead during final nozzle heating.                     |
| variable_start_print_park_x        | number / undefined          | undefined | Custom X coordinate to park the toolhead during final nozzle heating.       |
| variable_start_print_park_z_height | number                      | 50        | The z height at which to park the toolhead during final nozzle heating.     |
| variable_end_print_park_in         | "back" / "center" / "front" | "back     | Where to park the toolhead after ending or canceling a print.               |
| variable_end_print_park_x          | number / undefined          | undefined | Custom X coordinate to park the toolhead after ending or canceling a print. |
| variable_pause_print_park_in       | "back" / "center" / "front" | "back     | Where to park the toolhead when pausing a print.                            |
| variable_pause_print_park_x        | number / undefined          | undefined | Custom X coordinate to park the toolhead when pausing a print.              |

### Speed

| Name                        | Possible Values | Default |
| --------------------------- | --------------- | ------- |
| variable_macro_travel_speed | number          | 150     |

Travel speed to use for gcode moves in RatOS Macro's in mm/s.
