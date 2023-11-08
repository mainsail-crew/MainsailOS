# Steps to do

-   Kiss your girlfriend/boyfriend
-   Thank her/him for being patient with your hobby
-   Flash the mcu

## How to flash the mcu?

-   Copy over the `config` file from `Firmware-config`

```bash
cp -v ~/printer_data_config/Firmware-config/btt-skrpico-v1.0 ~/klipper/.config
```

-   Run firmware build process by

```bash
cd ~/klipper
make -j$(nproc)
```

-   Flash firmware to mcu
    Mount bla fooo ....

---

**Normally, you don't need to reboot, but for the sake of completness, please reboot once!**
