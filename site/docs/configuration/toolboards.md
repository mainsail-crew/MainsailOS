---
sidebar_position: 2
---

# Toolboard Configuration

RatOS supports multiple toolboards connected via USB. They can be flashed initially through the configurator, and will automatically get flashed when klipper is updated. To configure your toolboard, you need to uncomment your board and features in the toolboard section in `printer.cfg` near the bottom, just before the user overides section.

# What about CAN?

No CAN do. RatOS does not provide any means of setting up a CAN connection to your toolboard. At this point for this use case, CAN has no benefits and is harder to use. See [No, you don't want to use CAN](/blog/no-you-dont-want-to-use-can) for more details on why CAN isn't the default protocol in RatOS. Besides the points listed in that blog post, CAN devices cannot be identified automatically, which violates RatOS' design principle.

If, despite all this, still want to use CAN, you can do so manually just like every other klipper installation.

# Wiring

Because we use USB we need to take extra care to secure our wiring, it is **imperative** to make sure that the USB-C connector cannot move. Generally this is a lot easier to achieve with the "42" size variety of toolboards than "36". There are several mounts for EVA on printables for inspiration, just make sure you use one where you can tie down the usb connector and cable. If you want a gucci cable, 3do.eu has a nice flexible FEP/Silicone sleeved USB-C cable rated for up to 200c in various lengths. To keep the umbilical nice and straight, pianowire does a great job. The bigger the size of your printer the thicker a wire you need, for reference a 0.8mm piano wire is perfect on a 400mm.

# Toolboard accelerometer

Just like all toolboard pins have their name prefixed by `toolboard:`, the onboard accelerometer has it's own name to. To reference it use `adxl345 toolboard`, for example in `MEASURE_AXIS_NOISE` you would add the chip name like this: `MEASURE_AXIS_NOISE CHIP="adxl345 toolboard"`.
