# Includes & Overrides

RatOS uses a modular configuration that heavily takes advantage of the config file include and merge logic in Klipper. For this reason, the order of includes and overrides are very important, do **not** change the order of the configuration unless you know what you're doing.

:::danger
Do **NOT** edit the files inside the `config/` folder. These files are controlled by RatOS and will be updated when the RatOS package is updated.
:::

You can override any setting in RatOS, to do so you just copy the section and the parameter you need to change, and paste it in your printer.cfg after the related config file has been loaded. Let's say we wanted to change the current the extruder motor. If we navigate to `config/printers/v-core-3/steppers.cfg` we'll see this section:

```properties
[tmc2209 extruder]
uart_pin: e_uart_pin
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

This works for any section (including gcode macros) and any parameter. You only need to override the parts you're interested in. Imagine that each `[include]` section is simply replaced by the contents of the included file. You can have the same section defined multiple times, they will all get merged by klipper when it reads the config, with the last parameters taking precedence. This makes for a super powerful way to build your config! Refer to the [klipper config reference](https://www.klipper3d.org/Config_Reference.html) for all the cool things you can do.
