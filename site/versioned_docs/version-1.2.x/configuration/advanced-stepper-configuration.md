# Advanced Stepper Configuration

RatOS V1.1 introduced modularized stepper and driver configuration, this can be used for more fine grained control of your steppers. In your printer.cfg you might have noticed a section like this:

```properties
#############################################################################################################
### STEPPER MOTORS, DRIVERS & SPEED LIMITS
### Pick the drivers and stepper motors you're using. See the RatOS documentation for custom combinations.
#############################################################################################################
[include config/printers/v-core-3/steppers.cfg]

# UNCOOLED TMC 2209 + LDO-42STH48-2504AC
[include config/printers/v-core-3/speed-limits-basic.cfg]
[include config/printers/v-core-3/tmc2209.cfg]
[include config/steppers/ldo/42sth48-2504ac/2209/24v-1.1a-*.cfg]

# COOLED TMC 2209 + LDO-42STH48-2504AC
# This increases motor torque, positional accuracy and speed limits.
# don't enable this before your printer is fully configured and you have a fan blowing on your stepper drivers.
#[include config/printers/v-core-3/speed-limits-performance.cfg]
#[include config/printers/v-core-3/tmc2209-performance.cfg]
#[include config/steppers/ldo/42sth48-2504ac/2209/24v-1.6a-*.cfg]

# STEALTH MODE (Enables stealthchop and limits velocity and acceleration)
# NOTE: You still need to include one of the above stepper motor definitions.
# NOTE: This will make your printer quiter but less accurate, it's an inherent side effect of stealthchop.
#[include config/printers/v-core-3/speed-limits-stealth.cfg]
#[include config/printers/v-core-3/tmc2209-stealth.cfg]
```

You can comment out this whole section (except for steppers.cfg) to use your own combination of steppers and drivers. For example, let's say we're using an Octopus Pro with 50V 5160's powering the LDO-42STH48-2504AC on X and Y, and 2209's for the Z's. We could do the following in our user overrides section after commenting out the entire stepper motors, drivers and speed limits section:

```properties
#############################################################################################################
### USER OVERRIDES
### Anything custom you want to add, or RatOS configuration you want to override, do it here.
#############################################################################################################
# Set speed limits to performance limits.
# Include driver and stepper configuration for 50V 5160's on X/Y
[include config/steppers/ldo/42sth48-2504ac/5160/50v-1.768a-x.cfg]
[include config/steppers/ldo/42sth48-2504ac/5160/50v-1.768a-y.cfg]
# Include driver and stepper configuration for Z's
[include config/steppers/ldo/42sth48-2504ac/2209/24v-1.6a-z.cfg]
[include config/steppers/ldo/42sth48-2504ac/2209/24v-1.6a-z1.cfg]
[include config/steppers/ldo/42sth48-2504ac/2209/24v-1.6a-z2.cfg]
```

Notice how we no longer include a speed limit config or a tmc2209 config. We need to do reproduce the function of these configs ourselves in the user overrides section. The tmc2209 profile's job is to define stealthchop and interpolation. Let's add klipper's recommended defaults to our user overrides section:

```properties
[tmc5160 stepper_x]
stealthchop_threshold: 0
interpolate: False

[tmc5160 stepper_y]
stealthchop_threshold: 0
interpolate: False

[tmc2209 extruder]
interpolate: False
stealthchop_threshold: 0

[tmc2209 stepper_z]
interpolate: False
stealthchop_threshold: 0

[tmc2209 stepper_z1]
interpolate: False
stealthchop_threshold: 0

[tmc2209 stepper_z2]
interpolate: False
stealthchop_threshold: 0
```

The speed-limits profile is used to set move speeds for built in klipper functionality such as bed mesh calibration and z-tilt calibration (if present). It also sets your printer limits. We have 50V stepper motors now, tuned for maximum performance, so let's go a little crazy:

```properties
[bed_mesh]
speed: 1000

[z_tilt]
speed: 1000

[printer]
max_velocity: 1000
max_accel: 20000
max_accel_to_decel: 10000
max_z_velocity: 30
max_z_accel: 1000
square_corner_velocity: 5
```

We have now configured our printer for running 50V drivers on X/Y at blazing fast speeds! To explore what stepper motor, driver, voltage and current combination comes pre-tuned with RatOS, check the config/steppers folder. Enjoy!
