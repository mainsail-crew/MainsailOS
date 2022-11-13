---
sidebar_label: Spider v1.1
---

# Fysetc Spider v1.1

## Wiring

![Fysetc Spider V1.1 Wiring Diagram](_media/spider-11-wiring.png)

:::danger If you use the Ratrig endstop switches and cables, do **not** blindly plug them in to your Spider as doing this will short the board's 3.3V power rail.
You will probably have to swap the outer two wires (red and white) on the board end of the cable but double check to make sure.
:::

:::caution
If you have been testing your Spider without the stepper drivers plugged in, there is a chance that you'll blow the 3.3V voltage regulator on the board if you do not discharge the capacitors before connecting the drivers. The lesson here is don't power up the Spider without the stepper drivers plugged in. Please read https://github.com/FYSETC/FYSETC-SPIDER/blob/main/Spider%203.3v%20issue.md
:::

:::caution
Before connecting a probe **check** the probe voltage selector jumper.
:::

![Fysetc Spider V1.1 Probe Voltage Selector](_media/Probe_Voltage.png)

### Connection to your Pi

While the Spider can connect to your Pi via it's UART this is not
supported by RatOS as standard and will require manual firmware
configuration.

The normal RatOS connection is via USB as this allows new versions
of Klipper to be uploaded without needing an SDCard. You can, of
course, power the Pi from your Spider whichever form of connection you
use or if you use a dedicated Pi Power Supply you can shut down your
Spider while leaving the Pi running.

## Firmware installation

Follow the steps in the RatOS Configurator at [http://RatOS.local/configure?step=1](http://RatOS.local/configure?step=1).

## Setup

If you're going through initial setup please continue in the [installation guide](installation.md#setup)

## ADXL345 Connection

In your printer.cfg uncomment the following:

    #   For ADXL345
    [resonance_tester]
    accel_chip: adxl345
    # Change the following to the centre of your bed.
    probe_points: 200,200,20

Connect the ADXL345 to the Spider like so:

    Spider         ADXL345
    5V             VCC
    GND            GND
    MISO           SDO
    MOSI           SDA
    SCK            SCL
    CS             CS

![Fysetc Spider V1.1 ADXL Wiring](_media/SpiderADXL-Wiring.png)

See the Fysetc wiring plan for details: https://github.com/FYSETC/FYSETC-SPIDER/blob/main/images/Spider_V1.0_Pinout.jpg

:::info
You might have to disconnect the ADSL345 from your Spider while you are uploading firmware using the SD Card.
:::

### Undervoltage errors

If you are using the Fysetc TMC2209 step-sticks and you're getting Undervoltage errors from the stepper drivers make sure to either fully disable or enable stealthchop.

To completely disable stealthchop add this to the "### USER OVERRIDES" section of printer.cfg for each driver on your printer:

```properties
    [tmc2209 stepper_x]
    stealthchop_threshold: 0
```

You can also enable stealthchop instead, like so:

```properties
    [tmc2209 stepper_x]
    stealthchop_threshold: 9999999
```

Klipper recommends using either stealthchop or spreadcycle for TMC drivers: https://www.klipper3d.org/TMC_Drivers.html
