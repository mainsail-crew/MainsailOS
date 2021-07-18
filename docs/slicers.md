# Slicer Configuration

# Macros
V-CoreOS comes with START_PRINT and END_PRINT macros that you can call directly from your slicers. This way the printer knows how to start a print, and you can there easily switch between slicers without worrying if you changed anything in another slicer.
The g-code for these macros are found in `config/printers/[PRINTER_NAME]/macros.cfg`

## Cura

Machine start gcode
```properties
START_PRINT EXTRUDER_TEMP={material_print_temperature} BED_TEMP={material_bed_temperature}
```

machine end gcode
```properties
END_PRINT
```

## PrusaSlicer

Start g_code 
```properties
M190 S0 ; Prevents prusaslicer from prepending m190 to the gcode ruining our macro
M109 S0 ; Prevents prusaslicer from prepending m109 to the gcode ruining our macro
START_PRINT EXTRUDER_TEMP=[first_layer_temperature] BED_TEMP=[first_layer_bed_temperature]
```

End g_code
```properties
END_PRINT
```

## SuperSlicer
!> You should be using "Klipper" as the gcode flavor

```properties
START_PRINT EXTRUDER_TEMP=[first_layer_temperature] BED_TEMP=[first_layer_bed_temperature]
```

## Simplify 3D

Start g_code 
```properties
START_PRINT EXTRUDER_TEMP=[extruder0_temperature] BED_TEMP=[bed0_temperature]
```

End g_code
```properties
END_PRINT
```

# Slicer thumbnails
See the fluidd documentation: [G-Code Thumbnails in Fluidd](https://docs.fluidd.xyz/features/thumbnails)