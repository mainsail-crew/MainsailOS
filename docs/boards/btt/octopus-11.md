# Big Tree Tech Octopus v1.1

## Wiring
![BTT Octopus V1.1 Wiring Diagram](_media/octopus-11-wiring.png)

## Firmware installation

Move the `firmware-octopus-11.bin` file from the release page to the SD card that goes into your control board and call it `firmware.bin`, then insert the SD card in to the control board.

### Firmware installation without an SD-Card
Another option is to jump the boot0 pins on the board, and click the reset button. Then SSH into the pi using something like PuTTy or `ssh pi@v-coreos.local` via the commandline on OS X and Linux machines. Execute `~/klipper_config/config/boards/btt-octopus-11/make-and-flash-mcu.sh` and the Pi will compile the klipper firmware and flash the board for you. When done, power off the board and remove the boot0 jumper.

## Firmware upgrade

Sometimes klipper makes changes to the microcontroller code and thus your MCU need to be reflashed with new firmware. There are a couple of ways to do this on the Octopus.

### SD Card
The easiest way is to download the new firmware file from the github release page. New firmware files will uploaded to the latest release when the klipper firmware changes.

?> 
You can verify if the board flashed correctly by checking if the firmware.bin file has been changed to firmware.CUR on the SD card. If you have trouble flashing the motherboard, start unplugging your wires beginning with the endstops, sometimes faulty wiring can cause the board to not boot properly.

### Flashing via USB
Another option is to jump the boot0 pins on the board, and click the reset button. Then SSH into the pi using something like PuTTy or `ssh pi@v-coreos.local` via the commandline on OS X and Linux machines. Execute `~/klipper_config/config/boards/btt-octopus-11/make-and-flash-mcu.sh` and the Pi will compile the klipper firmware and flash the board for you.

!>
There's a few gotcha's to flashing the board via USB. You can leave the jumper permanently in the board, but each time it's powered off and back on you will need to click the reset switch and reflash the board to make it exit DFU mode and be useable. Unfortunately this is an issue with the bootloader that BTT chose to ship with the board, we hope this gets better in the future. No matter what, you'll need to physical interact with the board at some point, be sure to mount it so that it's accessible to you.