# Big Tree Tech SKR Pro V1.2
?> This page is incomplete, please refer to the [official V-Core 3 wiring diagram](https://v-core.ratrig.com/electronics/#skr-pro-12) and [V-CoreOS setup](https://v-core.ratrig.com/firmware/#v-coreos-klipper-firmware) for the time being.

## Firmware installation

Move the `firmware-skr-pro-12.bin` file from the release page to the SD card that goes into your control board and call it `firmware.bin`, then insert the SD card in to the control board.

## Compiling and flashing the newest firmware via USB
!> Requires an SD card in your SKR Pro 1.2.

To compile and flash the newest firmware to the board, you need to SSH into the pi using something like PuTTy or `ssh pi@v-coreos.local` via the commandline on OS X and Linux machines. Execute `~/klipper_config/config/boards/btt-skr-pro-12/make-and-flash-mcu.sh` and the Pi will compile the klipper firmware and flash the board for you.