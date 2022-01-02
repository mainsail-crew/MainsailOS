---
sidebar_label: SKR Pro v1.2
---

# BIGTREETECH SKR Pro v1.2

## Jumper configuration

![SKR Pro 1.2 Jumpers](_media/skr-pro-12-jumpers.png)

## Stepper Pins

:::info
To use physical endstops on the SKR Pro you need to cut the diag pins from your X and Y stepper drivers. This will prevent you from using sensorless homing. If you later change your mind, you can swap X and Y with 2 of the Z steppers.
![SKR Pro 1.2 Stepper Pins](_media/skr-pro-12-stepper-pins.png)
![SKR Pro 1.2 Stepper Pins](_media/skr-pro-12-stepper-pins-alt.png)
:::

## Wiring

![SKR Pro 1.2 Wiring Diagram](_media/skr-pro-12-wiring.png)
:::danger if you use the Ratrig endstop switches and cables, do **not** blindly plug them in to your SKR Pro 1.2 as doing this will short the board's 3.3V power rail.
You will probably have to swap the outer two wires (red and white) on the board end of the cable but double check to make sure.
:::

## Zoomed view of VIN

![SKR Pro 1.2 Stepper Pins](_media/skr-pro-12-vin.png)

## Zoomed view of endstops and probes

:::info Inductive Probes
You can optionally use an inductive probe, in that case the BLTouch header can be used as shown below. 6V - 36V probes will require custom wiring - do not plug more than 5V into the signal pin on the board.
:::
![SKR Pro 1.2 Stepper Pins](_media/skr-pro-12-endstops.png)

## ADXL345

:::info
In Klipper you can use an ADXL345 accelerometer chip to automatically tune your Input Shaper settings. This works out of the box in RatOS if you wire it to the SPI port on the far right side of the SKR Pro 1.2.
:::
![SKR Pro 1.2 Stepper Pins](_media/skr-pro-12-ADXL345-top-down.png)
![SKR Pro 1.2 Stepper Pins](_media/skr-pro-12-ADXL345-angled.png)

## Firmware installation

Download the `firmware-btt-skr-pro-12.bin` from the `firmware_binaries` folder found on the Machine page of [Mainsail](http://RatOS.local/), copy it onto the SD card that goes into your control board and call it `firmware.bin`, then insert the SD card in to the control board. Here are the steps in chronological order:

 1. Navigate to [http://RatOS.local/](http://RatOS.local/)
 2. Open Machine page
 3. Open `firmware_binaries` folder
 4. Download `firmware-btt-skr-pro-12.bin`
 5. Format the sd card for your board to FAT16 (sometimes just called FAT).
 6. Copy `firmware-btt-skr-pro-12.bin` onto the sd card for your board
 7. Rename `firmware-btt-skr-pro-12.bin` to `firmware.bin`
 8. Safely eject the SD card through your operating system.
 9. Physically take out the sd card and insert it into your control board.
 10. Power cycle your printer or control board. Remember to shut the pi down properly before you cut power to your Pi (you can do that through Mainsail using the dropdown menu in the top right corner).
 11. Verify that the firmware has been flashed and **put the sd card back in the board after successful flashing**.

:::tip
You can verify if the board flashed correctly by checking if the firmware.bin file has been changed to firmware.CUR on the SD card. If you have trouble flashing your control board, start unplugging your wires beginning with the endstops, sometimes faulty wiring can cause the board to not boot properly.
:::

:::danger Make sure to leave the card in the board
It is **IMPORTANT** that you leave the SD card in the board for automatic firmware updates to work with the SKR Pro 1.2
:::

## Compiling and flashing the newest firmware via USB

:::caution
Requires that klipper firmware is already flashed, and that an SD card is inserted into your SKR Pro 1.2.
:::

:::tip
RatOS automatically flashes the newest firmware to your
SKR Pro 1.2 when klipper is updated (if the klipper firmware has previously been flashed and an SD card is installed).
The steps below are only necessary if that fails and you get a klipper version mismatch error, and the firmware binary from the `firmware_binaries` folder in the Machine tab of mainsail does not work.
:::

To compile and flash the newest firmware to the board, you need to SSH into the pi using something like PuTTy or `ssh pi@RatOS.local` via the commandline on OS X and Linux machines. Execute `sudo ~/klipper_config/config/boards/btt-skr-pro-12/make-and-flash-mcu.sh` and the Pi will compile the klipper firmware and flash the board for you.
