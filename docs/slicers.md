# Slicer Configuration

# Macros

RatOS comes with START_PRINT and END_PRINT macros that you can call directly from your slicers. This way the printer knows how to start a print, and you can there easily switch between slicers without worrying if you changed anything in another slicer.
The g-code for these macros are found in `config/printers/[PRINTER_NAME]/macros.cfg`

## Cura

!> This is the ONLY gcode you need, delete everything else. Copy paste the following **as is**.

Machine start gcode

```properties
START_PRINT EXTRUDER_TEMP={material_print_temperature_layer_0} BED_TEMP={material_bed_temperature_layer_0}
```

machine end gcode

```properties
END_PRINT
```

## PrusaSlicer

!> This is the ONLY gcode you need, delete everything else. Copy paste the following **as is**.

Start GCode

```properties
M190 S0 ; Prevents prusaslicer from prepending m190 to the gcode ruining our macro
M109 S0 ; Prevents prusaslicer from prepending m109 to the gcode ruining our macro
START_PRINT EXTRUDER_TEMP=[first_layer_temperature] BED_TEMP=[first_layer_bed_temperature]
```

End GCode

```properties
END_PRINT
```

## SuperSlicer

!> You should be using "Klipper" as the gcode flavor
!> This is the ONLY gcode you need, delete everything else. Copy paste the following **as is**.

```properties
START_PRINT EXTRUDER_TEMP=[first_layer_temperature] BED_TEMP=[first_layer_bed_temperature]
```

## Simplify 3D

!> This is the ONLY gcode you need, delete everything else. Copy paste the following **as is**.

Start GCode

```properties
START_PRINT EXTRUDER_TEMP=[extruder0_temperature] BED_TEMP=[bed0_temperature]
```

End GCode

```properties
END_PRINT
```

## IdeaMaker

!> This is the ONLY gcode you need, delete everything else. Copy paste the following **as is**.

Start GCode

```properties
START_PRINT EXTRUDER_TEMP={temperature_extruder1} BED_TEMP={temperature_heatbed}
```

End GCode

```properties
END_PRINT
```

?> IdeaMaker will complain there's no heating commands, you can safely ignore this.

# Slicer thumbnails

See the fluidd documentation: [G-Code Thumbnails in Fluidd](https://docs.fluidd.xyz/features/thumbnails)
