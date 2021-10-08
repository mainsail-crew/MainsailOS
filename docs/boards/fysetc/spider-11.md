# Fysetc Spider v1.1

## Wiring
![Fysetc Spider V1.1 Wiring Diagram](_media/spider-11-wiring.png)

!> If you have been testing your Spider without the stepper drivers plugged in, there is a chance that you'll blow the 3.3V voltage regulator on the board if you do not discharge the capacitors before connecting the drivers. The lesson here is don't power up the Spider without the stepper drivers plugged in. Please read https://github.com/FYSETC/FYSETC-SPIDER/blob/main/Spider%203.3v%20issue.md

!> If you use the Ratrig endstop switches and cables, do **not** blindly plug them in to your Spider as doing this will short the board's 3.3V supply rail.  You will probably have to swap the outer two wires (red and white) on the board end of the cable but double check this.

!> Before connecting a probe **check** the probe voltage selector jumper.

![Fysetc Spider V1.1 Probe Voltage Selector](_media/Probe_Voltage.png)

### Connection to your Pi

While the Spider can connect to your Pi via it's UART this is not
supported by V-Core OS as standard and will require manual firmware
configuration.

The normal V-Core OS connection is via USB as this allows new versions
of Klipper to be uploaded without needing an SDCard.  You can, of
course, power the Pi from your Spider whichever form of connection you
use or if you use a dedicated Pi Power Supply you can shut down your
Spider while leaving the Pi running.

## Firmware installation

For the first time install of Klipper onto the Spider; there are two
methods.  With an SD Card or via SSH(PuTTY)/USB.  

For a first time install, the SD Card method is suggested as being the
easiest.

### via SD Card

Copy the 'firmware-fysetc-spider.bin' file found on 
[V-CoreOS Releases Page](https://github.com/Rat-Rig/V-CoreOS/releases)
to a file named 'firmware.bin' on your SD Card.

Power off your Spider.  Insert the SD Card created above and power the
Spider back on.  The upload should take a few seconds and a LED by the
SDCard slot should flash while this is happening.

When complete, power off your Spider and remove the SD Card (press to
release as it's a latching style SD Card socket).

For more information; this is documented on the Fysetc pages:
https://github.com/FYSETC/FYSETC-SPIDER#42-Klipper

!> If you have an ADXL345 connected to your Spider as shown below, this
must be disconnected from your Spider to avoid conflicts with the SD
Card while loading the firmware.

### via SSH(PuTTY)/USB

While the SD Card method described above is the easiest, users that are
comfortable with SSH/PuTTY may prefer this more advanced method.

Fysetc provide instructions on installing Klipper here:
https://github.com/FYSETC/FYSETC-SPIDER#42-Klipper but some parts of
that are less clear than one might wish so here is the sequence that
worked for the author.

Make sure your board is connected to the Pi (USB-C on the Spider, USB-A
on the Pi).  Connect with SSH (PuTTy for Windows users) to the Pi (login
pi, password raspberry if you did not change the defaults).

![Fysetc Spider V1.1 BT0 Jumper](_media/BT0-jumper.png)

Connect a jumper between 3.3V and BT0 on the Spider as shown above.

Press the reset button on the Spider.

On the Pi, run the following command:

	dfu-util --list

You should see a list of DFU devices.  This is your Spider ready to have
the firmware uploaded.

Build the firmware which is covered here: https://rat-rig.github.io/V-CoreOS/#/manual-firmware-compilation

Once the firmware is built on the Pi run:

	sudo service klipper stop
	dfu-util -a 0 -s 0x08000000:leave -D ~/klipper/out/klipper.bin

You should see the firmware being written to your Spider.

Now remove the jumper between 3.3V and BT0 on the Spider.  Press the reset button on the Spider.

Run "lsusb" on the Pi and you should see a device by the name "OpenMoko, Inc.". This is your Spider running Klipper.

run the command "sudo service klipper start". V-CoreOS should now be able to communicate with your Spider.

### Klipper Updates

Sometimes klipper makes changes to the microcontroller code and thus
your Spider need to be reflashed with new firmware.  You can do that in 2
ways.

The updates can be installed with an SD Card (same method as
the first install described above) or over a Pi/Spider USB connection from V-CoreOS
using SSH(PuTTY) and the provided
~/klipper_config/config/boards/fysetc-spider/make-and-flash-mcu.sh
command so you don't need to fiddle around with SD Cards.

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

!> Disconnect the ADSL345 from your Spider while you are uploading firmware using the SD Card.

## Mini 12864 Display Connection

The Mini 12864 should be connected to the EXP1 & EXP2 ports on the
Spider.  If you have a version 1.0 board then be aware that the ports
were wrongly labeled on the board's silkscreen.  This was corrected on
the V1.1 board.

In your printer.cfg add the following:

	# Support for a 12864 display attached to the Spider
	[display]
	lcd_type: uc1701
	cs_pin: EXP1_3
	spi_software_mosi_pin: PA7
	spi_software_miso_pin: PA6
	spi_software_sclk_pin: PA5
	a0_pin: EXP1_4
	rst_pin: EXP1_5
	encoder_pins: ^EXP2_5, ^EXP2_3
	click_pin: ^!EXP1_2
	contrast: 63
	menu_reverse_navigation: true
	#
	[output_pin beeper]
	pin: EXP1_1
	#
	[neopixel fysetc_mini12864]
	pin: EXP1_6
	chain_count: 3
	color_order: RGB
	initial_RED: 0.0
	initial_GREEN: 1.0
	initial_BLUE: 0.0
	#   Set RGB values on boot up for each Neopixel. 
	#   Index 1 = display, Index 2 and 3 = Knob
	[delayed_gcode setdisplayneopixel]
	initial_duration: 1
	gcode:
		SET_LED LED=fysetc_mini12864 RED=1 GREEN=0 BLUE=0 INDEX=2 TRANSMIT=0
		SET_LED LED=fysetc_mini12864 RED=1 GREEN=0 BLUE=0 INDEX=3 TRANSMIT=0
		SET_LED LED=fysetc_mini12864 RED=0 GREEN=1 BLUE=0 INDEX=1


## Known Problems

### Can't open /dev/fysetc-spider

If V-CoreOS complains that it can't open "/dev/fysetc-spider" run the following command on your Pi:

	sudo ln -s /home/pi/klipper_config/config/boards/fysetc-spider/*.rules /etc/udev/rules.d/

Then disconnect the USB cable, reconnect it and /dev/fysetc-spider should exist. You only need to do this once.

### Undervoltage errors

If you are using the Fysetc TMC2209 step-sticks and performance mode; turn off stealthchop for the X & Y motors to avoid random Undervoltage errors.


Add this to the "### USER OVERRIDES" section of printer.cfg:

	[tmc2209 stepper_x]
	stealthchop_threshold: 0

	[tmc2209 stepper_y]
	stealthchop_threshold: 0

You may also see this happen for the Z motors although it's less likely. If so, just turn on stealthchop for them like so:

	[tmc2209 stepper_z]
	stealthchop_threshold: 999999

	[tmc2209 stepper_z1]
	stealthchop_threshold: 999999

	[tmc2209 stepper_z2]
	stealthchop_threshold: 999999


Klipper recommends using either stealthchop or spreadcycle for TMC drivers: https://www.klipper3d.org/TMC_Drivers.html


