---
sidebar_position: 2
---

# Toolboard Configuration

RatOS supports multiple toolboards connected via USB. They can be flashed initially through the configurator, and will automatically get flashed when klipper is updated. To configure your toolboard, you need to uncomment your board and features in the toolboard section in `printer.cfg` near the bottom, just before the user overides section.

# What about CAN?

No CAN do. RatOS does not provide any means of setting up a CAN connection to your toolboard. At this point, CAN has no benefits and is harder to use. See [No, you don't want to use CAN](/blog/no-you-dont-want-to-use-can) for more details on why Mikkel chose not to support CAN.
