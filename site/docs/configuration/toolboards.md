---
sidebar_position: 2
---

# Toolboard Configuration

RatOS supports multiple toolboards connected via USB. They can be flashed initially through the configurator, and will automatically get flashed when klipper is updated. To configure your toolboard, you need to uncomment your board and features in the toolboard section in `printer.cfg` near the bottom, just before the user overides section.

# What about CAN?

No CAN do. RatOS does not provide any means of setting up a CAN connection to your toolboard. At this point, CAN has no benefits and is harder to use. See [No, you don't want to use CAN](/blog/no-you-dont-want-to-use-can) for more details on why Mikkel chose not to support CAN. Besides the points listed in that blog post, CAN devices cannot be identified automatically, which violates RatOS' design principle.

# Toolboard accelerometer

Just like all toolboard pins have their name prefixed by `toolboard:`, the onboard accelerometer has it's own name to. To reference it use `adxl345 toolboard`, for example in `MEASURE_AXIS_NOISE` you would add the chip name like this: `MEASURE_AXIS_NOISE CHIP="adxl345 toolboard"`.
