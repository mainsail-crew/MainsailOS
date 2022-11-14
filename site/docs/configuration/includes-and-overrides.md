---
sidebar_position: 3
---

# Includes & Overrides

RatOS uses a modular configuration that heavily takes advantage of the config file include and merge logic in Klipper. For this reason, the order of includes and overrides are very important, do **not** change the order of the configuration unless you know what you're doing.

## All RatOS really does is change the klipper defaults

Imagine that each `[include]` section is simply replaced by the contents of the included file, you can go and check out the contents of the included file if you want to know the RatOS defaults, but they are just that, defaults. Everything that comes after that overrides those defaults, much in the same way that the RatOS configuration itself overrides the klipper defaults.

## Overriding parameters

You can override any setting in RatOS, to do so you just copy the section and the parameter you need to change, and paste it in your printer.cfg in the `USER OVERRIDES` section. Let's say we wanted to increase the probe count and speed of the bed mesh on a 500mm V-Core 3.

We're only interested in the `probe_count` setting, so all we need to do is go back to printer.cfg, scroll down to the `USER OVERRIDES` comment section and put in the following:

```properties title="printer.cfg"
############################
### USER OVERRIDES
### Anything custom ...
############################

[bed_mesh]
probe_count: 11,11
speed: 100
```

This works for any section (including gcode macros) and any parameter. You only need to override the parts you're interested in. You can have the same section defined multiple times, they will all get merged by klipper when it reads the config, with the last parameters taking precedence. This makes for a super powerful way to build your config! Refer to the [klipper config reference](https://www.klipper3d.org/Config_Reference.html) for all the cool things you can do.

## Overriding pins

Many assume that to override a pin in some part of the documentation, they have to override the boards pin map. This is not the case and is counterproductive. The board pin alias only exists as a way to abstract the printer config from the control board, you don't need to care about this abstraction when configuring your own printer, just use the boards pin names directly. For example, let's say i want to change my controller_fan pin to `PA8`. All i would have to do is this:

```properties title="printer.cfg"
############################
### USER OVERRIDES
### Anything custom ...
############################

[controller_fan controller_fan]
pin: PA8
```

Now the controller fan will use PA8 instead of whatever is configured in the board pin map. Easy!
