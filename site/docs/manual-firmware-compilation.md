---
sidebar_position: 10
sidebar_label: Manual Firmware Compilation
---

# Manual klipper firmware compilation

:::info
RatOS automatically compiles firmware for your board when klipper is updated, if that fails, the [RatOS Configurator](http://ratos.local/configure?step=1) will assist you in flashing your board in one of multiple ways. You shouldn't have to do this unless something is severely broken.
:::

If you need to compile the firmware for your board yourself, here's how you do it.

## SSH into the Raspberry Pi

You're need to log into the Pi via SSH. The default username is `pi` and the password is `raspberry` (sidenote: it's a good idea to change this via `sudo raspi-config`). If you're on linux or Mac OS, you can do this by opening a terminal and type:

```bash
ssh pi@ratos.local
```

Now navigate to the klipper directory:

```bash
cd ~/klipper
```

The configuration klipper needs to compile the firmware for your board is stored in `~/printer_data/config/RatOS/boards/[BOARD_NAME]/firmware.config`. To list the board names execute the following command:

```bash
ls -la ~/printer_data/config/RatOS/boards
```

Let's say we need to compile the firmware for the octopus. We then need to copy the configuration file from `~/printer_data/config/RatOS/boards/btt-octopus-11/firmware.config`

```bash
cp -f ~/printer_data/config/RatOS/boards/btt-octopus-11/firmware.config ~/klipper/.config
```

Now we're ready to compile the firmware!

```bash
make olddefconfig
make clean
make
```

## Download the firmware from the Pi

Now klipper has compiled it's firmware to `~/klipper/out/klipper.bin`. We can download that to our machine via `scp` or [WinSCP](https://winscp.net/eng/download.php) (for windows users).

Linux and Mac OS users can use scp from their local machines like this:

```bash
scp pi@ratos.local:klipper/out/klipper.bin firmware.bin
```
