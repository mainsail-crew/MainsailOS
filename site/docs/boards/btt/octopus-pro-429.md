---
sidebar_label: Octopus Pro 429
---

# BIGTREETECH Octopus Pro STM32F429

:::caution Only Partial support
This board is currently not recommended, as it cannot be flashed automatically through USB, that means all firmware updates have to be done by manually moving an SD card back and forth. It is recommended to get the Octopus Pro 446 instead. RatOS compiles the firmware binary for you each time klipper is updated (while the Octopus Pro 429 is connected), you can find the most recent firmware in the Mainsail Machine page under the `firmware_binaries` folder). Automatic flashing may be possible in the future if SDIO support is implemented in klipper. See this thread: https://github.com/Klipper3d/klipper/pull/4881#issuecomment-962596510 for more info.
:::

## Wiring

![BTT Octopus Pro STM32F429 Wiring Diagram](_media/octopus-pro-wiring.png)
[Open Full Size Image](_media/octopus-pro-wiring-full.png)

:::danger if you use the Ratrig endstop switches and cables, do **not** blindly plug them in to your Octopus as doing this will short the board's 5V power rail.
You will probably have to swap the outer two wires (red and white) on the board end of the cable but double check to make sure your cables match the wiring diagram in both ends.
Orders shipped after October 2022 should have the correct cables (the connectors on the new cables are white).
:::

:::info Jumpers
![Jumper Symbol](_media/jumper-symbol.svg) A green square with triangles inside is where you would place a jumper,
remove all jumpers on the board that are not marked by this symbol.
:::

### Jumpers

The jumpers above the stepper drivers switches stepper driver input power between V_MOT and VIN (ie, board power terminals and motor power terminals).
In the configuration shown in the image above, the MOTOR power isn't connected because the jumpers are set to use the board power (VIN).
If you wanted to use 48V for example, you would connect your 48V psu to the motor power terminal and switch those jumpers to the other position to use V_MOT instead. Of course you shouldn't do this unless you use high voltage capable 5160 drivers.

## Firmware installation

:::caution Use a proper cable
Make sure your board is connected to the Pi **via the provided USB-C cable** (USB-C on the Octopus, USB-A on the Pi).
:::

Follow the steps in the RatOS Configurator at [http://RatOS.local/configure?step=1](http://RatOS.local/configure?step=1).

## I updated klipper and now i get an error!

When you update klipper you might see an error that looks like this:

![Firmware version mismatch between host and guest](/img/firmware_version_mismatch.png)

This is because klipper made changes to a part of the MCU firmware that we use, and the Octopus Pro 429 cannot be flashed automatically over USB. Klipper is telling us that the version of klipper running on the Pi is newer than the version running on the MCU. To fix this, we have to flash the board with a new version of the firmware, Follow the steps in the RatOS Configurator at [http://RatOS.local/configure?step=1](http://RatOS.local/configure?step=1).
