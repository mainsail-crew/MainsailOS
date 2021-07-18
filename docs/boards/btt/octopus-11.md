# Big Tree Tech Octopus v1.1

## Wiring
![BTT Octopus V1.1 Wiring Diagram](_media/octopus-11-wiring.png)

## Firmware installation

Move the `firmware-octopus-11.bin` file from the release page to the SD card that goes into your control board and call it `firmware.bin`, then insert the SD card in to the control board.

?> 
You can verify if the board flashed correctly by checking if the firmware.bin file has been changed to firmware.CUR on the SD card. If you have trouble flashing the motherboard, start unplugging your wires beginning with the endstops, sometimes faulty wiring can cause the board to not boot properly.

## Firmware upgrade

Sometimes klipper makes changes to the microcontroller code and thus your MCU need to be reflashed with new firmware. You can do that in 2 ways.

### SD Card
If you're not used to the command line or haven't used SSH before, the easiest way is to download the new firmware file from the github release page. New firmware files will uploaded to the latest release when the klipper firmware changes, this is a manual process though and might not be immediately available. Therefore the recommended method is [flashing via usb](#flashing-via-usb)

?> 
You can verify if the board flashed correctly by checking if the firmware.bin file has been changed to firmware.CUR on the SD card. If you have trouble flashing the motherboard, start unplugging your wires beginning with the endstops, sometimes faulty wiring can cause the board to not boot properly.

### Flashing via USB (Recommended)
Another option is to SSH into the pi using something like PuTTy or `ssh pi@v-coreos.local` via the commandline on OS X and Linux machines. Execute `~/klipper_config/config/boards/btt-octopus-11/make-and-flash-mcu.sh` and the Pi will compile the klipper firmware and flash the board for you. This has the benefit that it will always recompile the firmware to match your klipper version, so you are not reliant upon the V-CoreOS developers to upload a new firmware binary for you.